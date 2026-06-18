
import streamlit as st
import sys, os
sys.path.append(os.path.dirname(os.path.abspath(__file__)))

from sidebar_utils import render_sidebar

st.set_page_config(page_title="AutoStats | 국내 자동차 판매 분석", layout="wide",
                   page_icon="🏎")

render_sidebar(active_section="", active_menu="선택")

# ── CSS ────────────────────────────────────────────────────────
st.markdown("""
<style>
@import url('https://fonts.googleapis.com/css2?family=Rajdhani:wght@600;700&family=Noto+Sans+KR:wght@400;700;900&display=swap');

.block-container { padding-top: 1rem !important; }

/* 전체 앱 다크 배경 */
[data-testid="stAppViewContainer"],
section[data-testid="stMain"] { background: #06060f !important; }

@keyframes fadeInDown {
    from { opacity:0; transform:translateY(-30px); }
    to   { opacity:1; transform:translateY(0); }
}
@keyframes fadeInUp {
    from { opacity:0; transform:translateY(40px); }
    to   { opacity:1; transform:translateY(0); }
}
@keyframes slideInLeft {
    from { opacity:0; transform:translateX(-50px); }
    to   { opacity:1; transform:translateX(0); }
}
@keyframes glowPulse {
    0%,100% { text-shadow: 0 0 20px rgba(220,38,38,0.5), 0 0 40px rgba(139,92,246,0.2); }
    50%      { text-shadow: 0 0 50px rgba(220,38,38,0.9), 0 0 80px rgba(139,92,246,0.45), 0 0 120px rgba(8,145,178,0.2); }
}
@keyframes auroraShimmer {
    0%,100% { opacity: 0.55; }
    50%      { opacity: 0.85; }
}
@keyframes gradientShift {
    0%   { background-position: 0% 50%; }
    50%  { background-position: 100% 50%; }
    100% { background-position: 0% 50%; }
}
@keyframes stripeAnim {
    0%   { background-position: 0 0; }
    100% { background-position: 60px 0; }
}
@keyframes floatCar {
    0%,100% { transform: translateX(0) scaleX(-1); }
    50%     { transform: translateX(20px) scaleX(-1); }
}
@keyframes scanLine {
    0%   { transform: translateY(-100%); opacity:0.12; }
    100% { transform: translateY(500%);  opacity:0; }
}

/* ── 히어로 배너 ── */
.hero-banner {
    background: linear-gradient(135deg, #070514 0%, #120a28 30%, #0c1030 60%, #06091e 100%);
    background-size: 400% 400%;
    animation: gradientShift 14s ease infinite;
    border-radius: 20px;
    padding: 72px 60px 64px;
    margin-bottom: 28px;
    position: relative;
    overflow: hidden;
    border: 1px solid rgba(139,92,246,0.18);
    box-shadow:
        0 4px 80px rgba(0,0,0,0.8),
        0 0 120px rgba(91,33,182,0.08),
        inset 0 1px 0 rgba(139,92,246,0.07);
}
/* 오로라 상단 글로우 */
.hero-banner::before {
    content: '';
    position: absolute;
    top: -80px; left: -10%; right: -10%;
    height: 200px;
    background: radial-gradient(ellipse at 50% 0%, rgba(91,33,182,0.35) 0%, rgba(8,145,178,0.15) 50%, transparent 80%);
    animation: auroraShimmer 6s ease-in-out infinite;
    pointer-events: none;
}
.hero-banner::after {
    content: '';
    position: absolute;
    top: 0; left: 0; right: 0; height: 40%;
    background: linear-gradient(transparent, rgba(139,92,246,0.015), transparent);
    animation: scanLine 6s linear infinite;
    pointer-events: none;
}
.hero-car {
    position: absolute;
    right: 52px; bottom: 0;
    font-size: 10rem; line-height: 1;
    animation: floatCar 4s ease-in-out infinite;
    filter: drop-shadow(0 0 40px rgba(139,92,246,0.4)) drop-shadow(0 0 20px rgba(220,38,38,0.2));
    opacity: 0.85;
}
.hero-grid-bg {
    position: absolute; inset: 0;
    background-image:
        linear-gradient(rgba(139,92,246,0.04) 1px, transparent 1px),
        linear-gradient(90deg, rgba(139,92,246,0.04) 1px, transparent 1px);
    background-size: 40px 40px;
    border-radius: 20px;
}
/* 히어로 오른쪽 오로라 블롭 */
.hero-glow-r {
    position: absolute; right: -60px; top: 20%;
    width: 350px; height: 350px; border-radius: 50%;
    background: radial-gradient(circle, rgba(8,145,178,0.18) 0%, transparent 70%);
    filter: blur(50px); pointer-events: none;
    animation: auroraFloat1 12s ease-in-out infinite;
}
.hero-glow-l {
    position: absolute; left: -40px; bottom: -30px;
    width: 280px; height: 280px; border-radius: 50%;
    background: radial-gradient(circle, rgba(124,58,237,0.2) 0%, transparent 70%);
    filter: blur(60px); pointer-events: none;
    animation: auroraFloat2 16s ease-in-out infinite;
}
.hero-badge {
    display: inline-flex; align-items: center; gap: 8px;
    background: rgba(139,92,246,0.1);
    border: 1px solid rgba(139,92,246,0.35);
    color: #c4b5fd; padding: 6px 18px; border-radius: 40px;
    font-size: 0.7rem; letter-spacing: 3px; font-weight: 700;
    text-transform: uppercase; margin-bottom: 22px;
    animation: fadeInDown 0.7s ease both;
}
.hero-badge::before {
    content: ''; width: 6px; height: 6px;
    background: #7C3AED; border-radius: 50%;
    box-shadow: 0 0 8px #7C3AED;
    animation: glowPulse 1.5s ease-in-out infinite;
}
.hero-title {
    font-family: 'Rajdhani', 'Noto Sans KR', sans-serif;
    color: white; font-size: 3.2rem; font-weight: 700;
    line-height: 1.0; margin: 0 0 6px 0; letter-spacing: -0.5px;
    animation: slideInLeft 0.8s ease 0.15s both;
}
.hero-title .accent {
    color: #DC2626; font-size: 6.4rem; font-weight: 900;
    display: block; line-height: 1.05;
    animation: glowPulse 2.5s ease-in-out infinite, slideInLeft 0.8s ease 0.25s both;
    letter-spacing: -2px;
}
.hero-subtitle {
    color: rgba(255,255,255,0.45); font-size: 1rem;
    margin: 16px 0 0 0;
    animation: slideInLeft 0.8s ease 0.4s both;
    letter-spacing: 0.3px; line-height: 1.7;
}
.hero-divider {
    width: 60px; height: 2px;
    background: linear-gradient(90deg, #DC2626, transparent);
    margin: 18px 0;
    animation: slideInLeft 0.8s ease 0.35s both;
}

/* ── 분석 메뉴 카드 ── */
.section-label {
    color: rgba(167,139,250,0.8);
    font-size: 0.68rem; letter-spacing: 4px;
    text-transform: uppercase; font-weight: 700;
    margin-bottom: 16px;
    display: flex; align-items: center; gap: 10px;
}
.section-label::after {
    content: ''; flex: 1; height: 1px;
    background: linear-gradient(90deg, rgba(139,92,246,0.4), transparent);
}

.feature-card {
    background: linear-gradient(145deg, #0c0a1e 0%, #10101e 100%);
    border: 1px solid rgba(139,92,246,0.1);
    border-radius: 18px;
    padding: 32px 26px 28px;
    position: relative; overflow: hidden;
    animation: fadeInUp 0.7s ease both;
    height: 100%;
}
.feature-card:nth-child(2) { animation-delay: 0.1s; }
.feature-card:nth-child(3) { animation-delay: 0.2s; }
.feature-card .bg-icon {
    position: absolute; right: -8px; bottom: -8px;
    font-size: 6rem; opacity: 0.05; line-height: 1;
}
.feature-card::before {
    content: ''; position: absolute;
    top: 0; left: 0; right: 0; height: 2px;
    background: linear-gradient(90deg, var(--lc, #DC2626), transparent);
}
.feature-number {
    font-family: 'Rajdhani', sans-serif;
    color: rgba(220,38,38,0.3); font-size: 0.75rem;
    letter-spacing: 3px; margin-bottom: 14px; font-weight: 700;
}
.feature-icon { font-size: 2.4rem; margin-bottom: 14px; line-height: 1; display: block; }
.feature-title { color: white; font-size: 1.3rem; font-weight: 700; margin-bottom: 10px; }
.feature-desc  { color: rgba(255,255,255,0.4); font-size: 0.85rem; line-height: 1.65; }
.feature-tags  { margin-top: 16px; display: flex; flex-wrap: wrap; gap: 6px; }
.feature-tag {
    background: rgba(124,58,237,0.1); border: 1px solid rgba(124,58,237,0.25);
    color: rgba(196,181,253,0.85);
    padding: 3px 10px; border-radius: 20px; font-size: 0.72rem; letter-spacing: 0.5px;
}

/* 카드 하단 버튼 스타일 오버라이드 */
.nav-btn button {
    background: rgba(124,58,237,0.1) !important;
    border: 1px solid rgba(124,58,237,0.3) !important;
    color: rgba(196,181,253,0.9) !important;
    border-radius: 10px !important;
    font-weight: 600 !important;
    letter-spacing: 0.5px !important;
    transition: all 0.25s ease !important;
    margin-top: 16px;
}
.nav-btn button:hover {
    background: rgba(124,58,237,0.22) !important;
    border-color: rgba(139,92,246,0.65) !important;
    color: white !important;
    transform: translateY(-2px) !important;
    box-shadow: 0 6px 24px rgba(124,58,237,0.3) !important;
}

/* 하단 푸터 */
.footer-banner {
    margin-top: 28px;
    background: linear-gradient(135deg, #0a0818, #0c0b20);
    border: 1px solid rgba(139,92,246,0.1);
    border-radius: 14px; padding: 18px 32px;
    display: flex; align-items: center; justify-content: space-between;
    animation: fadeInUp 0.8s ease 0.5s both;
}
.footer-text { color: rgba(255,255,255,0.25); font-size: 0.78rem; letter-spacing: 0.5px; }
.footer-dot {
    width: 6px; height: 6px; background: #22c55e;
    border-radius: 50%; display: inline-block;
    margin-right: 8px; box-shadow: 0 0 8px #22c55e;
}
</style>
""", unsafe_allow_html=True)

