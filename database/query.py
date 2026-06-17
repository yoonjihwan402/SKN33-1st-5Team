from pathlib import Path

import pandas as pd

try:
    from .db_connection import get_connection
except ImportError:
    get_connection = None


BASE_DIR = Path(__file__).resolve().parents[1]
PROCESSED_DIR = BASE_DIR / "data" / "processed"


def _read_sql(sql, params=None):
    if get_connection is None:
        return pd.DataFrame()

    conn = get_connection()
    if conn is None:
        return pd.DataFrame()

    try:
        return pd.read_sql(sql, conn, params=params)
    except Exception as exc:
        print(f"데이터 조회 중 오류 발생: {exc}")
        return pd.DataFrame()
    finally:
        conn.close()


def _read_csv(file_name):
    path = PROCESSED_DIR / file_name
    if not path.exists():
        return pd.DataFrame()
    return pd.read_csv(path, encoding="utf-8-sig")


def get_summary_metrics():
    sql = """
        SELECT
            COUNT(DISTINCT b.brand_id) AS brand_count,
            COUNT(DISTINCT cm.model_id) AS model_count,
            COALESCE(SUM(mr.monthly_reg_count), 0) AS total_registration,
            MIN(mr.year) AS min_year,
            MAX(mr.year) AS max_year
        FROM Brand b
        LEFT JOIN Car_Model cm ON b.brand_id = cm.brand_id
        LEFT JOIN Monthly_Registration mr ON cm.model_id = mr.model_id
    """
    df = _read_sql(sql)

    if not df.empty:
        return df.iloc[0].to_dict()

    fallback = _read_csv("danawa_model_clean.csv")
    if fallback.empty:
        return {
            "brand_count": 0,
            "model_count": 0,
            "total_registration": 0,
            "min_year": None,
            "max_year": None,
        }

    return {
        "brand_count": fallback["브랜드"].nunique(),
        "model_count": fallback["모델"].nunique(),
        "total_registration": int(fallback["판매량"].sum()),
        "min_year": int(fallback["년"].min()),
        "max_year": int(fallback["년"].max()),
    }


def get_brand_monthly_sales():
    sql = """
        SELECT
            mr.year AS year,
            mr.month AS month,
            b.brand_name AS brand_name,
            SUM(mr.monthly_reg_count) AS registration_count
        FROM Monthly_Registration mr
        JOIN Car_Model cm ON mr.model_id = cm.model_id
        JOIN Brand b ON cm.brand_id = b.brand_id
        GROUP BY mr.year, mr.month, b.brand_name
        ORDER BY mr.year, mr.month, b.brand_name
    """
    df = _read_sql(sql)
    if not df.empty:
        return df

    fallback = _read_csv("danawa_brand_clean.csv")
    if fallback.empty:
        return pd.DataFrame(columns=["year", "month", "brand_name", "registration_count"])

    return fallback.rename(
        columns={
            "년": "year",
            "월": "month",
            "브랜드": "brand_name",
            "판매량": "registration_count",
        }
    )


def get_brand_total_sales():
    df = get_brand_monthly_sales()
    if df.empty:
        return pd.DataFrame(columns=["brand_name", "registration_count"])

    return (
        df.groupby("brand_name", as_index=False)["registration_count"]
        .sum()
        .sort_values("registration_count", ascending=False)
    )


def get_top_models(limit=10, brand_name=None):
    params = []
    brand_filter = ""

    if brand_name and brand_name != "전체":
        brand_filter = "WHERE b.brand_name = %s"
        params.append(brand_name)

    sql = f"""
        SELECT
            b.brand_name AS brand_name,
            cm.model_name AS model_name,
            SUM(mr.monthly_reg_count) AS registration_count
        FROM Monthly_Registration mr
        JOIN Car_Model cm ON mr.model_id = cm.model_id
        JOIN Brand b ON cm.brand_id = b.brand_id
        {brand_filter}
        GROUP BY b.brand_name, cm.model_name
        ORDER BY registration_count DESC
        LIMIT %s
    """
    df = _read_sql(sql, [*params, limit])
    if not df.empty:
        return df

    fallback = _read_csv("danawa_model_clean.csv")
    if fallback.empty:
        return pd.DataFrame(columns=["brand_name", "model_name", "registration_count"])

    if brand_name and brand_name != "전체":
        fallback = fallback[fallback["브랜드"] == brand_name]

    return (
        fallback.groupby(["브랜드", "모델"], as_index=False)["판매량"]
        .sum()
        .rename(
            columns={
                "브랜드": "brand_name",
                "모델": "model_name",
                "판매량": "registration_count",
            }
        )
        .sort_values("registration_count", ascending=False)
        .head(limit)
    )


