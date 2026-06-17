import sys
from pathlib import Path

import plotly.express as px
import streamlit as st


ROOT_DIR = Path(__file__).resolve().parents[2]
if str(ROOT_DIR) not in sys.path:
    sys.path.append(str(ROOT_DIR))

from database.query import (  # noqa: E402
    get_brand_monthly_sales,
    get_brand_total_sales,
    get_top_models,
)


st.title("브랜드 분석")
st.caption("브랜드별 등록량 추이와 인기 모델을 비교합니다.")

brand_totals = get_brand_total_sales()

if brand_totals.empty:
    st.warning("표시할 브랜드 데이터가 없습니다.")
    st.stop()

brand_options = ["전체", *brand_totals["brand_name"].tolist()]
selected_brand = st.selectbox("브랜드 선택", brand_options)

if selected_brand == "전체":
    selected_totals = brand_totals
else:
    selected_totals = brand_totals[brand_totals["brand_name"] == selected_brand]

total_count = int(selected_totals["registration_count"].sum())
rank_text = "-"

if selected_brand != "전체":
    ranked = brand_totals.reset_index(drop=True)
    rank_text = int(ranked.index[ranked["brand_name"] == selected_brand][0]) + 1

col1, col2, col3 = st.columns(3)
col1.metric("선택 브랜드", selected_brand)
col2.metric("누적 등록량", f"{total_count:,}")
col3.metric("전체 순위", rank_text)

st.divider()

monthly_df = get_brand_monthly_sales()
if selected_brand != "전체":
    monthly_df = monthly_df[monthly_df["brand_name"] == selected_brand]

monthly_df["period"] = (
    monthly_df["year"].astype(str)
    + "-"
    + monthly_df["month"].astype(int).astype(str).str.zfill(2)
)

left, right = st.columns([2, 1])

with left:
    st.subheader("월별 등록 추이")
    fig = px.line(
        monthly_df,
        x="period",
        y="registration_count",
        color="brand_name",
        markers=True,
        labels={
            "period": "기간",
            "registration_count": "등록량",
            "brand_name": "브랜드",
        },
    )
    fig.update_layout(legend_title_text="브랜드", hovermode="x unified")
    st.plotly_chart(fig, use_container_width=True)

with right:
    st.subheader("브랜드 비중")
    fig = px.bar(
        brand_totals,
        x="brand_name",
        y="registration_count",
        color="brand_name",
        labels={
            "brand_name": "브랜드",
            "registration_count": "등록량",
        },
    )
    fig.update_layout(showlegend=False)
    st.plotly_chart(fig, use_container_width=True)

st.subheader("인기 모델 TOP 10")
models = get_top_models(limit=10, brand_name=selected_brand)

if models.empty:
    st.info("표시할 모델 데이터가 없습니다.")
else:
    fig = px.bar(
        models.sort_values("registration_count"),
        x="registration_count",
        y="model_name",
        color="brand_name",
        orientation="h",
        labels={
            "registration_count": "등록량",
            "model_name": "모델",
            "brand_name": "브랜드",
        },
    )
    fig.update_layout(yaxis_title=None, legend_title_text="브랜드")
    st.plotly_chart(fig, use_container_width=True)
    st.dataframe(models, use_container_width=True, hide_index=True)