# ── 히어로 ─────────────────────────────────────────────────────
st.markdown("""
<div class="hero-banner">
  <div class="hero-grid-bg"></div>
  <div class="hero-glow-r"></div>
  <div class="hero-glow-l"></div>
  <div class="hero-car">🏎</div>
  <div class="hero-badge">HYUNDAI / KIA / TESLA</div>
  <div class="hero-title">
    국내 자동차
    <span class="accent">판매 분석 서비스</span>
  </div>
  <div class="hero-divider"></div>
  <div class="hero-subtitle">
    브랜드 · 성별 · 연령대별 자동차 등록 데이터를 실시간으로 분석합니다<br>
    아래 카드를 클릭하거나 사이드바에서 분석 항목을 선택하세요
  </div>
</div>
""", unsafe_allow_html=True)

# ── 분석 메뉴 카드 (클릭 가능) ─────────────────────────────────
st.markdown('<div class="section-label">분석 메뉴</div>', unsafe_allow_html=True)

col1, col2, col3 = st.columns(3)

with col1:
    st.markdown("""
    <div class="feature-card" style="--lc:#DC2626;">
      <div class="bg-icon">🚗</div>
      <div class="feature-number">01 / BRAND</div>
      <span class="feature-icon">📊</span>
      <div class="feature-title">브랜드별 분석</div>
      <div class="feature-desc">연도별·월별 브랜드 등록 수 비교,<br>월간 TOP 10 모델 순위를 확인하세요.</div>
      <div class="feature-tags">
        <span class="feature-tag">연도별</span>
        <span class="feature-tag">월별</span>
        <span class="feature-tag">TOP 10</span>
      </div>
    </div>
    """, unsafe_allow_html=True)
    st.markdown('<div class="nav-btn">', unsafe_allow_html=True)
    if st.button("📊  브랜드별 분석 →", key="go_brand", use_container_width=True):
        st.switch_page("pages/brand_annual.py")
    st.markdown('</div>', unsafe_allow_html=True)

