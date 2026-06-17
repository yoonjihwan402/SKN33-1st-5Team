-- ==================
-- 초기화
-- ==================
# SET FOREIGN_KEY_CHECKS = 0;
#
# -- 2. 기존에 존재하던 테이블들을 깨끗하게 날려버립니다.
# DROP TABLE IF EXISTS FAQ;
# DROP TABLE IF EXISTS Gender_Registration;
# DROP TABLE IF EXISTS Age_Registration;
# DROP TABLE IF EXISTS Monthly_Brand_Registration;
# DROP TABLE IF EXISTS Monthly_Model_Registration;
# DROP TABLE IF EXISTS Car_Model;
# DROP TABLE IF EXISTS Brand;
#
# -- 3. 안전하게 삭제가 끝났으므로 외래키 체크를 다시 켭니다.
# SET FOREIGN_KEY_CHECKS = 1;

-- 1. 브랜드 테이블 (Brand)
CREATE TABLE Brand (
    brand_id INT NOT NULL,
    brand_name VARCHAR(50) NOT NULL,
    PRIMARY KEY (brand_id)
);

-- 2. 모델 테이블 (Car_Model)
CREATE TABLE Car_Model (
    model_id INT NOT NULL,
    brand_id INT NOT NULL,
    model_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (model_id),
    FOREIGN KEY (brand_id) REFERENCES Brand(brand_id)
);

-- 3. 월별/모델별 등록데이터 테이블 (Monthly_Model_Registration)
CREATE TABLE Monthly_Model_Registration (
    reg_id INT NOT NULL,
    model_id INT NOT NULL,
    brand_name VARCHAR(50) NOT NULL,
    year INT NOT NULL,
    month INT NOT NULL,
    monthly_reg_count INT NOT NULL,
    PRIMARY KEY (reg_id),
    FOREIGN KEY (model_id) REFERENCES Car_Model(model_id)
);

-- 4. 월별/브랜드별 등록데이터 테이블 (Monthly_Brand_Registration)
CREATE TABLE Monthly_Brand_Registration (
    sales_id INT NOT NULL AUTO_INCREMENT,
    year INT NOT NULL,                      -- 년 (예: 2024)
    month INT NOT NULL,                     -- 월 (예: 1)
    brand_name VARCHAR(50) NOT NULL,        -- 브랜드명 (예: 기아, 현대, 테슬라)
    sales_count INT NOT NULL,               -- 브랜드별 총 판매량 (예: 44683)
    PRIMARY KEY (sales_id)
);

-- 5. 연령대별 통계 테이블 (Age_Registration)
CREATE TABLE Age_Registration (
    age_reg_id INT NOT NULL AUTO_INCREMENT,
    brand_id INT NULL,
    model_id INT NULL,
    age_group VARCHAR(20) NOT NULL,
    gubun VARCHAR(20) NOT NULL,
    ranking INT NOT NULL,
    age_reg_count INT NOT NULL,
    PRIMARY KEY (age_reg_id),
    FOREIGN KEY (brand_id) REFERENCES Brand(brand_id),
    FOREIGN KEY (model_id) REFERENCES Car_Model(model_id)
);

-- 6. 성별 통계 테이블 (Gender_Registration)
CREATE TABLE Gender_Registration (
    gender_reg_id INT NOT NULL,
    brand_id INT NULL,
    model_id INT NULL,
    gender VARCHAR(20) NOT NULL,
    gubun VARCHAR(20) NOT NULL,
    ranking INT NOT NULL,
    gender_reg_count INT NOT NULL,
    PRIMARY KEY (gender_reg_id),
    FOREIGN KEY (brand_id) REFERENCES Brand(brand_id),
    FOREIGN KEY (model_id) REFERENCES Car_Model(model_id)
);

-- 7. 크롤링 기반 FAQ 캐싱 테이블
CREATE TABLE FAQ (
    faq_id INT NOT NULL AUTO_INCREMENT,
    keyword VARCHAR(50) NOT NULL,
    question TEXT NOT NULL,
    answer TEXT NOT NULL,
    source_url VARCHAR(255) NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (faq_id)
);