-- =================================================================================
-- 남성 브랜드 TOP 5
-- =================================================================================
SELECT
    gr.gender                                                               AS 성별,
    b.brand_name                                                            AS 브랜드,
    gr.gender_reg_count                                                     AS 등록량,
    ROW_NUMBER() OVER (ORDER BY gr.gender_reg_count DESC)                  AS 순위
FROM Gender_Registration gr
JOIN Brand b ON gr.brand_id = b.brand_id
WHERE gr.gender = '남성' AND gr.gubun = '브랜드'
ORDER BY 등록량 DESC
LIMIT 5;

-- =================================================================================
-- 여성 브랜드 TOP 5 # 2,3위 기아 중복확인
-- =================================================================================
SELECT
    gr.gender                                                               AS 성별,
    b.brand_name                                                            AS 브랜드,
    gr.gender_reg_count                                                     AS 등록량,
    ROW_NUMBER() OVER (ORDER BY gr.gender_reg_count DESC)                  AS 순위
FROM Gender_Registration gr
JOIN Brand b ON gr.brand_id = b.brand_id
WHERE gr.gender = '여성' AND gr.gubun = '브랜드'
ORDER BY 등록량 DESC
LIMIT 6;

-- =================================================================================
-- 남성 전체 모델 TOP 5
-- =================================================================================
SELECT
    gr.gender                                                               AS 성별,
    b.brand_name                                                            AS 브랜드,
    cm.model_name                                                           AS 모델,
    gr.gender_reg_count                                                     AS 등록량,
    ROW_NUMBER() OVER (ORDER BY gr.gender_reg_count DESC)                  AS 순위
FROM Gender_Registration gr
JOIN Brand b ON gr.brand_id = b.brand_id
JOIN Car_Model cm ON gr.model_id = cm.model_id
WHERE gr.gender = '남성' AND gr.model_id IS NOT NULL
ORDER BY 등록량 DESC
LIMIT 5;

-- =================================================================================
-- 여성 전체 차종 TOP 5
-- =================================================================================
SELECT
    gr.gender                                                               AS 성별,
    b.brand_name                                                            AS 브랜드,
    cm.model_name                                                           AS 모델,
    gr.gender_reg_count                                                     AS 등록량,
    ROW_NUMBER() OVER (ORDER BY gr.gender_reg_count DESC)                  AS 순위
FROM Gender_Registration gr
JOIN Brand b ON gr.brand_id = b.brand_id
JOIN Car_Model cm ON gr.model_id = cm.model_id
WHERE gr.gender = '여성' AND gr.model_id IS NOT NULL
ORDER BY 등록량 DESC
LIMIT 5;

-- =================================================================================
-- 남성 테슬라 선호 모델 TOP 5
-- =================================================================================
SELECT
    성별, 브랜드, 모델, 등록량,
    ROW_NUMBER() OVER (ORDER BY 등록량 DESC)                               AS 순위
FROM (
    SELECT
        gr.gender                                                           AS 성별,
        b.brand_name                                                        AS 브랜드,
        cm.model_name                                                       AS 모델,
        gr.gender_reg_count                                                 AS 등록량
    FROM Gender_Registration gr
    JOIN Car_Model cm ON gr.model_id = cm.model_id
    JOIN Brand b     ON cm.brand_id  = b.brand_id
    WHERE gr.gender = '남성' AND gr.gubun = '모델' AND b.brand_name = '테슬라'

    UNION ALL

    SELECT
        '남성'                                                              AS 성별,
        b.brand_name                                                        AS 브랜드,
        cm.model_name                                                       AS 모델,
        SUM(mr.monthly_reg_count)                                           AS 등록량
    FROM Car_Model cm
    JOIN Brand b               ON cm.brand_id  = b.brand_id
    JOIN Monthly_Registration mr ON cm.model_id = mr.model_id
    WHERE b.brand_name = '테슬라'
      AND NOT EXISTS (
          SELECT 1 FROM Gender_Registration gr2
          WHERE gr2.model_id = cm.model_id
            AND gr2.gender   = '남성'
            AND gr2.gubun    = '모델'
      )
    GROUP BY b.brand_name, cm.model_name
) combined
ORDER BY 등록량 DESC
LIMIT 5;

