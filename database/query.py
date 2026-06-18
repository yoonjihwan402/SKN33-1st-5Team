import mysql.connector
from mysql.connector import Error

# ── DB 연결 설정 ──────────────────────────────────────────────
DB_CONFIG = {
    "host": "localhost",
    "user": "skn_ai",
    "password": "1234",
    "database": "cardb",
}


def get_connection():
    """DB 커넥션 반환"""
    return mysql.connector.connect(**DB_CONFIG)


# ── 브랜드 (Brand) ────────────────────────────────────────────

def get_all_brands():
    """전체 브랜드 조회"""
    query = "SELECT brand_id, brand_name FROM Brand ORDER BY brand_id"
    with get_connection() as conn:
        with conn.cursor(dictionary=True) as cur:
            cur.execute(query)
            return cur.fetchall()


def get_brand_by_id(brand_id: int):
    """브랜드 ID로 단건 조회"""
    query = "SELECT brand_id, brand_name FROM Brand WHERE brand_id = %s"
    with get_connection() as conn:
        with conn.cursor(dictionary=True) as cur:
            cur.execute(query, (brand_id,))
            return cur.fetchone()


# ── 모델 (Car_Model) ──────────────────────────────────────────

def get_models_by_brand(brand_id: int):
    """특정 브랜드의 모델 목록 조회"""
    query = """
        SELECT cm.model_id, cm.model_name, b.brand_name
        FROM Car_Model cm
        JOIN Brand b ON cm.brand_id = b.brand_id
        WHERE cm.brand_id = %s
        ORDER BY cm.model_id
    """
    with get_connection() as conn:
        with conn.cursor(dictionary=True) as cur:
            cur.execute(query, (brand_id,))
            return cur.fetchall()


def get_all_models():
    """전체 모델 + 브랜드명 조회"""
    query = """
        SELECT cm.model_id, b.brand_name, cm.model_name
        FROM Car_Model cm
        JOIN Brand b ON cm.brand_id = b.brand_id
        ORDER BY b.brand_name, cm.model_name
    """
    with get_connection() as conn:
        with conn.cursor(dictionary=True) as cur:
            cur.execute(query)
            return cur.fetchall()


# ── 월별 등록 (Monthly_Registration) ─────────────────────────

def get_monthly_reg_by_model(model_id: int, year: int = None):
    """모델별 월별 등록 수 조회 (연도 필터 선택)"""
    if year:
        query = """
            SELECT mr.year, mr.month, mr.monthly_reg_count,
                   cm.model_name, mr.brand_name
            FROM Monthly_Model_Registration mr
            JOIN Car_Model cm ON mr.model_id = cm.model_id
            WHERE mr.model_id = %s AND mr.year = %s
            ORDER BY mr.year, mr.month
        """
        params = (model_id, year)
    else:
        query = """
            SELECT mr.year, mr.month, mr.monthly_reg_count,
                   cm.model_name, mr.brand_name
            FROM Monthly_Model_Registration mr
            JOIN Car_Model cm ON mr.model_id = cm.model_id
            WHERE mr.model_id = %s
            ORDER BY mr.year, mr.month
        """
        params = (model_id,)

    with get_connection() as conn:
        with conn.cursor(dictionary=True) as cur:
            cur.execute(query, params)
            return cur.fetchall()


def get_annual_reg_by_brand(year: int):
    """연도별 브랜드별 연간 총 등록 수"""
    query = """
        SELECT mr.brand_name,
               SUM(mr.monthly_reg_count) AS total_reg
        FROM Monthly_Model_Registration mr
        WHERE mr.year = %s
        GROUP BY mr.brand_name
        ORDER BY total_reg DESC
    """
    with get_connection() as conn:
        with conn.cursor(dictionary=True) as cur:
            cur.execute(query, (year,))
            return cur.fetchall()


