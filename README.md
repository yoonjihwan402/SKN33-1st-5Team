# 🚗 AutoStats - 국내 자동차 판매/등록 분석 대시보드

현대, 기아, 테슬라의 자동차 판매/등록 데이터를 수집하고 MySQL에 적재한 뒤, Streamlit으로 브랜드별, 성별, 연령대별 통계를 시각화하는 프로젝트입니다. 다나와 자동차의 월별 판매 데이터, NICE 블루마크 기반 성별/연령대 등록 통계, 브랜드별 FAQ 데이터를 함께 활용합니다.

## 📌 프로젝트 개요

- 분석 대상: 현대, 기아, 테슬라
- 주요 데이터: 월별 브랜드/모델 판매량, 성별 등록 순위, 연령대별 등록 순위, FAQ
- 저장소 구성: 크롤링, 전처리 CSV, DB 생성/적재, Streamlit 대시보드
- 실행 앱: `app.py`
- 주요 화면: 브랜드 연도별/월별/TOP10, 성별 브랜드/모델 순위, 연령대별 브랜드/모델 순위, FAQ 검색

## 👥 협업 및 역할

| 파트 | 담당 | 내용 |
| --- | --- | --- |
| 이양원 | 데이터 수집 | NICE 블루마크, 다나와 자동차, 브랜드 FAQ 데이터 수집 |
| 이양원 | 데이터 전처리 | CSV 정제, 브랜드/모델명 표준화, 통합 FAQ 생성 |
| 주상현, 허유나 | DB 설계 | 논리/물리 ERD 작성, MySQL 테이블 설계 |
| 허유나, 주상현 | DB 적재 | 정제 CSV 기반 Brand, Car_Model, 통계, FAQ 테이블 적재 |
| 김혜진, 윤지환 | Streamlit 개발 | 메인 화면, 사이드바, 분석 페이지, 차트 시각화 |
| 윤지환, 이양원 | README, ERD, 발표 자료 정리 |

## 📅 프로젝트 일정

| 단계 | 작업 |
| --- | --- |
| Day 1 오전 | 주제 선정, 역할 분담, GitHub 저장소 구성, 데이터 출처 조사 |
| Day 1 오후 | 크롤링, CSV 저장, 전처리, ERD 초안 작성 |
| Day 2 오전 | MySQL 구축, 데이터 적재, Streamlit 화면 개발 |
| Day 2 오후 | 분석 화면 통합, FAQ 구현, 오류 수정, README/발표 자료 정리 |

## 주요 기능

| 구분 | 화면 | 설명 |
| --- | --- | --- |
| 메인 | `app.py` | 대시보드 소개 및 분석 메뉴 카드 |
| 연도별 분석 | `pages/brand_annual.py` | 연도별 브랜드 등록/판매량 비교 |
| 월별 분석 | `pages/brand_monthly.py` | 브랜드와 모델을 선택해 월별 추이 확인 |
| TOP 10 분석 | `pages/brand_top10.py` | 전체 또는 브랜드별 모델 TOP 10 확인 |
| 성별 브랜드 분석 | `pages/gender_brand.py` | 남성/여성 기준 브랜드 순위 확인 |
| 성별 차종 분석  | `pages/gender_model.py` | 남성/여성 기준 모델 순위 확인 |
| 연령대별 브랜드 분석 | `pages/age_brand.py` | 연령대별 브랜드 순위 확인 |
| 연령대별 차종 분석 | `pages/age_model.py` | 연령대별 모델 순위 확인 |
| FAQ | `pages/faq.py` | 브랜드별 FAQ 키워드 검색 |

## 개발 진행 순서

```text
주제 선정 및 역할 분담
        ↓
데이터 수집
        ↓
데이터 전처리
        ↓
DB 설계 및 데이터 적재
        ↓
Streamlit 개발
        ↓
시각화 구현
        ↓
통합 테스트
        ↓
발표 준비
```

## 기술 스택

- Language: Python, SQL
- App: Streamlit
- Database: MySQL
- Data Processing: pandas, csv
- Crawling: requests, BeautifulSoup, Selenium, undetected-chromedriver
- Visualization: Plotly, Matplotlib
- DB Connector: MySQL, mysql-connector-python

## 🗂 프로젝트 구조