-- =================================================================================
-- 남성 기아 선호 차종 TOP 5
-- =================================================================================
SELECT
    성별, 브랜드, 모델, 등록량,
    ROW_NUMBER() OVER (ORDER BY 등록량 DESC)                               AS 순위
FROM (
    -- Gender_Registration 에 model_id 가 매칭된 기아 남성 모델
    SELECT
        gr.gender                                                           AS 성별,
        b.brand_name                                                        AS 브랜드,
        cm.model_name                                                       AS 모델,
        gr.gender_reg_count                                                 AS 등록량
    FROM Gender_Registration gr
    JOIN Car_Model cm ON gr.model_id = cm.model_id
    JOIN Brand b     ON cm.brand_id  = b.brand_id
    WHERE gr.gender = '남성' AND gr.gubun = '모델' AND b.brand_name = '기아'

    UNION ALL

    -- Gender_Registration 에 누락된 기아 모델을 Monthly_Registration 합계로 보완
    SELECT
        '남성'                                                              AS 성별,
        b.brand_name                                                        AS 브랜드,
        cm.model_name                                                       AS 모델,
        SUM(mr.monthly_reg_count)                                           AS 등록량
    FROM Car_Model cm
    JOIN Brand b               ON cm.brand_id  = b.brand_id
    JOIN Monthly_Registration mr ON cm.model_id = mr.model_id
    WHERE b.brand_name = '기아'
      AND NOT EXISTS (
          SELECT 1 FROM Gender_Registration gr2
          WHERE gr2.model_id = cm.model_id
            AND gr2.gender   = '남성'
            AND gr2.gubun    = '모델'
      )
    GROUP BY b.brand_name, cm.model_name
) combined
ORDER BY 등록량 DESC
LIMIT 5;

-- =================================================================================
-- 남성 현대 선호 차종 TOP 5
-- =================================================================================
SELECT
    성별, 브랜드, 모델, 등록량,
    ROW_NUMBER() OVER (ORDER BY 등록량 DESC)                               AS 순위
FROM (
    -- Gender_Registration 에 model_id 가 매칭된 현대 남성 모델
    SELECT
        gr.gender                                                           AS 성별,
        b.brand_name                                                        AS 브랜드,
        cm.model_name                                                       AS 모델,
        gr.gender_reg_count                                                 AS 등록량
    FROM Gender_Registration gr
    JOIN Car_Model cm ON gr.model_id = cm.model_id
    JOIN Brand b     ON cm.brand_id  = b.brand_id
    WHERE gr.gender = '남성' AND gr.gubun = '모델' AND b.brand_name = '현대'

    UNION ALL

    -- Gender_Registration 에 누락된 현대 모델을 Monthly_Registration 합계로 보완
    SELECT
        '남성'                                                              AS 성별,
        b.brand_name                                                        AS 브랜드,
        cm.model_name                                                       AS 모델,
        SUM(mr.monthly_reg_count)                                           AS 등록량
    FROM Car_Model cm
    JOIN Brand b               ON cm.brand_id  = b.brand_id
    JOIN Monthly_Registration mr ON cm.model_id = mr.model_id
    WHERE b.brand_name = '현대'
      AND NOT EXISTS (
          SELECT 1 FROM Gender_Registration gr2
          WHERE gr2.model_id = cm.model_id
            AND gr2.gender   = '남성'
            AND gr2.gubun    = '모델'
      )
    GROUP BY b.brand_name, cm.model_name
) combined
ORDER BY 등록량 DESC
LIMIT 5;

-- =================================================================================
-- 여성 테슬라 선호 차종 TOP 5
-- =================================================================================
SELECT
    성별, 브랜드, 모델, 등록량,
    ROW_NUMBER() OVER (ORDER BY 등록량 DESC)                               AS 순위
