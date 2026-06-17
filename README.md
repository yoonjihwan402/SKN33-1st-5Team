# 자동차 등록 통계 기반 차량 선호도 분석

현대, 기아, 테슬라 차량 데이터를 기반으로 브랜드별 판매량, 차종별 판매량, 성별·연령별 차량 선호도를 분석하는 Streamlit 대시보드 프로젝트입니다.

---

## 프로젝트 소개

본 프로젝트는 다나와 자동차 판매량 데이터와 NICE 자동차 등록 통계 데이터를 활용하여 차량 시장 흐름과 사용자 선호도를 시각적으로 확인할 수 있도록 구성한 데이터 분석 웹 애플리케이션입니다.

사용자는 브랜드별 월별·연도별 등록 추이, 차종별 TOP 10, 성별·연령별 선호 브랜드 및 차종 순위를 Streamlit 대시보드에서 확인할 수 있습니다.

---

## 프로젝트 목표

- 자동차 등록 통계 및 판매량 데이터 수집
- CSV 데이터 전처리 및 분석용 데이터 구성
- 브랜드별·차종별 시장 흐름 파악
- 성별·연령별 차량 선호도 비교
- Streamlit 기반 시각화 대시보드 구현
- MySQL 및 CSV 기반 데이터 조회 구조 구성

---

## 역할 분담

데이터 수집은 팀원 전원이 공동으로 수행하였습니다.

| 팀원 | 담당 역할 | 주요 업무 | 산출물 |
|---|---|---|---|
| 양원 | 데이터 수집 / 전처리 | NICE 블루마크·다나와 데이터 수집, 데이터 검증, 전처리 지원 | 원본 데이터, 전처리 코드 |
| 상현 | 데이터 수집 / DB 설계 | 데이터 수집, 테이블 구조 설계, 데이터베이스 구축 지원 | ERD 초안, SQL |
| 유나 | 데이터 수집 / 전처리 / Streamlit | 데이터 정제 및 병합, 연도별·월별 페이지 개발 | clean_data.csv, 연도별·월별 페이지 |
| 혜진 | 데이터 수집 / Streamlit | ERD 작성, MySQL 구축, 브랜드별·차종별 페이지 개발 | ERD, SQL, 브랜드별·차종별 페이지 |
| 지환 | 데이터 수집 / Streamlit / PM | 메인 페이지, 성별 페이지, FAQ 페이지 개발, GitHub 관리, README 및 발표 자료 작성 | app.py, FAQ, README.md, PPT |

### 파트별 담당자

| 파트 | 담당자 |
|---|---|
| 데이터 수집 | 김혜진, 윤지환, 이양원, 주상현, 허유나 |
| DB 설계 및 MySQL | 허유나, 주상현 |
| 데이터 전처리(크롤링) | 이양원 |
| Streamlit 개발 | 김혜진, 윤지환, 이양원 |
| 발표 자료 제작 | 윤지환 |

### 협업 방식

- 모든 팀원이 데이터 수집 참여
- 전처리 담당자가 크롤링, 분석용 데이터셋 생성
- DB 설계 담당자가 MySQL 구축 및 데이터 적재
- Streamlit 담당자가 분석 페이지 구현
- PM 담당자가 프로젝트 통합, 문서화 및 발표 준비 수행

---

## 주요 기능

### Home

- 차량 선호도 분석 메인 화면
- 자동차 이미지 중심의 메인 화면 구성
- 주요 요약 지표 제공
  - 브랜드 수
  - 모델 수
  - 전체 등록량
  - 분석 기간

### 브랜드 분석

사이드바에서 브랜드 분석 항목을 선택할 수 있습니다.

- 연도별 분석
  - 기업 선택
  - 연도별 등록 대수 시각화
  - 기업명, 등록 대수 기준 표 제공

- 월별 분석
  - 기업 선택
  - 월별 브랜드 등록 추이 그래프
  - 기간, 기업명, 등록 대수 기준 표 제공

- TOP 10
  - 기업 선택
  - 전체 모델 TOP 10 그래프
  - 기업명, 차종, 등록 대수 기준 표 제공

### 성별 분석

- 사이드바에서 남자, 여자 체크박스 선택
- 순위 항목 선택
  - 브랜드 순위
  - 차종 순위

- 브랜드 순위
  - 원 그래프로 성별 브랜드 선호도 표시
  - 실제 등록 대수와 관계없이 순위 기준으로 비율 구성
  - 1위가 가장 크게, 10위가 가장 작게 표시

- 차종 순위
  - x축: 모델명
  - y축: 순위
  - 성별 기준 차종 선호도 비교

### 연령별 분석

- 사이드바에서 연령대 멀티 선택
- 순위 항목 선택
  - 브랜드 순위
  - 차종 순위

- 브랜드 순위
  - x축: 브랜드
  - y축: 차량 등록
  - 연령대별 브랜드 선호도 비교

