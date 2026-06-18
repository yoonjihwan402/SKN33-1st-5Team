-- =======================
-- 값 초기화 코드
-- =======================

/*
SET FOREIGN_KEY_CHECKS=0;
TRUNCATE TABLE Gender_Registration;
TRUNCATE TABLE Age_Registration;
TRUNCATE TABLE Monthly_Registration;
TRUNCATE TABLE Car_Model;
TRUNCATE TABLE Brand;
SET FOREIGN_KEY_CHECKS=1;
*/

-- =================================================================================
-- 전체 기간(2024~2026) 테슬라 TOP 10 판매량
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '테슬라'
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드, 브랜드내순위;

-- =================================================================================
-- 전체 기간(2024~2026) 기아 TOP 10 판매량
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '기아'
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드, 브랜드내순위;

-- =================================================================================
-- 전체 기간(2024~2026) 현대 TOP 10 판매량
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '현대'
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드, 브랜드내순위;

-- =================================================================================
-- 2024년 테슬라 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '테슬라' AND mr.year = 2024
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2024년 기아 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '기아' AND mr.year = 2024
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2024년 현대 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '현대' AND mr.year = 2024
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2025년 테슬라 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '테슬라' AND mr.year = 2025
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2025년 기아 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '기아' AND mr.year = 2025
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2025년 현대 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '현대' AND mr.year = 2025
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2026년 테슬라 TOP 10 (1~5월 기준)
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '테슬라' AND mr.year = 2026
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2026년 기아 TOP 10 (1~5월 기준)
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '기아' AND mr.year = 2026
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2026년 현대 TOP 10 (1~5월 기준)
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '현대' AND mr.year = 2026
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2024년 상반기 테슬라 TOP 10 (1~6월)
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '테슬라' AND mr.year = 2024 AND mr.month BETWEEN 1 AND 6
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2024년 상반기 기아 TOP 10 (1~6월)
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '기아' AND mr.year = 2024 AND mr.month BETWEEN 1 AND 6
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2024년 상반기 현대 TOP 10 (1~6월)
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '현대' AND mr.year = 2024 AND mr.month BETWEEN 1 AND 6
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2024년 하반기 테슬라 TOP 10 (7~12월)
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '테슬라' AND mr.year = 2024 AND mr.month BETWEEN 7 AND 12
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2024년 하반기 기아 TOP 10 (7~12월)
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '기아' AND mr.year = 2024 AND mr.month BETWEEN 7 AND 12
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2024년 하반기 현대 TOP 10 (7~12월)
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '현대' AND mr.year = 2024 AND mr.month BETWEEN 7 AND 12
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2025년 상반기 테슬라 TOP 10 (1~6월)
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '테슬라' AND mr.year = 2025 AND mr.month BETWEEN 1 AND 6
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2025년 상반기 기아 TOP 10 (1~6월)
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '기아' AND mr.year = 2025 AND mr.month BETWEEN 1 AND 6
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2025년 상반기 현대 TOP 10 (1~6월)
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '현대' AND mr.year = 2025 AND mr.month BETWEEN 1 AND 6
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2025년 하반기 테슬라 TOP 10 (7~12월)
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '테슬라' AND mr.year = 2025 AND mr.month BETWEEN 7 AND 12
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2025년 하반기 기아 TOP 10 (7~12월)
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '기아' AND mr.year = 2025 AND mr.month BETWEEN 7 AND 12
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2025년 하반기 현대 TOP 10 (7~12월)
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '현대' AND mr.year = 2025 AND mr.month BETWEEN 7 AND 12
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2026년 상반기 테슬라 TOP 10 (1~6월)
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '테슬라' AND mr.year = 2026 AND mr.month BETWEEN 1 AND 6
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2026년 상반기 기아 TOP 10 (1~6월)
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '기아' AND mr.year = 2026 AND mr.month BETWEEN 1 AND 6
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2026년 상반기 현대 TOP 10 (1~6월)
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '현대' AND mr.year = 2026 AND mr.month BETWEEN 1 AND 6
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 월별 쿼리 (2024년 1월 ~ 2026년 5월, 브랜드별)
-- =================================================================================

