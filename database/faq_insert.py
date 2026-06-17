from pathlib import Path
import csv
import os
import mysql.connector

# 💡 현재 파일의 위치를 기준으로 경로 설정
BASE_DIR = Path(__file__).resolve().parent

# 📂 FAQ CSV 파일 경로 (상황에 맞게 파일명을 수정하세요!)
FAQ_CSV = BASE_DIR / "../data/processed/all_faq_clean.csv"

# MySQL 연결 설정 (기존에 쓰시던 접속 정보로 변경 필수!)
DB_CONFIG = {
    "host": os.getenv("MYSQL_HOST", "localhost"),
    "port": int(os.getenv("MYSQL_PORT", "3306")),
    "user": os.getenv("MYSQL_USER", "skn_ai"),
    "password": os.getenv("MYSQL_PASSWORD", "1234"),  # 👈 본인 DB 비밀번호로 수정
    "database": os.getenv("MYSQL_DATABASE", "cardb"),
    "charset": "utf8mb4",
    "use_unicode": True,
}


def read_csv_rows(file_path):
    """UTF-8 BOM이 있는 CSV도 안전하게 읽고, 컬럼명/값의 공백을 정리합니다."""
    if not file_path.exists():
        print(f"❌ CSV 파일이 존재하지 않습니다: {file_path}")
        return []

    with file_path.open("r", encoding="utf-8-sig", newline="") as file:
        reader = csv.DictReader(file)
        return [
            {
                (key or "").strip(): (value or "").strip()
                for key, value in row.items()
            }
            for row in reader
        ]


def insert_faq_data(cursor):
    """FAQ CSV 데이터를 읽어와 DB의 FAQ 테이블에 적재합니다."""
    rows = read_csv_rows(FAQ_CSV)
    if not rows:
        return

    # 🔎 DB에 이미 들어있는 질문(question)들을 미리 싹 조회해서 중복 적재 방지 세트 구성
    cursor.execute("SELECT question FROM FAQ")
    existing_questions = set([row[0] for row in cursor.fetchall()])

    inserted = 0
    skipped_existing = 0

    for row in rows:
        # 💡 CSV 파일의 헤더 이름과 똑같이 맞춰줍니다.
        # (만약 CSV의 컬럼명이 '키워드', '질문', '답변', '출처'라면 오른쪽 글자를 그에 맞게 고치세요!)
        keyword = row.get("keyword") or row.get("브랜드")
        question = row.get("question") or row.get("질문")
        answer = row.get("answer") or row.get("답변")
        source_url = row.get("source_url") or row.get("카테고리") or None

        # 필수 값들이 비어있으면 데이터 오염 방지를 위해 패스
        if not keyword or not question or not answer:
            continue

        # 🛡️ 이미 똑같은 질문이 DB에 존재한다면 중복 저장하지 않고 스킵
        if question in existing_questions:
            skipped_existing += 1
            continue

        # 💾 FAQ 테이블은 faq_id가 AUTO_INCREMENT이므로 직접 id를 주지 않고 컬럼에서 제외합니다.
        sql = """
              INSERT INTO FAQ (keyword, question, answer, source_url)
              VALUES (%s, %s, %s, %s) \
              """
        cursor.execute(sql, (keyword, question, answer, source_url))

        # 새로 추가된 질문도 세트에 등록하여 반복문 내 중복 방지
        existing_questions.add(question)
        inserted += 1

    print(
        "[FAQ Table]",
        f"inserted={inserted}",
        f"skipped_existing={skipped_existing}"
    )


def main():
    connection = mysql.connector.connect(**DB_CONFIG)
    cursor = None


    try:
        cursor = connection.cursor()

        print("▶ FAQ 데이터 적재 시작...")
        insert_faq_data(cursor)

        connection.commit()
        print("🎉 FAQ CSV 데이터 삽입이 완벽하게 완료되었습니다.")

    except Exception as e:
        connection.rollback()
        print(f"❌ 오류가 발생하여 작업을 롤백했습니다: {e}")
        raise

    finally:
        if cursor is not None:
            cursor.close()
        connection.close()


if __name__ == "__main__":
    main()