def get_top_models_total(limit: int = 10, brand_name: str = None):
    """전체(또는 특정 브랜드) 모델 등록 수 합산 TOP N"""
    if brand_name and brand_name != "전체":
        query = """
            SELECT cm.model_name, mr.brand_name,
                   SUM(mr.monthly_reg_count) AS total_reg
            FROM Monthly_Model_Registration mr
            JOIN Car_Model cm ON mr.model_id = cm.model_id
            WHERE mr.brand_name = %s
            GROUP BY mr.model_id, cm.model_name, mr.brand_name
            ORDER BY total_reg DESC
            LIMIT %s
        """
        params = (brand_name, limit)
    else:
        query = """
            SELECT cm.model_name, mr.brand_name,
                   SUM(mr.monthly_reg_count) AS total_reg
            FROM Monthly_Model_Registration mr
            JOIN Car_Model cm ON mr.model_id = cm.model_id
            GROUP BY mr.model_id, cm.model_name, mr.brand_name
            ORDER BY total_reg DESC
            LIMIT %s
        """
        params = (limit,)
    with get_connection() as conn:
        with conn.cursor(dictionary=True) as cur:
            cur.execute(query, params)
            return cur.fetchall()


def get_top_models_by_month(year: int, month: int, limit: int = 10):
    """특정 연월 등록 수 상위 모델"""
    query = """
        SELECT cm.model_name, mr.brand_name, mr.monthly_reg_count
        FROM Monthly_Model_Registration mr
        JOIN Car_Model cm ON mr.model_id = cm.model_id
        WHERE mr.year = %s AND mr.month = %s
        ORDER BY mr.monthly_reg_count DESC
        LIMIT %s
    """
    with get_connection() as conn:
        with conn.cursor(dictionary=True) as cur:
            cur.execute(query, (year, month, limit))
            return cur.fetchall()


# ── 연령대별 통계 (Age_Registration) ─────────────────────────

def get_age_reg_by_brand(brand_id: int):
    """브랜드별 연령대 통계"""
    query = """
        SELECT ar.age_group, ar.ranking, ar.age_reg_count, b.brand_name
        FROM Age_Registration ar
        JOIN Brand b ON ar.brand_id = b.brand_id
        WHERE ar.brand_id = %s AND ar.gubun = '브랜드'
        ORDER BY ar.ranking
    """
    with get_connection() as conn:
        with conn.cursor(dictionary=True) as cur:
            cur.execute(query, (brand_id,))
            return cur.fetchall()


def get_age_reg_by_model(model_id: int):
    """모델별 연령대 통계"""
    query = """
        SELECT ar.age_group, ar.ranking, ar.age_reg_count,
               cm.model_name, b.brand_name
        FROM Age_Registration ar
        JOIN Car_Model cm ON ar.model_id = cm.model_id
        JOIN Brand b ON cm.brand_id = b.brand_id
        WHERE ar.model_id = %s AND ar.gubun = '모델'
        ORDER BY ar.ranking
    """
    with get_connection() as conn:
        with conn.cursor(dictionary=True) as cur:
            cur.execute(query, (model_id,))
            return cur.fetchall()


def get_top_brands_by_age_group(age_group: str, limit: int = 5):
    """특정 연령대에서 등록 수 상위 브랜드"""
    query = """
        SELECT b.brand_name, ar.ranking, ar.age_reg_count
        FROM Age_Registration ar
        JOIN Brand b ON ar.brand_id = b.brand_id
        WHERE ar.age_group = %s AND ar.gubun = '브랜드'
        ORDER BY ar.ranking
        LIMIT %s
    """
    with get_connection() as conn:
        with conn.cursor(dictionary=True) as cur:
            cur.execute(query, (age_group, limit))
            return cur.fetchall()


# ── 성별 통계 (Gender_Registration) ───────────────────────────

def get_gender_reg_by_brand(brand_id: int):
    """브랜드별 성별 통계"""
    query = """
        SELECT gr.gender, gr.ranking, gr.gender_reg_count, b.brand_name
        FROM Gender_Registration gr
        JOIN Brand b ON gr.brand_id = b.brand_id
        WHERE gr.brand_id = %s AND gr.gubun = '브랜드'
        ORDER BY gr.gender, gr.ranking
    """
    with get_connection() as conn:
        with conn.cursor(dictionary=True) as cur:
            cur.execute(query, (brand_id,))
            return cur.fetchall()


def get_gender_reg_by_model(model_id: int):
    """모델별 성별 통계"""
    query = """
        SELECT gr.gender, gr.ranking, gr.gender_reg_count,
               cm.model_name, b.brand_name
        FROM Gender_Registration gr
        JOIN Car_Model cm ON gr.model_id = cm.model_id
        JOIN Brand b ON cm.brand_id = b.brand_id
        WHERE gr.model_id = %s AND gr.gubun = '모델'
        ORDER BY gr.gender, gr.ranking
    """
    with get_connection() as conn:
        with conn.cursor(dictionary=True) as cur:
            cur.execute(query, (model_id,))
            return cur.fetchall()