```text
SKN33-1st-5Team-main/
├── app.py
├── sidebar_utils.py
├── requirements.txt
├── README.md
│
├── crawl_data/
│   ├── crawlers.py
│   ├── preprocessor.py
│   └── run_crawler.py
│
├── crawl_faq/
│   ├── hyundai_faq.py
│   ├── kia_faq.py
│   ├── tesla_faq.py
│   ├── faq_preprocessor.py
│   └── run_faq_crawler.py
│
├── data/
│   └── processed/
│       ├── danawa_brand_clean.csv
│       ├── danawa_model_clean.csv
│       ├── nice_age_clean.csv
│       └── nice_gender_clean.csv
│
├── faq_data/
│   └── processed/
│       ├── all_faq_clean.csv
│       ├── hyundai_faq_clean.csv
│       ├── kia_faq_clean.csv
│       └── tesla_faq_clean.csv
│
├── database/
│   ├── db_connection.py
│   ├── insert_car_data.py
│   ├── insert_faq_data.py
│   └── query.py
│
├── pages/
│   ├── brand_annual.py
│   ├── brand_monthly.py
│   ├── brand_top10.py
│   ├── gender_brand.py
│   ├── gender_model.py
│   ├── age_brand.py
│   ├── age_model.py
│   └── faq.py
│
├── sql/
│   ├── db_setting.sql
│   ├── create_table.sql
│   ├── sample_query.py
│   ├── _gender.sql
│   ├── _registration_sql
│   └── _brand.sql
│
└── docs/
    ├── logical_erd.png
    └── physical_erd.png
```

## 📂 데이터 출처 및 전처리 파일

| 파일 | 데이터 내용 | 주요 컬럼 |
| --- | --- | --- |
| `data/processed/danawa_brand_clean.csv` | 다나와 월별 브랜드 판매량 | 년, 월, 브랜드, 판매량 |
| `data/processed/danawa_model_clean.csv` | 다나와 월별 모델 판매량 | 년, 월, 브랜드, 순위, 모델, 판매량 |
| `data/processed/nice_age_clean.csv` | NICE 연령대별 브랜드/모델 등록 순위 | 구분, 타입, 순위, 브랜드명, 모델명, 등록량 |
| `data/processed/nice_gender_clean.csv` | NICE 성별 브랜드/모델 등록 순위 | 구분, 타입, 순위, 브랜드명, 모델명, 등록량 |
| `faq_data/processed/all_faq_clean.csv` | 현대/기아/테슬라 FAQ 통합 데이터 | 브랜드, 대분류, 카테고리, 질문, 답변 |

## ERD

### 논리 ERD

<img width="1327" height="833" alt="Image" src="https://github.com/user-attachments/assets/bc4d4fe3-5233-4da7-847d-d6e8f38e5ea0" />

### 물리 ERD

<img width="2320" height="1322" alt="Image" src="https://github.com/user-attachments/assets/898deb40-6e7f-4c37-a0c9-debe30fee816" />

## 데이터베이스 설계

현재 DB 스키마는 `sql/create_table.sql` 기준이며, 핵심 엔티티는 브랜드, 모델, 월별 등록/판매 데이터, 성별/연령대 통계, FAQ입니다.

| 테이블 | 설명 | 주요 컬럼 |
| --- | --- | --- |
| `Brand` | 브랜드 기준 정보 | `brand_id`, `brand_name` |
| `Car_Model` | 브랜드별 차량 모델 정보 | `model_id`, `brand_id`, `model_name` |
| `Monthly_Model_Registration` | 월별/모델별 등록 또는 판매 데이터 | `reg_id`, `model_id`, `brand_name`, `year`, `month`, `monthly_reg_count` |
| `Monthly_Brand_Registration` | 월별/브랜드별 등록 또는 판매 데이터 | `sales_id`, `brand_id`, `year`, `month`, `sales_count` |
| `Age_Registration` | 연령대별 브랜드/모델 순위 통계 | `age_reg_id`, `brand_id`, `model_id`, `age_group`, `gubun`, `ranking`, `age_reg_count` |
| `Gender_Registration` | 성별 브랜드/모델 순위 통계 | `gender_reg_id`, `brand_id`, `model_id`, `gender`, `gubun`, `ranking`, `gender_reg_count` |
| `FAQ` | 크롤링 기반 FAQ 캐싱 데이터 | `faq_id`, `brand_id`, `category`, `question`, `answer` |

### 테이블 관계

- `Brand` 1:N `Car_Model`
- `Brand` 1:N `Monthly_Brand_Registration`
- `Car_Model` 1:N `Monthly_Model_Registration`
- `Brand` 1:N `Age_Registration`, `Gender_Registration`, `FAQ`
- `Car_Model` 1:N `Age_Registration`, `Gender_Registration`

## 실행 방법

### 1. 가상환경 생성

```bash
python -m venv .venv
```

Windows PowerShell:

```bash
.venv\Scripts\Activate.ps1
```

macOS/Linux:

```bash
source .venv/bin/activate
```

### 2. 패키지 설치

```bash
pip install -r requirements.txt
pip install mysql-connector-python
```

`database/query.py`, `database/insert_car_data.py`, `database/insert_faq_data.py`에서 `mysql.connector`를 사용하므로 `mysql-connector-python` 설치가 필요합니다.

### 3. MySQL 데이터베이스 생성

