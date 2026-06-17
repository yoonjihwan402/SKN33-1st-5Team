import sys
from pathlib import Path

import plotly.express as px
import streamlit as st


ROOT_DIR = Path(__file__).resolve().parents[2]
if str(ROOT_DIR) not in sys.path:
    sys.path.append(str(ROOT_DIR))

from database.query import (  # noqa: E402
    get_age_brand_rank,
    get_age_model_rank,
    get_gender_brand_rank,
    get_gender_model_rank,
)


st.title("연령·성별 분석")
st.caption("연령대와 성별 기준으로 선호 브랜드 및 모델 순위를 확인합니다.")

tab_age, tab_gender = st.tabs(["연령대", "성별"])


def render_rank_section(title, brand_df, model_df):
    st.subheader(title)

    if brand_df.empty and model_df.empty:
        st.info("표시할 순위 데이터가 없습니다.")
        return

    left, right = st.columns(2)

    with left:
        st.markdown("#### 브랜드 순위")
        if brand_df.empty:
            st.info("브랜드 순위 데이터가 없습니다.")
        else:
            fig = px.bar(
                brand_df.sort_values("registration_count"),
                x="registration_count",
                y="brand_name",
                color="brand_name",
                orientation="h",
                labels={
                    "registration_count": "등록량",
                    "brand_name": "브랜드",
                },
            )
            fig.update_layout(showlegend=False, yaxis_title=None)
            st.plotly_chart(fig, use_container_width=True)
            st.dataframe(brand_df, use_container_width=True, hide_index=True)

    with right:
        st.markdown("#### 모델 순위")
        if model_df.empty:
            st.info("모델 순위 데이터가 없습니다.")
        else:
            fig = px.bar(
                model_df.sort_values("registration_count"),
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
            st.dataframe(model_df, use_container_width=True, hide_index=True)


with tab_age:
    age_group = st.selectbox(
        "연령대 선택",
        ["20대 이하", "30대", "40대", "50대", "60대", "70대 이상"],
    )

    brand_df = get_age_brand_rank(age_group)
    model_df = get_age_model_rank(age_group)
    render_rank_section(f"{age_group} 등록 순위", brand_df, model_df)

with tab_gender:
    gender = st.radio("성별 선택", ["남성", "여성"], horizontal=True)

    brand_df = get_gender_brand_rank(gender)
    model_df = get_gender_model_rank(gender)
    render_rank_section(f"{gender} 등록 순위", brand_df, model_df)