-- =================================================================================
-- 2024년 1월 테슬라 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '테슬라' AND mr.year = 2024 AND mr.month = 1
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2024년 1월 기아 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '기아' AND mr.year = 2024 AND mr.month = 1
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2024년 1월 현대 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '현대' AND mr.year = 2024 AND mr.month = 1
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2024년 2월 테슬라 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '테슬라' AND mr.year = 2024 AND mr.month = 2
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2024년 2월 기아 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '기아' AND mr.year = 2024 AND mr.month = 2
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2024년 2월 현대 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '현대' AND mr.year = 2024 AND mr.month = 2
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2024년 3월 테슬라 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '테슬라' AND mr.year = 2024 AND mr.month = 3
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2024년 3월 기아 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '기아' AND mr.year = 2024 AND mr.month = 3
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2024년 3월 현대 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '현대' AND mr.year = 2024 AND mr.month = 3
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2024년 4월 테슬라 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '테슬라' AND mr.year = 2024 AND mr.month = 4
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2024년 4월 기아 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '기아' AND mr.year = 2024 AND mr.month = 4
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2024년 4월 현대 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '현대' AND mr.year = 2024 AND mr.month = 4
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2024년 5월 테슬라 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '테슬라' AND mr.year = 2024 AND mr.month = 5
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2024년 5월 기아 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '기아' AND mr.year = 2024 AND mr.month = 5
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2024년 5월 현대 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '현대' AND mr.year = 2024 AND mr.month = 5
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2024년 6월 테슬라 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '테슬라' AND mr.year = 2024 AND mr.month = 6
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2024년 6월 기아 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '기아' AND mr.year = 2024 AND mr.month = 6
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2024년 6월 현대 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '현대' AND mr.year = 2024 AND mr.month = 6
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2024년 7월 테슬라 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '테슬라' AND mr.year = 2024 AND mr.month = 7
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2024년 7월 기아 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '기아' AND mr.year = 2024 AND mr.month = 7
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2024년 7월 현대 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '현대' AND mr.year = 2024 AND mr.month = 7
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2024년 8월 테슬라 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '테슬라' AND mr.year = 2024 AND mr.month = 8
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2024년 8월 기아 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '기아' AND mr.year = 2024 AND mr.month = 8
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2024년 8월 현대 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '현대' AND mr.year = 2024 AND mr.month = 8
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2024년 9월 테슬라 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '테슬라' AND mr.year = 2024 AND mr.month = 9
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2024년 9월 기아 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '기아' AND mr.year = 2024 AND mr.month = 9
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2024년 9월 현대 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '현대' AND mr.year = 2024 AND mr.month = 9
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2024년 10월 테슬라 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '테슬라' AND mr.year = 2024 AND mr.month = 10
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2024년 10월 기아 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '기아' AND mr.year = 2024 AND mr.month = 10
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2024년 10월 현대 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '현대' AND mr.year = 2024 AND mr.month = 10
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2024년 11월 테슬라 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '테슬라' AND mr.year = 2024 AND mr.month = 11
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2024년 11월 기아 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '기아' AND mr.year = 2024 AND mr.month = 11
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2024년 11월 현대 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '현대' AND mr.year = 2024 AND mr.month = 11
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2024년 12월 테슬라 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '테슬라' AND mr.year = 2024 AND mr.month = 12
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2024년 12월 기아 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '기아' AND mr.year = 2024 AND mr.month = 12
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2024년 12월 현대 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '현대' AND mr.year = 2024 AND mr.month = 12
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2025년 1월 테슬라 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '테슬라' AND mr.year = 2025 AND mr.month = 1
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2025년 1월 기아 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '기아' AND mr.year = 2025 AND mr.month = 1
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2025년 1월 현대 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '현대' AND mr.year = 2025 AND mr.month = 1
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2025년 2월 테슬라 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '테슬라' AND mr.year = 2025 AND mr.month = 2
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2025년 2월 기아 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '기아' AND mr.year = 2025 AND mr.month = 2
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2025년 2월 현대 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '현대' AND mr.year = 2025 AND mr.month = 2
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2025년 3월 테슬라 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '테슬라' AND mr.year = 2025 AND mr.month = 3
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2025년 3월 기아 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '기아' AND mr.year = 2025 AND mr.month = 3
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2025년 3월 현대 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '현대' AND mr.year = 2025 AND mr.month = 3
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2025년 4월 테슬라 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '테슬라' AND mr.year = 2025 AND mr.month = 4
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2025년 4월 기아 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '기아' AND mr.year = 2025 AND mr.month = 4
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2025년 4월 현대 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '현대' AND mr.year = 2025 AND mr.month = 4
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2025년 5월 테슬라 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '테슬라' AND mr.year = 2025 AND mr.month = 5
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2025년 5월 기아 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '기아' AND mr.year = 2025 AND mr.month = 5
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2025년 5월 현대 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '현대' AND mr.year = 2025 AND mr.month = 5
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2025년 6월 테슬라 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '테슬라' AND mr.year = 2025 AND mr.month = 6
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2025년 6월 기아 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '기아' AND mr.year = 2025 AND mr.month = 6
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2025년 6월 현대 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '현대' AND mr.year = 2025 AND mr.month = 6
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2025년 7월 테슬라 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '테슬라' AND mr.year = 2025 AND mr.month = 7
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2025년 7월 기아 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '기아' AND mr.year = 2025 AND mr.month = 7
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2025년 7월 현대 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '현대' AND mr.year = 2025 AND mr.month = 7
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2025년 8월 테슬라 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '테슬라' AND mr.year = 2025 AND mr.month = 8
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2025년 8월 기아 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '기아' AND mr.year = 2025 AND mr.month = 8
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2025년 8월 현대 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '현대' AND mr.year = 2025 AND mr.month = 8
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2025년 9월 테슬라 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '테슬라' AND mr.year = 2025 AND mr.month = 9
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2025년 9월 기아 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '기아' AND mr.year = 2025 AND mr.month = 9
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2025년 9월 현대 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '현대' AND mr.year = 2025 AND mr.month = 9
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2025년 10월 테슬라 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '테슬라' AND mr.year = 2025 AND mr.month = 10
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2025년 10월 기아 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '기아' AND mr.year = 2025 AND mr.month = 10
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2025년 10월 현대 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '현대' AND mr.year = 2025 AND mr.month = 10
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2025년 11월 테슬라 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '테슬라' AND mr.year = 2025 AND mr.month = 11
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2025년 11월 기아 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '기아' AND mr.year = 2025 AND mr.month = 11
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2025년 11월 현대 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '현대' AND mr.year = 2025 AND mr.month = 11
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2025년 12월 테슬라 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '테슬라' AND mr.year = 2025 AND mr.month = 12
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2025년 12월 기아 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '기아' AND mr.year = 2025 AND mr.month = 12
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2025년 12월 현대 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '현대' AND mr.year = 2025 AND mr.month = 12
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2026년 1월 테슬라 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '테슬라' AND mr.year = 2026 AND mr.month = 1
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2026년 1월 기아 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '기아' AND mr.year = 2026 AND mr.month = 1
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2026년 1월 현대 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '현대' AND mr.year = 2026 AND mr.month = 1
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2026년 2월 테슬라 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '테슬라' AND mr.year = 2026 AND mr.month = 2
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2026년 2월 기아 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '기아' AND mr.year = 2026 AND mr.month = 2
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2026년 2월 현대 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '현대' AND mr.year = 2026 AND mr.month = 2
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2026년 3월 테슬라 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '테슬라' AND mr.year = 2026 AND mr.month = 3
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2026년 3월 기아 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '기아' AND mr.year = 2026 AND mr.month = 3
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2026년 3월 현대 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '현대' AND mr.year = 2026 AND mr.month = 3
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2026년 4월 테슬라 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '테슬라' AND mr.year = 2026 AND mr.month = 4
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2026년 4월 기아 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '기아' AND mr.year = 2026 AND mr.month = 4
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2026년 4월 현대 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '현대' AND mr.year = 2026 AND mr.month = 4
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2026년 5월 테슬라 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '테슬라' AND mr.year = 2026 AND mr.month = 5
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2026년 5월 기아 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '기아' AND mr.year = 2026 AND mr.month = 5
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 2026년 5월 현대 TOP 10
-- =================================================================================
SELECT 브랜드, 모델, 누적판매량, 브랜드내순위
FROM (
    SELECT
        b.brand_name                                                                          AS 브랜드,
        cm.model_name                                                                         AS 모델,
        SUM(mr.monthly_reg_count)                                                             AS 누적판매량,
        ROW_NUMBER() OVER (PARTITION BY b.brand_name ORDER BY SUM(mr.monthly_reg_count) DESC) AS 브랜드내순위
    FROM Monthly_Registration mr
    JOIN Car_Model cm ON mr.model_id = cm.model_id
    JOIN Brand b ON cm.brand_id = b.brand_id
    WHERE b.brand_name = '현대' AND mr.year = 2026 AND mr.month = 5
    GROUP BY b.brand_name, cm.model_name
) ranked
WHERE 브랜드내순위 <= 10
ORDER BY 브랜드내순위;

-- =================================================================================
-- 모델별 누적 판매량 TOP 10 (전체 브랜드)
-- =================================================================================
SELECT
    b.brand_name AS brand,
    cm.model_name AS model,
    SUM(mr.monthly_reg_count) AS 총판매량,
    ROW_NUMBER() OVER (ORDER BY SUM(mr.monthly_reg_count) DESC) AS 순위
FROM Monthly_Registration mr
JOIN Car_Model cm ON mr.model_id = cm.model_id
JOIN Brand b ON cm.brand_id = b.brand_id
GROUP BY b.brand_name, cm.model_name
ORDER BY 총판매량 DESC
LIMIT 10;