def get_top_brands_by_gender(gender: str, limit: int = 10):
    """특정 성별의 등록 수 상위 브랜드"""
    query = """
        SELECT b.brand_name, gr.ranking, gr.gender_reg_count
        FROM Gender_Registration gr
        JOIN Brand b ON gr.brand_id = b.brand_id
        WHERE gr.gender = %s AND gr.gubun = '브랜드'
        ORDER BY gr.ranking
        LIMIT %s
    """
    with get_connection() as conn:
        with conn.cursor(dictionary=True) as cur:
            cur.execute(query, (gender, limit))
            return cur.fetchall()


def get_top_models_by_age_group(age_group: str, limit: int = 10):
    """특정 연령대의 등록 수 상위 모델"""
    query = """
        SELECT cm.model_name, b.brand_name, ar.ranking, ar.age_reg_count
        FROM Age_Registration ar
        JOIN Car_Model cm ON ar.model_id = cm.model_id
        JOIN Brand b ON cm.brand_id = b.brand_id
        WHERE ar.age_group = %s AND ar.gubun = '모델'
        ORDER BY ar.ranking
        LIMIT %s
    """
    with get_connection() as conn:
        with conn.cursor(dictionary=True) as cur:
            cur.execute(query, (age_group, limit))
            return cur.fetchall()


def get_top_models_by_gender(gender: str, limit: int = 5):
    """특정 성별의 등록 수 상위 모델"""
    query = """
        SELECT cm.model_name, b.brand_name, gr.ranking, gr.gender_reg_count
        FROM Gender_Registration gr
        JOIN Car_Model cm ON gr.model_id = cm.model_id
        JOIN Brand b ON cm.brand_id = b.brand_id
        WHERE gr.gender = %s AND gr.gubun = '모델'
        ORDER BY gr.ranking
        LIMIT %s
    """
    with get_connection() as conn:
        with conn.cursor(dictionary=True) as cur:
            cur.execute(query, (gender, limit))
            return cur.fetchall()


# ── FAQ 검색 ──────────────────────────────────────────────────
# 실제 FAQ 테이블 컬럼: faq_id, brand_id, category, question, answer
# brand_id → Brand 테이블 JOIN 으로 brand_name 가져옴

def search_faq(keyword: str, brand_name: str = None, limit: int = 30):
    """키워드로 FAQ 검색. brand_name 필터 시 Brand JOIN 사용."""
    kw = f"%{keyword}%"

    if brand_name and brand_name != "전체":
        query = """
            SELECT f.faq_id,
                   COALESCE(b.brand_name, '공통') AS brand_name,
                   f.category,
                   f.question,
                   f.answer
            FROM FAQ f
            LEFT JOIN Brand b ON f.brand_id = b.brand_id
            WHERE b.brand_name = %s
              AND (f.category LIKE %s OR f.question LIKE %s OR f.answer LIKE %s)
            ORDER BY f.faq_id
            LIMIT %s
        """
        params = (brand_name, kw, kw, kw, limit)
    else:
        query = """
            SELECT f.faq_id,
                   COALESCE(b.brand_name, '공통') AS brand_name,
                   f.category,
                   f.question,
                   f.answer
            FROM FAQ f
            LEFT JOIN Brand b ON f.brand_id = b.brand_id
            WHERE f.category LIKE %s OR f.question LIKE %s OR f.answer LIKE %s
            ORDER BY f.faq_id
            LIMIT %s
        """
        params = (kw, kw, kw, limit)

    with get_connection() as conn:
        with conn.cursor(dictionary=True) as cur:
            cur.execute(query, params)
            return cur.fetchall()



def get_faq_columns_debug():
    """디버그용: FAQ 테이블 실제 컬럼 목록 반환"""
    with get_connection() as conn:
        with conn.cursor() as cur:
            cur.execute("SHOW COLUMNS FROM FAQ")
            return [row[0] for row in cur.fetchall()]


# ── 실행 예시 ─────────────────────────────────────────────────
if __name__ == "__main__":
    print("=== 전체 브랜드 ===")
    for row in get_all_brands():
        print(row)

    print("\n=== 2024년 1월 등록 수 상위 10 모델 ===")
    for row in get_top_models_by_month(2024, 1):
        print(row)

    print("\n=== 남성 등록 수 상위 5 모델 ===")
    for row in get_top_models_by_gender("남성"):
        print(row)