with col2:
    st.markdown("""
    <div class="feature-card" style="--lc:#7C3AED;">
      <div class="bg-icon">👫</div>
      <div class="feature-number">02 / GENDER</div>
      <span class="feature-icon">👥</span>
      <div class="feature-title">성별 분석</div>
      <div class="feature-desc">남성·여성별 선호 브랜드 순위와<br>선호 모델 순위를 비교 분석합니다.</div>
      <div class="feature-tags">
        <span class="feature-tag" style="background:rgba(124,58,237,0.1);border-color:rgba(124,58,237,0.3);color:rgba(190,160,255,0.85);">브랜드 순위</span>
        <span class="feature-tag" style="background:rgba(124,58,237,0.1);border-color:rgba(124,58,237,0.3);color:rgba(190,160,255,0.85);">선호 모</span>
      </div>
    </div>
    """, unsafe_allow_html=True)
    st.markdown('<div class="nav-btn" style="--lc:#7C3AED;">', unsafe_allow_html=True)
    if st.button("👥  성별 분석 →", key="go_gender", use_container_width=True):
        st.switch_page("pages/gender_brand.py")
    st.markdown('</div>', unsafe_allow_html=True)

with col3:
    st.markdown("""
    <div class="feature-card" style="--lc:#059669;">
      <div class="bg-icon">📅</div>
      <div class="feature-number">03 / AGE</div>
      <span class="feature-icon">🎂</span>
      <div class="feature-title">연령별 분석</div>
      <div class="feature-desc">20대~70대까지 연령대별 브랜드 선호도와<br>모 순위를 세대별로 분석합니다.</div>
      <div class="feature-tags">
        <span class="feature-tag" style="background:rgba(5,150,105,0.1);border-color:rgba(5,150,105,0.3);color:rgba(100,220,160,0.85);">브랜드 순위</span>
        <span class="feature-tag" style="background:rgba(5,150,105,0.1);border-color:rgba(5,150,105,0.3);color:rgba(100,220,160,0.85);">선호 모델</span>
      </div>
    </div>
    """, unsafe_allow_html=True)
    st.markdown('<div class="nav-btn">', unsafe_allow_html=True)
    if st.button("🎂  연령별 분석 →", key="go_age", use_container_width=True):
        st.switch_page("pages/age_brand.py")
    st.markdown('</div>', unsafe_allow_html=True)

# ── 푸터 ───────────────────────────────────────────────────────
st.markdown("""
<div class="footer-banner">
  <div class="footer-text">
    <span class="footer-dot"></span>
    &nbsp;|&nbsp; SKN33-1st-5Team &nbsp;|&nbsp; 2026
  </div>
  <div class="footer-text" style="font-family:'Rajdhani',sans-serif; letter-spacing:2px; font-size:2rem;">
    <span style="color:#DC2626;">SKN</span>
  </div>
</div>
""", unsafe_allow_html=True)
