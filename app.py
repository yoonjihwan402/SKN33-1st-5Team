
import streamlit as st

st.set_page_config(
    page_title="Domestic Car Sales",
    layout="wide"
)

# -------------------------
# CSS
# -------------------------
st.markdown("""
<style>

/* Sidebar */
[data-testid="stSidebar"]{
    background:#000000 !important;
}

/* 기본 페이지 목록 숨김 */
[data-testid="stSidebarNav"]{
    display:none !important;
}

/* 글자 */
[data-testid="stSidebar"] *{
    color:white !important;
}

/* 버튼 */
div.stButton > button{

    background:#000000 !important;

    color:white !important;

    border:none !important;

    width:100%;

    text-align:left;

    padding:15px;

    font-size:20px;
}

/* selectbox */
div[data-baseweb="select"] > div{

    background:#333333 !important;

    border-radius:10px;

    min-height:55px;
}
hr {
        height: 3px !important;     /* 두께 조절 */
        border: none !important;    /* 기존 테두리 제거 */
        background: linear-gradient(90deg, 
            #ff0000, #ff7f00, #ffff00, #00ff00, #0000ff, #4b0082, #9400d3
        ) !important;
        margin: 1em 0 !important;
}
/* 사이드바의 최상단 여백을 강제로 0으로 설정 */
[data-testid="stSidebarContent"] {
    padding-top: 0rem !important;
}

/* 자동 네비게이션 영역의 높이를 0으로 만들어 레이아웃 밀림 방지 */
[data-testid="stSidebarNav"] {
    display: none !important;
    height: 0 !important;
    margin: 0 !important;
    padding: 0 !important;
}
</style>
""", unsafe_allow_html=True)


# -------------------------
# Sidebar
# -------------------------
with st.sidebar:

    st.markdown("## Dashboard Menu")

    if st.button("Home"):
        st.switch_page("app.py")


    st.divider()

    st.subheader("Brand")

    brand = st.selectbox(
        "",
        [
            "선택",
            "연도별",
            "월별",
            "TOP10"
        ],
        label_visibility="collapsed"
    )

    if brand == "연도별":
        st.switch_page("streanlit/pages/brand.py")
    elif brand == "월별":
        st.switch_page("streanlit/pages/brand.py")
    elif brand == "TOP10":
        st.switch_page("streanlit/pages/brand.py")


# -------------------------
# Main
# -------------------------

st.title("🚗 대제목")
st.subheader("소제목")
st.write("환영합니다.")
st.image("https://images.unsplash.com/photo-1503376780353-7e6692767b70", width=500)
st.write("분석에 대한 간략한 설명이 들어가는 자리입니다.")

