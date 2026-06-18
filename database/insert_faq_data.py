from pathlib import Path
import csv
import os

import mysql.connector

BASE_DIR = Path(__file__).resolve().parent

FAQ_CSV = BASE_DIR / "../faq_data/processed/all_faq_clean.csv"
# brand 테이블의 brand_id와 일치해야 합니다.
BRAND_ID_BY_NAME = {
    "기아": 1,
    "현대": 2,
    "테슬라": 3,
}

DB_CONFIG = {
    "host": os.getenv("MYSQL_HOST", "localhost"),
    "port": int(os.getenv("MYSQL_PORT", "3306")),
    "user": os.getenv("MYSQL_USER", "skn_ai"),
    "password": os.getenv("MYSQL_PASSWORD", "1234"),
    "database": os.getenv("MYSQL_DATABASE", "cardb"),
    "charset": "utf8mb4",
    "use_unicode": True,
}


def read_csv_rows(file_path):
    """UTF-8 BOM이 있는 CSV도 안전하게 읽고, 컬럼명/값의 공백을 정리합니다."""
    with file_path.open("r", encoding="utf-8-sig", newline="") as file:
        reader = csv.DictReader(file)
        return [
            {
                (key or "").strip(): (value or "").strip()
                for key, value in row.items()
            }
            for row in reader
        ]


def insert_faq(cursor, rows):
    """FAQ 테이블에 데이터를 삽입합니다."""
    sql = """
        INSERT INTO FAQ (brand_id, category, question, answer)
        VALUES (%s, %s, %s, %s)
    """
    count = 0
    for row in rows:
        brand_name = row.get("브랜드", "").strip()
        category   = row.get("카테고리", "").strip()
        question   = row.get("질문", "").strip()
        answer     = row.get("답변", "").strip()

        # 브랜드명으로 brand_id 조회, 없으면 NULL
        brand_id = BRAND_ID_BY_NAME.get(brand_name, None)

        if not question or not answer:
            print(f"  [SKIP] 질문 또는 답변이 비어있는 행 건너뜀: {row}")
            continue

        cursor.execute(sql, (brand_id, category, question, answer))
        count += 1

    return count


def main():
    print("=== FAQ 데이터 삽입 시작 ===")

    # CSV 읽기
    rows = read_csv_rows(FAQ_CSV)
    print(f"CSV 읽기 완료: {len(rows)}개 행")

    # DB 연결
    conn = mysql.connector.connect(**DB_CONFIG)
    cursor = conn.cursor()

    try:
        # 기존 데이터 초기화 (재실행 시 중복 방지)
        cursor.execute("DELETE FROM FAQ")
        print("기존 FAQ 데이터 초기화 완료")

        # 데이터 삽입
        count = insert_faq(cursor, rows)
        conn.commit()
        print(f"FAQ 삽입 완료: {count}개")

    except Exception as e:
        conn.rollback()
        print(f"[ERROR] 삽입 중 오류 발생: {e}")
        raise

    finally:
        cursor.close()
        conn.close()

    print("=== FAQ 데이터 삽입 완료 ===")


if __name__ == "__main__":
    main()