def get_age_brand_rank(age_group, limit=10):
    sql = """
        SELECT
            a.age_group AS age_group,
            b.brand_name AS brand_name,
            a.ranking AS ranking,
            a.age_reg_count AS registration_count
        FROM Age_Registration a
        JOIN Brand b ON a.brand_id = b.brand_id
        WHERE a.age_group = %s
          AND a.model_id IS NULL
        ORDER BY a.ranking ASC
        LIMIT %s
    """
    df = _read_sql(sql, [age_group, limit])
    if not df.empty:
        return df

    fallback = _read_csv("nice_age_clean.csv")
    if fallback.empty:
        return pd.DataFrame(columns=["age_group", "brand_name", "ranking", "registration_count"])

    df = fallback[(fallback["구분"] == age_group) & (fallback["타입"] == "브랜드")]
    return (
        df[["구분", "브랜드명", "순위", "등록량"]]
        .rename(
            columns={
                "구분": "age_group",
                "브랜드명": "brand_name",
                "순위": "ranking",
                "등록량": "registration_count",
            }
        )
        .sort_values("ranking")
        .head(limit)
    )


def get_gender_brand_rank(gender, limit=10):
    sql = """
        SELECT
            g.gender AS gender,
            b.brand_name AS brand_name,
            g.ranking AS ranking,
            g.gender_reg_count AS registration_count
        FROM Gender_Registration g
        JOIN Brand b ON g.brand_id = b.brand_id
        WHERE g.gender = %s
          AND g.model_id IS NULL
        ORDER BY g.ranking ASC
        LIMIT %s
    """
    df = _read_sql(sql, [gender, limit])
    if not df.empty:
        return df

    fallback = _read_csv("nice_gender_clean.csv")
    if fallback.empty:
        return pd.DataFrame(columns=["gender", "brand_name", "ranking", "registration_count"])

    df = fallback[(fallback["구분"] == gender) & (fallback["타입"] == "브랜드")]
    return (
        df[["구분", "브랜드명", "순위", "등록량"]]
        .rename(
            columns={
                "구분": "gender",
                "브랜드명": "brand_name",
                "순위": "ranking",
                "등록량": "registration_count",
            }
        )
        .sort_values("ranking")
        .head(limit)
    )


def get_age_model_rank(age_group, limit=10):
    fallback = _read_csv("nice_age_clean.csv")
    if fallback.empty:
        return pd.DataFrame(columns=["age_group", "brand_name", "model_name", "ranking", "registration_count"])

    df = fallback[(fallback["구분"] == age_group) & (fallback["타입"] == "모델")]
    return (
        df[["구분", "브랜드명", "모델명", "순위", "등록량"]]
        .rename(
            columns={
                "구분": "age_group",
                "브랜드명": "brand_name",
                "모델명": "model_name",
                "순위": "ranking",
                "등록량": "registration_count",
            }
        )
        .sort_values("ranking")
        .head(limit)
    )


def get_gender_model_rank(gender, limit=10):
    fallback = _read_csv("nice_gender_clean.csv")
    if fallback.empty:
        return pd.DataFrame(columns=["gender", "brand_name", "model_name", "ranking", "registration_count"])

    df = fallback[(fallback["구분"] == gender) & (fallback["타입"] == "모델")]
    return (
        df[["구분", "브랜드명", "모델명", "순위", "등록량"]]
        .rename(
            columns={
                "구분": "gender",
                "브랜드명": "brand_name",
                "모델명": "model_name",
                "순위": "ranking",
                "등록량": "registration_count",
            }
        )
        .sort_values("ranking")
        .head(limit)
    )