MySQL에서 아래 SQL 파일을 순서대로 실행합니다.


### 4. CSV 데이터 적재

자동차 판매/등록 통계 데이터를 먼저 적재합니다.

```bash
python database/insert_car_data.py
```

FAQ 데이터를 적재합니다.

```bash
python database/insert_faq_data.py
```

### 5. Streamlit 실행

```bash
streamlit run app.py
```

실행 후 브라우저에서 접속합니다.

## 데이터 처리 흐름

```text
다나와/NICE/브랜드 FAQ 데이터 수집
        ↓
CSV 전처리 및 정제
        ↓
data/processed, faq_data/processed 저장
        ↓
MySQL 스키마 생성
        ↓
database/insert_car_data.py, insert_faq_data.py로 적재
        ↓
database/query.py에서 화면별 조회 쿼리 제공
        ↓
Streamlit pages/ 화면에서 시각화
```

## 주요 모듈 설명

| 경로 | 역할 |
| --- | --- |
| `crawl_data/` | 다나와/NICE 자동차 통계 데이터 수집 및 전처리 |
| `crawl_faq/` | 현대, 기아, 테슬라 FAQ 수집 및 통합 전처리 |
| `database/insert_car_data.py` | 브랜드, 모델, 월별, 성별, 연령대 통계 CSV를 MySQL에 적재 |
| `database/insert_faq_data.py` | 통합 FAQ CSV를 MySQL `FAQ` 테이블에 적재 |
| `database/query.py` | Streamlit 페이지에서 사용하는 조회 함수 모음 |
| `sidebar_utils.py` | Streamlit 사이드바 메뉴와 페이지 이동 처리 |
| `pages/` | Streamlit 멀티페이지 분석 화면 |
| `sql/create_table.sql` | ERD 기준 물리 테이블 생성 SQL |


## 기대 효과

- 국내 주요 자동차 브랜드의 판매/등록 추이를 한 화면에서 비교
- 브랜드, 모델, 성별, 연령대 기준의 선호도 분석 가능
- 크롤링, 전처리, DB 설계, 데이터 적재, 대시보드 구현까지 end-to-end 데이터 파이프라인 경험
- Streamlit 기반 데이터 서비스 구현 및 팀 협업 경험 축적

## 회고 
| 팀원 | 회고 |
| ---- | --- |
|</nobr>윤지환</nobr>| PM으로써 branch 기준, git 기준을 모호하게 시작하니 진행 간 환경이 달라지는 어려움이 있다는 것을 이번 프로젝트에서 알게되었습니다. 전반적인 프로젝트 진행을 알 수 있어 큰 배움이 되었고, 데이터 설계, 스트림릿과의 연동에 대해서 한 층 더 알 수 있는 시간이 되었던 것 같습니다. |
|</nobr>김혜진</nobr>| 전공자는 있지만 경력자가 없어서 어려움을 겪었지만 팀 내 분위기가 좋아 힘내서 결국 완성할 수 있었습니다. 사실 코딩은 AI가 워낙 잘 되어있어서 시간이 그리 오래 걸리지 않았습니다. 초기 설계를 더욱 탄탄하게 했다면 순항할 수 있었을 텐데 그 점이 아쉽습니다. 그리고 어떤 부분에서 얼마나 부족한지 알게되었고, 추후 스스로 공부하고 회고할 수 있는 좋은 자료가 될 것 같습니다. |
|</nobr>이양원</nobr>| 웹 크롤링으로 수집한 원시 데이터를 SQL로 구조화하여 적재하고, 이를 Streamlit으로 시각화하는 프로젝트를 진행했습니다. 데이터를 추출하고 가공하여 사용자에게 보여지기까지의 전체 흐름을 직접 통제해 보면서, 단순한 구현을 넘어 시스템 전체를 조망하는 엔지니어로서의 시야를 한층 넓힐 수 있었던 뜻깊은 경험이었습니다. |
|</nobr>주상현</nobr> | 처음으로 팀 프로젝트에서 데이터베이스 설계를 담당하면서, 초기 설계의 완성도가 전체 프로젝트의 완성도를 좌우한다는 것을 직접 체감했습니다. 수정이 필요한 상황에서도 팀원들의 작업에 영향을 최소화하기 위해 설계 범위를 조율하며 협업의 중요성도 배울 수 있었습니다. 다음 프로젝트에서는 데이터 구조와 요구사항을 충분히 분석한 뒤 설계를 확정하는 습관을 반드시 가져가겠습니다. |
|</nobr>허유나</nobr>| 생소한 데이터 전처리와 지속적인 DB 적재 에러로 시행착오를 겪었지만, 끈기 있게 트러블슈팅하며 RDB 구조의 원리와 데이터 무결성의 중요성을 체득한 값진 경험이었습니다. |