FROM (
    SELECT
        gr.gender                                                           AS 성별,
        b.brand_name                                                        AS 브랜드,
        cm.model_name                                                       AS 모델,
        gr.gender_reg_count                                                 AS 등록량
    FROM Gender_Registration gr
    JOIN Car_Model cm ON gr.model_id = cm.model_id
    JOIN Brand b     ON cm.brand_id  = b.brand_id
    WHERE gr.gender = '여성' AND gr.gubun = '모델' AND b.brand_name = '테슬라'

    UNION ALL

    SELECT
        '여성'                                                              AS 성별,
        b.brand_name                                                        AS 브랜드,
        cm.model_name                                                       AS 모델,
        SUM(mr.monthly_reg_count)                                           AS 등록량
    FROM Car_Model cm
    JOIN Brand b               ON cm.brand_id  = b.brand_id
    JOIN Monthly_Registration mr ON cm.model_id = mr.model_id
    WHERE b.brand_name = '테슬라'
      AND NOT EXISTS (
          SELECT 1 FROM Gender_Registration gr2
          WHERE gr2.model_id = cm.model_id
            AND gr2.gender   = '여성'
            AND gr2.gubun    = '모델'
      )
    GROUP BY b.brand_name, cm.model_name
) combined
ORDER BY 등록량 DESC
LIMIT 5;

-- =================================================================================
-- 여성 기아 선호 차종 TOP 5
-- =================================================================================
SELECT
    성별, 브랜드, 모델, 등록량,
    ROW_NUMBER() OVER (ORDER BY 등록량 DESC)                               AS 순위
FROM (
    SELECT
        gr.gender                                                           AS 성별,
        b.brand_name                                                        AS 브랜드,
        cm.model_name                                                       AS 모델,
        gr.gender_reg_count                                                 AS 등록량
    FROM Gender_Registration gr
    JOIN Car_Model cm ON gr.model_id = cm.model_id
    JOIN Brand b     ON cm.brand_id  = b.brand_id
    WHERE gr.gender = '여성' AND gr.gubun = '모델' AND b.brand_name = '기아'

    UNION ALL

    SELECT
        '여성'                                                              AS 성별,
        b.brand_name                                                        AS 브랜드,
        cm.model_name                                                       AS 모델,
        SUM(mr.monthly_reg_count)                                           AS 등록량
    FROM Car_Model cm
    JOIN Brand b               ON cm.brand_id  = b.brand_id
    JOIN Monthly_Registration mr ON cm.model_id = mr.model_id
    WHERE b.brand_name = '기아'
      AND NOT EXISTS (
          SELECT 1 FROM Gender_Registration gr2
          WHERE gr2.model_id = cm.model_id
            AND gr2.gender   = '여성'
            AND gr2.gubun    = '모델'
      )
    GROUP BY b.brand_name, cm.model_name
) combined
ORDER BY 등록량 DESC
LIMIT 5;

-- =================================================================================
-- 여성 현대 선호 차종 TOP 5
-- =================================================================================
SELECT
    성별, 브랜드, 모델, 등록량,
    ROW_NUMBER() OVER (ORDER BY 등록량 DESC)                               AS 순위
FROM (
    SELECT
        gr.gender                                                           AS 성별,
        b.brand_name                                                        AS 브랜드,
        cm.model_name                                                       AS 모델,
        gr.gender_reg_count                                                 AS 등록량
    FROM Gender_Registration gr
    JOIN Car_Model cm ON gr.model_id = cm.model_id
    JOIN Brand b     ON cm.brand_id  = b.brand_id
    WHERE gr.gender = '여성' AND gr.gubun = '모델' AND b.brand_name = '현대'

    UNION ALL

    SELECT
        '여성'                                                              AS 성별,
        b.brand_name                                                        AS 브랜드,
        cm.model_name                                                       AS 모델,
        SUM(mr.monthly_reg_count)                                           AS 등록량
    FROM Car_Model cm
    JOIN Brand b               ON cm.brand_id  = b.brand_id
    JOIN Monthly_Registration mr ON cm.model_id = mr.model_id
    WHERE b.brand_name = '현대'
      AND NOT EXISTS (
          SELECT 1 FROM Gender_Registration gr2
          WHERE gr2.model_id = cm.model_id
            AND gr2.gender   = '여성'
            AND gr2.gubun    = '모델'
      )
    GROUP BY b.brand_name, cm.model_name
) combined
ORDER BY 등록량 DESC
LIMIT 5;