- 차종 순위
  - x축: 모델명
  - y축: 순위
  - 연령대별 차종 선호도 비교

---

## 사용 데이터

### 다나와 자동차 데이터

```text
data/processed/danawa_brand_clean.csv
data/processed/danawa_model_clean.csv
```

| 파일 | 컬럼 |
|---|---|
| danawa_brand_clean.csv | 년, 월, 브랜드, 판매량 |
| danawa_model_clean.csv | 년, 월, 브랜드, 순위, 모델, 판매량 |

### NICE 자동차 등록 통계 데이터

```text
data/processed/nice_age_clean.csv
data/processed/nice_gender_clean.csv
```

| 파일 | 컬럼 |
|---|---|
| nice_age_clean.csv | 구분, 타입, 순위, 브랜드명, 모델명, 등록량 |
| nice_gender_clean.csv | 구분, 타입, 순위, 브랜드명, 모델명, 등록량 |

---

## 프로젝트 구조

```text
SKN33-1st-5Team
├── app.py
├── requirements.txt
├── README.md
│
├── data
│   └── processed
│       ├── danawa_brand_clean.csv
│       ├── danawa_model_clean.csv
│       ├── nice_age_clean.csv
│       └── nice_gender_clean.csv
│
├── database
│   ├── db_connection.py
│   ├── insert_car_data.py
│   └── query.py
│
├── streanlit
│   └── pages
│       ├── brand.py
│       └── age_gender.py
│
├── crawl_data
│   ├── crawlers.py
│   ├── preprocessor.py
│   └── run_crawler.py
│
├── crawl_faq
│   ├── faq_preprocessor.py
│   ├── hyundai_faq.py
│   ├── kia_faq.py
│   ├── tesla_faq.py
│   └── run_faq_crawler.py
│
└── sql
    ├── create_table.sql
    ├── db_setting.sql
    └── sample_query.py
```

> 현재 폴더명이 `streanlit`으로 되어 있으므로 실행 코드도 해당 경로를 기준으로 동작합니다.

---

## 기술 스택

### Language

- Python

### Data Processing

- Pandas

### Visualization

- Plotly

### Web Application

- Streamlit

### Database

- MySQL
- PyMySQL

### Crawling

- Requests
- BeautifulSoup
- Selenium
- WebDriver Manager
- undetected-chromedriver

### Collaboration

- Git
- GitHub

---

## 주요 코드 설명

### app.py

Streamlit 메인 진입 파일입니다.

- 사이드바 메뉴 구성
  - Home
  - 브랜드 분석
  - 연령·성별 분석
- Home 화면 구성
- 각 페이지 파일 실행

### database/query.py

CSV 데이터를 읽고 Streamlit 화면에서 사용하기 좋은 형태로 정리합니다.

| 함수 | 설명 |
|---|---|
| get_summary_metrics | Home 요약 지표 반환 |
| get_brand_monthly_sales | 월별 브랜드 등록 데이터 반환 |
| get_brand_total_sales | 브랜드별 누적 등록 데이터 반환 |
| get_brand_yearly_sales | 연도별 브랜드 등록 데이터 반환 |
| get_brand_options | 브랜드 선택 옵션 반환 |
| get_top_models | 차종 TOP 10 데이터 반환 |
| get_age_brand_rank | 연령별 브랜드 순위 반환 |
| get_age_model_rank | 연령별 차종 순위 반환 |
| get_gender_brand_rank | 성별 브랜드 순위 반환 |
| get_gender_model_rank | 성별 차종 순위 반환 |

### streanlit/pages/brand.py

브랜드 분석 화면을 구성합니다.

- 사이드바 브랜드 분석 메뉴
- 연도별 분석
- 월별 분석
- TOP 10 분석
- 표 컬럼명 변경 및 가운데 정렬

### streanlit/pages/age_gender.py

성별 및 연령별 분석 화면을 구성합니다.

- 성별 체크박스
- 연령대 멀티 선택
- 브랜드 순위 / 차종 순위 선택
- 성별 브랜드 순위 원 그래프
- 성별·연령별 차종 순위 그래프

---

## 작업 방식

- 원격 `main`, `dev` 브랜치에 직접 개발하지 않음
- 기능 구현용 로컬 브랜치 생성
- 작업 완료 후 같은 이름의 원격 브랜치로 push
- 원격 브랜치에서 `dev` 브랜치로 Pull Request 생성
- PR 확인 후 `dev` 브랜치에 merge
- 테스트 후 문제가 없으면 최종 내용을 `main` 브랜치에 병합

예시:

```text
feature/faq -> origin/feature/faq -> dev PR
```

---

## 기대 효과

- 자동차 브랜드별 시장 흐름 파악
- 성별·연령별 차량 선호도 비교
- 등록 통계와 판매량 데이터 기반 시각화 경험
- Streamlit을 활용한 데이터 분석 대시보드 구현 경험
- CSV 데이터 전처리 및 시각화 흐름 이해
- GitHub 기반 협업 흐름 경험
