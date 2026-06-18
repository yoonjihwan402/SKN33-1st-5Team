-- =================================================================================
-- 20대 이하 선호 브랜드 TOP 5
-- =================================================================================
SELECT
    연령대, 브랜드명, 등록량,
    ROW_NUMBER() OVER (ORDER BY 등록량 DESC)                               AS 순위
FROM (
    SELECT
        a.age_group                                                         AS 연령대,
        b.brand_name                                                        AS 브랜드명,
        MAX(a.age_reg_count)                                                AS 등록량
    FROM Age_Registration a
    JOIN Brand b ON a.brand_id = b.brand_id
    WHERE a.age_group = '20대 이하' AND a.gubun = '브랜드'
    GROUP BY a.age_group, b.brand_name
) sub
ORDER BY 등록량 DESC
LIMIT 5;

-- =================================================================================
-- 30대 선호 브랜드 TOP 5
-- =================================================================================
SELECT
    연령대, 브랜드명, 등록량,
    ROW_NUMBER() OVER (ORDER BY 등록량 DESC)                               AS 순위
FROM (
    SELECT
        a.age_group                                                         AS 연령대,
        b.brand_name                                                        AS 브랜드명,
        MAX(a.age_reg_count)                                                AS 등록량
    FROM Age_Registration a
    JOIN Brand b ON a.brand_id = b.brand_id
    WHERE a.age_group = '30대' AND a.gubun = '브랜드'
    GROUP BY a.age_group, b.brand_name
) sub
ORDER BY 등록량 DESC
LIMIT 5;

-- =================================================================================
-- 40대 선호 브랜드 TOP 5
-- =================================================================================
SELECT
    연령대, 브랜드명, 등록량,
    ROW_NUMBER() OVER (ORDER BY 등록량 DESC)                               AS 순위
FROM (
    SELECT
        a.age_group                                                         AS 연령대,
        b.brand_name                                                        AS 브랜드명,
        MAX(a.age_reg_count)                                                AS 등록량
    FROM Age_Registration a
    JOIN Brand b ON a.brand_id = b.brand_id
    WHERE a.age_group = '40대' AND a.gubun = '브랜드'
    GROUP BY a.age_group, b.brand_name
) sub
ORDER BY 등록량 DESC
LIMIT 5;

-- =================================================================================
-- 50대 선호 브랜드 TOP 5
-- =================================================================================
SELECT
    연령대, 브랜드명, 등록량,
    ROW_NUMBER() OVER (ORDER BY 등록량 DESC)                               AS 순위
FROM (
    SELECT
        a.age_group                                                         AS 연령대,
        b.brand_name                                                        AS 브랜드명,
        MAX(a.age_reg_count)                                                AS 등록량
    FROM Age_Registration a
    JOIN Brand b ON a.brand_id = b.brand_id
    WHERE a.age_group = '50대' AND a.gubun = '브랜드'
    GROUP BY a.age_group, b.brand_name
) sub
ORDER BY 등록량 DESC
LIMIT 5;

-- =================================================================================
-- 60대 선호 브랜드 TOP 5
-- =================================================================================
SELECT
    연령대, 브랜드명, 등록량,
    ROW_NUMBER() OVER (ORDER BY 등록량 DESC)                               AS 순위
FROM (
    SELECT
        a.age_group                                                         AS 연령대,
        b.brand_name                                                        AS 브랜드명,
        MAX(a.age_reg_count)                                                AS 등록량
    FROM Age_Registration a
    JOIN Brand b ON a.brand_id = b.brand_id
    WHERE a.age_group = '60대' AND a.gubun = '브랜드'
    GROUP BY a.age_group, b.brand_name
) sub
ORDER BY 등록량 DESC
LIMIT 5;

-- =================================================================================
-- 70대 이상 선호 브랜드 TOP 5
-- =================================================================================
SELECT
    연령대, 브랜드명, 등록량,
    ROW_NUMBER() OVER (ORDER BY 등록량 DESC)                               AS 순위
FROM (
    SELECT
        a.age_group                                                         AS 연령대,
        b.brand_name                                                        AS 브랜드명,
        MAX(a.age_reg_count)                                                AS 등록량
    FROM Age_Registration a
    JOIN Brand b ON a.brand_id = b.brand_id
    WHERE a.age_group = '70대 이상' AND a.gubun = '브랜드'
    GROUP BY a.age_group, b.brand_name
) sub
ORDER BY 등록량 DESC
LIMIT 5;








-- =================================================================================
-- 20대 이하 테슬라 선호 모델 TOP 5
-- =================================================================================
SELECT
    연령대, 브랜드, 모델, 등록량,
    ROW_NUMBER() OVER (ORDER BY 등록량 DESC)                               AS 순위
FROM (
    SELECT
        ar.age_group                                                        AS 연령대,
        b.brand_name                                                        AS 브랜드,
        cm.model_name                                                       AS 모델,
        ar.age_reg_count                                                    AS 등록량
    FROM Age_Registration ar
    JOIN Car_Model cm ON ar.model_id = cm.model_id
    JOIN Brand b     ON cm.brand_id  = b.brand_id
    WHERE ar.age_group = '20대 이하' AND ar.gubun = '모델' AND b.brand_name = '테슬라'

    UNION ALL

    SELECT
        '20대 이하'                                                         AS 연령대,
        b.brand_name                                                        AS 브랜드,
        cm.model_name                                                       AS 모델,
        SUM(mr.monthly_reg_count)                                           AS 등록량
    FROM Car_Model cm
    JOIN Brand b               ON cm.brand_id  = b.brand_id
    JOIN Monthly_Registration mr ON cm.model_id = mr.model_id
    WHERE b.brand_name = '테슬라'
      AND NOT EXISTS (
          SELECT 1 FROM Age_Registration ar2
          WHERE ar2.model_id = cm.model_id
            AND ar2.age_group = '20대 이하'
            AND ar2.gubun    = '모델'
      )
    GROUP BY b.brand_name, cm.model_name
) combined
ORDER BY 등록량 DESC
LIMIT 5;

-- =================================================================================
-- 20대 이하 기아 선호 모델 TOP 5
-- =================================================================================
SELECT
    연령대, 브랜드, 모델, 등록량,
    ROW_NUMBER() OVER (ORDER BY 등록량 DESC)                               AS 순위
FROM (
    SELECT
        ar.age_group                                                        AS 연령대,
        b.brand_name                                                        AS 브랜드,
        cm.model_name                                                       AS 모델,
        ar.age_reg_count                                                    AS 등록량
    FROM Age_Registration ar
    JOIN Car_Model cm ON ar.model_id = cm.model_id
    JOIN Brand b     ON cm.brand_id  = b.brand_id
    WHERE ar.age_group = '20대 이하' AND ar.gubun = '모델' AND b.brand_name = '기아'

    UNION ALL

    SELECT
        '20대 이하'                                                         AS 연령대,
        b.brand_name                                                        AS 브랜드,
        cm.model_name                                                       AS 모델,
        SUM(mr.monthly_reg_count)                                           AS 등록량
    FROM Car_Model cm
    JOIN Brand b               ON cm.brand_id  = b.brand_id
    JOIN Monthly_Registration mr ON cm.model_id = mr.model_id
    WHERE b.brand_name = '기아'
      AND NOT EXISTS (
          SELECT 1 FROM Age_Registration ar2
          WHERE ar2.model_id = cm.model_id
            AND ar2.age_group = '20대 이하'
            AND ar2.gubun    = '모델'
      )
    GROUP BY b.brand_name, cm.model_name
) combined
ORDER BY 등록량 DESC
LIMIT 5;

-- =================================================================================
-- 20대 이하 현대 선호 모델 TOP 5
-- =================================================================================
SELECT
    연령대, 브랜드, 모델, 등록량,
    ROW_NUMBER() OVER (ORDER BY 등록량 DESC)                               AS 순위
FROM (
    SELECT
        ar.age_group                                                        AS 연령대,
        b.brand_name                                                        AS 브랜드,
        cm.model_name                                                       AS 모델,
        ar.age_reg_count                                                    AS 등록량
    FROM Age_Registration ar
    JOIN Car_Model cm ON ar.model_id = cm.model_id
    JOIN Brand b     ON cm.brand_id  = b.brand_id
    WHERE ar.age_group = '20대 이하' AND ar.gubun = '모델' AND b.brand_name = '현대'

    UNION ALL

    SELECT
        '20대 이하'                                                         AS 연령대,
        b.brand_name                                                        AS 브랜드,
        cm.model_name                                                       AS 모델,
        SUM(mr.monthly_reg_count)                                           AS 등록량
    FROM Car_Model cm
    JOIN Brand b               ON cm.brand_id  = b.brand_id
    JOIN Monthly_Registration mr ON cm.model_id = mr.model_id
    WHERE b.brand_name = '현대'
      AND NOT EXISTS (
          SELECT 1 FROM Age_Registration ar2
          WHERE ar2.model_id = cm.model_id
            AND ar2.age_group = '20대 이하'
            AND ar2.gubun    = '모델'
      )
    GROUP BY b.brand_name, cm.model_name
) combined
ORDER BY 등록량 DESC
LIMIT 5;

-- =================================================================================
-- 30대 테슬라 선호 모델 TOP 5
-- =================================================================================
SELECT
    연령대, 브랜드, 모델, 등록량,
    ROW_NUMBER() OVER (ORDER BY 등록량 DESC)                               AS 순위
FROM (
    SELECT
        ar.age_group                                                        AS 연령대,
        b.brand_name                                                        AS 브랜드,
        cm.model_name                                                       AS 모델,
        ar.age_reg_count                                                    AS 등록량
    FROM Age_Registration ar
    JOIN Car_Model cm ON ar.model_id = cm.model_id
    JOIN Brand b     ON cm.brand_id  = b.brand_id
    WHERE ar.age_group = '30대' AND ar.gubun = '모델' AND b.brand_name = '테슬라'

    UNION ALL

    SELECT
        '30대'                                                              AS 연령대,
        b.brand_name                                                        AS 브랜드,
        cm.model_name                                                       AS 모델,
        SUM(mr.monthly_reg_count)                                           AS 등록량
    FROM Car_Model cm
    JOIN Brand b               ON cm.brand_id  = b.brand_id
    JOIN Monthly_Registration mr ON cm.model_id = mr.model_id
    WHERE b.brand_name = '테슬라'
      AND NOT EXISTS (
          SELECT 1 FROM Age_Registration ar2
          WHERE ar2.model_id = cm.model_id
            AND ar2.age_group = '30대'
            AND ar2.gubun    = '모델'
      )
    GROUP BY b.brand_name, cm.model_name
) combined
ORDER BY 등록량 DESC
LIMIT 5;

-- =================================================================================
-- 30대 기아 선호 모델 TOP 5
-- =================================================================================
SELECT
    연령대, 브랜드, 모델, 등록량,
    ROW_NUMBER() OVER (ORDER BY 등록량 DESC)                               AS 순위
FROM (
    SELECT
        ar.age_group                                                        AS 연령대,
        b.brand_name                                                        AS 브랜드,
        cm.model_name                                                       AS 모델,
        ar.age_reg_count                                                    AS 등록량
    FROM Age_Registration ar
    JOIN Car_Model cm ON ar.model_id = cm.model_id
    JOIN Brand b     ON cm.brand_id  = b.brand_id
    WHERE ar.age_group = '30대' AND ar.gubun = '모델' AND b.brand_name = '기아'

    UNION ALL

    SELECT
        '30대'                                                              AS 연령대,
        b.brand_name                                                        AS 브랜드,
        cm.model_name                                                       AS 모델,
        SUM(mr.monthly_reg_count)                                           AS 등록량
    FROM Car_Model cm
    JOIN Brand b               ON cm.brand_id  = b.brand_id
    JOIN Monthly_Registration mr ON cm.model_id = mr.model_id
    WHERE b.brand_name = '기아'
      AND NOT EXISTS (
          SELECT 1 FROM Age_Registration ar2
          WHERE ar2.model_id = cm.model_id
            AND ar2.age_group = '30대'
            AND ar2.gubun    = '모델'
      )
    GROUP BY b.brand_name, cm.model_name
) combined
ORDER BY 등록량 DESC
LIMIT 5;

-- =================================================================================
-- 30대 현대 선호 모델 TOP 5
-- =================================================================================
SELECT
    연령대, 브랜드, 모델, 등록량,
    ROW_NUMBER() OVER (ORDER BY 등록량 DESC)                               AS 순위
FROM (
    SELECT
        ar.age_group                                                        AS 연령대,
        b.brand_name                                                        AS 브랜드,
        cm.model_name                                                       AS 모델,
        ar.age_reg_count                                                    AS 등록량
    FROM Age_Registration ar
    JOIN Car_Model cm ON ar.model_id = cm.model_id
    JOIN Brand b     ON cm.brand_id  = b.brand_id
    WHERE ar.age_group = '30대' AND ar.gubun = '모델' AND b.brand_name = '현대'

    UNION ALL

    SELECT
        '30대'                                                              AS 연령대,
        b.brand_name                                                        AS 브랜드,
        cm.model_name                                                       AS 모델,
        SUM(mr.monthly_reg_count)                                           AS 등록량
    FROM Car_Model cm
    JOIN Brand b               ON cm.brand_id  = b.brand_id
    JOIN Monthly_Registration mr ON cm.model_id = mr.model_id
    WHERE b.brand_name = '현대'
      AND NOT EXISTS (
          SELECT 1 FROM Age_Registration ar2
          WHERE ar2.model_id = cm.model_id
            AND ar2.age_group = '30대'
            AND ar2.gubun    = '모델'
      )
    GROUP BY b.brand_name, cm.model_name
) combined
ORDER BY 등록량 DESC
LIMIT 5;

-- =================================================================================
-- 40대 테슬라 선호 모델 TOP 5
-- =================================================================================
SELECT
    연령대, 브랜드, 모델, 등록량,
    ROW_NUMBER() OVER (ORDER BY 등록량 DESC)                               AS 순위
FROM (
    SELECT
        ar.age_group                                                        AS 연령대,
        b.brand_name                                                        AS 브랜드,
        cm.model_name                                                       AS 모델,
        ar.age_reg_count                                                    AS 등록량
    FROM Age_Registration ar
    JOIN Car_Model cm ON ar.model_id = cm.model_id
    JOIN Brand b     ON cm.brand_id  = b.brand_id
    WHERE ar.age_group = '40대' AND ar.gubun = '모델' AND b.brand_name = '테슬라'

    UNION ALL

    SELECT
        '40대'                                                              AS 연령대,
        b.brand_name                                                        AS 브랜드,
        cm.model_name                                                       AS 모델,
        SUM(mr.monthly_reg_count)                                           AS 등록량
    FROM Car_Model cm
    JOIN Brand b               ON cm.brand_id  = b.brand_id
    JOIN Monthly_Registration mr ON cm.model_id = mr.model_id
    WHERE b.brand_name = '테슬라'
      AND NOT EXISTS (
          SELECT 1 FROM Age_Registration ar2
          WHERE ar2.model_id = cm.model_id
            AND ar2.age_group = '40대'
            AND ar2.gubun    = '모델'
      )
    GROUP BY b.brand_name, cm.model_name
) combined
ORDER BY 등록량 DESC
LIMIT 5;

-- =================================================================================
-- 40대 기아 선호 모델 TOP 5
-- =================================================================================
SELECT
    연령대, 브랜드, 모델, 등록량,
    ROW_NUMBER() OVER (ORDER BY 등록량 DESC)                               AS 순위
FROM (
    SELECT
        ar.age_group                                                        AS 연령대,
        b.brand_name                                                        AS 브랜드,
        cm.model_name                                                       AS 모델,
        ar.age_reg_count                                                    AS 등록량
    FROM Age_Registration ar
    JOIN Car_Model cm ON ar.model_id = cm.model_id
    JOIN Brand b     ON cm.brand_id  = b.brand_id
    WHERE ar.age_group = '40대' AND ar.gubun = '모델' AND b.brand_name = '기아'

    UNION ALL

    SELECT
        '40대'                                                              AS 연령대,
        b.brand_name                                                        AS 브랜드,
        cm.model_name                                                       AS 모델,
        SUM(mr.monthly_reg_count)                                           AS 등록량
    FROM Car_Model cm
    JOIN Brand b               ON cm.brand_id  = b.brand_id
    JOIN Monthly_Registration mr ON cm.model_id = mr.model_id
    WHERE b.brand_name = '기아'
      AND NOT EXISTS (
          SELECT 1 FROM Age_Registration ar2
          WHERE ar2.model_id = cm.model_id
            AND ar2.age_group = '40대'
            AND ar2.gubun    = '모델'
      )
    GROUP BY b.brand_name, cm.model_name
) combined
ORDER BY 등록량 DESC
LIMIT 5;

-- =================================================================================
-- 40대 현대 선호 모델 TOP 5
-- =================================================================================
SELECT
    연령대, 브랜드, 모델, 등록량,
    ROW_NUMBER() OVER (ORDER BY 등록량 DESC)                               AS 순위
FROM (
    SELECT
        ar.age_group                                                        AS 연령대,
        b.brand_name                                                        AS 브랜드,
        cm.model_name                                                       AS 모델,
        ar.age_reg_count                                                    AS 등록량
    FROM Age_Registration ar
    JOIN Car_Model cm ON ar.model_id = cm.model_id
    JOIN Brand b     ON cm.brand_id  = b.brand_id
    WHERE ar.age_group = '40대' AND ar.gubun = '모델' AND b.brand_name = '현대'

    UNION ALL

    SELECT
        '40대'                                                              AS 연령대,
        b.brand_name                                                        AS 브랜드,
        cm.model_name                                                       AS 모델,
        SUM(mr.monthly_reg_count)                                           AS 등록량
    FROM Car_Model cm
    JOIN Brand b               ON cm.brand_id  = b.brand_id
    JOIN Monthly_Registration mr ON cm.model_id = mr.model_id
    WHERE b.brand_name = '현대'
      AND NOT EXISTS (
          SELECT 1 FROM Age_Registration ar2
          WHERE ar2.model_id = cm.model_id
            AND ar2.age_group = '40대'
            AND ar2.gubun    = '모델'
      )
    GROUP BY b.brand_name, cm.model_name
) combined
ORDER BY 등록량 DESC
LIMIT 5;

-- =================================================================================
-- 50대 테슬라 선호 모델 TOP 5
-- =================================================================================
SELECT
    연령대, 브랜드, 모델, 등록량,
    ROW_NUMBER() OVER (ORDER BY 등록량 DESC)                               AS 순위
FROM (
    SELECT
        ar.age_group                                                        AS 연령대,
        b.brand_name                                                        AS 브랜드,
        cm.model_name                                                       AS 모델,
        ar.age_reg_count                                                    AS 등록량
    FROM Age_Registration ar
    JOIN Car_Model cm ON ar.model_id = cm.model_id
    JOIN Brand b     ON cm.brand_id  = b.brand_id
    WHERE ar.age_group = '50대' AND ar.gubun = '모델' AND b.brand_name = '테슬라'

    UNION ALL

    SELECT
        '50대'                                                              AS 연령대,
        b.brand_name                                                        AS 브랜드,
        cm.model_name                                                       AS 모델,
        SUM(mr.monthly_reg_count)                                           AS 등록량
    FROM Car_Model cm
    JOIN Brand b               ON cm.brand_id  = b.brand_id
    JOIN Monthly_Registration mr ON cm.model_id = mr.model_id
    WHERE b.brand_name = '테슬라'
      AND NOT EXISTS (
          SELECT 1 FROM Age_Registration ar2
          WHERE ar2.model_id = cm.model_id
            AND ar2.age_group = '50대'
            AND ar2.gubun    = '모델'
      )
    GROUP BY b.brand_name, cm.model_name
) combined
ORDER BY 등록량 DESC
LIMIT 5;

-- =================================================================================
-- 50대 기아 선호 모델 TOP 5
-- =================================================================================
SELECT
    연령대, 브랜드, 모델, 등록량,
    ROW_NUMBER() OVER (ORDER BY 등록량 DESC)                               AS 순위
FROM (
    SELECT
        ar.age_group                                                        AS 연령대,
        b.brand_name                                                        AS 브랜드,
        cm.model_name                                                       AS 모델,
        ar.age_reg_count                                                    AS 등록량
    FROM Age_Registration ar
    JOIN Car_Model cm ON ar.model_id = cm.model_id
    JOIN Brand b     ON cm.brand_id  = b.brand_id
    WHERE ar.age_group = '50대' AND ar.gubun = '모델' AND b.brand_name = '기아'

    UNION ALL

    SELECT
        '50대'                                                              AS 연령대,
        b.brand_name                                                        AS 브랜드,
        cm.model_name                                                       AS 모델,
        SUM(mr.monthly_reg_count)                                           AS 등록량
    FROM Car_Model cm
    JOIN Brand b               ON cm.brand_id  = b.brand_id
    JOIN Monthly_Registration mr ON cm.model_id = mr.model_id
    WHERE b.brand_name = '기아'
      AND NOT EXISTS (
          SELECT 1 FROM Age_Registration ar2
          WHERE ar2.model_id = cm.model_id
            AND ar2.age_group = '50대'
            AND ar2.gubun    = '모델'
      )
    GROUP BY b.brand_name, cm.model_name
) combined
ORDER BY 등록량 DESC
LIMIT 5;

-- =================================================================================
-- 50대 현대 선호 모델 TOP 5
-- =================================================================================
SELECT
    연령대, 브랜드, 모델, 등록량,
    ROW_NUMBER() OVER (ORDER BY 등록량 DESC)                               AS 순위
FROM (
    SELECT
        ar.age_group                                                        AS 연령대,
        b.brand_name                                                        AS 브랜드,
        cm.model_name                                                       AS 모델,
        ar.age_reg_count                                                    AS 등록량
    FROM Age_Registration ar
    JOIN Car_Model cm ON ar.model_id = cm.model_id
    JOIN Brand b     ON cm.brand_id  = b.brand_id
    WHERE ar.age_group = '50대' AND ar.gubun = '모델' AND b.brand_name = '현대'

    UNION ALL

    SELECT
        '50대'                                                              AS 연령대,
        b.brand_name                                                        AS 브랜드,
        cm.model_name                                                       AS 모델,
        SUM(mr.monthly_reg_count)                                           AS 등록량
    FROM Car_Model cm
    JOIN Brand b               ON cm.brand_id  = b.brand_id
    JOIN Monthly_Registration mr ON cm.model_id = mr.model_id
    WHERE b.brand_name = '현대'
      AND NOT EXISTS (
          SELECT 1 FROM Age_Registration ar2
          WHERE ar2.model_id = cm.model_id
            AND ar2.age_group = '50대'
            AND ar2.gubun    = '모델'
      )
    GROUP BY b.brand_name, cm.model_name
) combined
ORDER BY 등록량 DESC
LIMIT 5;

-- =================================================================================
-- 60대 테슬라 선호 모델 TOP 5
-- =================================================================================
SELECT
    연령대, 브랜드, 모델, 등록량,
    ROW_NUMBER() OVER (ORDER BY 등록량 DESC)                               AS 순위
FROM (
    SELECT
        ar.age_group                                                        AS 연령대,
        b.brand_name                                                        AS 브랜드,
        cm.model_name                                                       AS 모델,
        ar.age_reg_count                                                    AS 등록량
    FROM Age_Registration ar
    JOIN Car_Model cm ON ar.model_id = cm.model_id
    JOIN Brand b     ON cm.brand_id  = b.brand_id
    WHERE ar.age_group = '60대' AND ar.gubun = '모델' AND b.brand_name = '테슬라'

    UNION ALL

    SELECT
        '60대'                                                              AS 연령대,
        b.brand_name                                                        AS 브랜드,
        cm.model_name                                                       AS 모델,
        SUM(mr.monthly_reg_count)                                           AS 등록량
    FROM Car_Model cm
    JOIN Brand b               ON cm.brand_id  = b.brand_id
    JOIN Monthly_Registration mr ON cm.model_id = mr.model_id
    WHERE b.brand_name = '테슬라'
      AND NOT EXISTS (
          SELECT 1 FROM Age_Registration ar2
          WHERE ar2.model_id = cm.model_id
            AND ar2.age_group = '60대'
            AND ar2.gubun    = '모델'
      )
    GROUP BY b.brand_name, cm.model_name
) combined
ORDER BY 등록량 DESC
LIMIT 5;

-- =================================================================================
-- 60대 기아 선호 모델 TOP 5
-- =================================================================================
SELECT
    연령대, 브랜드, 모델, 등록량,
    ROW_NUMBER() OVER (ORDER BY 등록량 DESC)                               AS 순위
FROM (
    SELECT
        ar.age_group                                                        AS 연령대,
        b.brand_name                                                        AS 브랜드,
        cm.model_name                                                       AS 모델,
        ar.age_reg_count                                                    AS 등록량
    FROM Age_Registration ar
    JOIN Car_Model cm ON ar.model_id = cm.model_id
    JOIN Brand b     ON cm.brand_id  = b.brand_id
    WHERE ar.age_group = '60대' AND ar.gubun = '모델' AND b.brand_name = '기아'

    UNION ALL

    SELECT
        '60대'                                                              AS 연령대,
        b.brand_name                                                        AS 브랜드,
        cm.model_name                                                       AS 모델,
        SUM(mr.monthly_reg_count)                                           AS 등록량
    FROM Car_Model cm
    JOIN Brand b               ON cm.brand_id  = b.brand_id
    JOIN Monthly_Registration mr ON cm.model_id = mr.model_id
    WHERE b.brand_name = '기아'
      AND NOT EXISTS (
          SELECT 1 FROM Age_Registration ar2
          WHERE ar2.model_id = cm.model_id
            AND ar2.age_group = '60대'
            AND ar2.gubun    = '모델'
      )
    GROUP BY b.brand_name, cm.model_name
) combined
ORDER BY 등록량 DESC
LIMIT 5;

-- =================================================================================
-- 60대 현대 선호 모델 TOP 5
-- =================================================================================
SELECT
    연령대, 브랜드, 모델, 등록량,
    ROW_NUMBER() OVER (ORDER BY 등록량 DESC)                               AS 순위
FROM (
    SELECT
        ar.age_group                                                        AS 연령대,
        b.brand_name                                                        AS 브랜드,
        cm.model_name                                                       AS 모델,
        ar.age_reg_count                                                    AS 등록량
    FROM Age_Registration ar
    JOIN Car_Model cm ON ar.model_id = cm.model_id
    JOIN Brand b     ON cm.brand_id  = b.brand_id
    WHERE ar.age_group = '60대' AND ar.gubun = '모델' AND b.brand_name = '현대'

    UNION ALL

    SELECT
        '60대'                                                              AS 연령대,
        b.brand_name                                                        AS 브랜드,
        cm.model_name                                                       AS 모델,
        SUM(mr.monthly_reg_count)                                           AS 등록량
    FROM Car_Model cm
    JOIN Brand b               ON cm.brand_id  = b.brand_id
    JOIN Monthly_Registration mr ON cm.model_id = mr.model_id
    WHERE b.brand_name = '현대'
      AND NOT EXISTS (
          SELECT 1 FROM Age_Registration ar2
          WHERE ar2.model_id = cm.model_id
            AND ar2.age_group = '60대'
            AND ar2.gubun    = '모델'
      )
    GROUP BY b.brand_name, cm.model_name
) combined
ORDER BY 등록량 DESC
LIMIT 5;

-- =================================================================================
-- 70대 이상 테슬라 선호 모델 TOP 5
-- =================================================================================
SELECT
    연령대, 브랜드, 모델, 등록량,
    ROW_NUMBER() OVER (ORDER BY 등록량 DESC)                               AS 순위
FROM (
    SELECT
        ar.age_group                                                        AS 연령대,
        b.brand_name                                                        AS 브랜드,
        cm.model_name                                                       AS 모델,
        ar.age_reg_count                                                    AS 등록량
    FROM Age_Registration ar
    JOIN Car_Model cm ON ar.model_id = cm.model_id
    JOIN Brand b     ON cm.brand_id  = b.brand_id
    WHERE ar.age_group = '70대 이상' AND ar.gubun = '모델' AND b.brand_name = '테슬라'

    UNION ALL

    SELECT
        '70대 이상'                                                         AS 연령대,
        b.brand_name                                                        AS 브랜드,
        cm.model_name                                                       AS 모델,
        SUM(mr.monthly_reg_count)                                           AS 등록량
    FROM Car_Model cm
    JOIN Brand b               ON cm.brand_id  = b.brand_id
    JOIN Monthly_Registration mr ON cm.model_id = mr.model_id
    WHERE b.brand_name = '테슬라'
      AND NOT EXISTS (
          SELECT 1 FROM Age_Registration ar2
          WHERE ar2.model_id = cm.model_id
            AND ar2.age_group = '70대 이상'
            AND ar2.gubun    = '모델'
      )
    GROUP BY b.brand_name, cm.model_name
) combined
ORDER BY 등록량 DESC
LIMIT 5;

-- =================================================================================
-- 70대 이상 기아 선호 모델 TOP 5
-- =================================================================================
SELECT
    연령대, 브랜드, 모델, 등록량,
    ROW_NUMBER() OVER (ORDER BY 등록량 DESC)                               AS 순위
FROM (
    SELECT
        ar.age_group                                                        AS 연령대,
        b.brand_name                                                        AS 브랜드,
        cm.model_name                                                       AS 모델,
        ar.age_reg_count                                                    AS 등록량
    FROM Age_Registration ar
    JOIN Car_Model cm ON ar.model_id = cm.model_id
    JOIN Brand b     ON cm.brand_id  = b.brand_id
    WHERE ar.age_group = '70대 이상' AND ar.gubun = '모델' AND b.brand_name = '기아'

    UNION ALL

    SELECT
        '70대 이상'                                                         AS 연령대,
        b.brand_name                                                        AS 브랜드,
        cm.model_name                                                       AS 모델,
        SUM(mr.monthly_reg_count)                                           AS 등록량
    FROM Car_Model cm
    JOIN Brand b               ON cm.brand_id  = b.brand_id
    JOIN Monthly_Registration mr ON cm.model_id = mr.model_id
    WHERE b.brand_name = '기아'
      AND NOT EXISTS (
          SELECT 1 FROM Age_Registration ar2
          WHERE ar2.model_id = cm.model_id
            AND ar2.age_group = '70대 이상'
            AND ar2.gubun    = '모델'
      )
    GROUP BY b.brand_name, cm.model_name
) combined
ORDER BY 등록량 DESC
LIMIT 5;

-- =================================================================================
-- 70대 이상 현대 선호 모델 TOP 5
-- =================================================================================
SELECT
    연령대, 브랜드, 모델, 등록량,
    ROW_NUMBER() OVER (ORDER BY 등록량 DESC)                               AS 순위
FROM (
    SELECT
        ar.age_group                                                        AS 연령대,
        b.brand_name                                                        AS 브랜드,
        cm.model_name                                                       AS 모델,
        ar.age_reg_count                                                    AS 등록량
    FROM Age_Registration ar
    JOIN Car_Model cm ON ar.model_id = cm.model_id
    JOIN Brand b     ON cm.brand_id  = b.brand_id
    WHERE ar.age_group = '70대 이상' AND ar.gubun = '모델' AND b.brand_name = '현대'

    UNION ALL

    SELECT
        '70대 이상'                                                         AS 연령대,
        b.brand_name                                                        AS 브랜드,
        cm.model_name                                                       AS 모델,
        SUM(mr.monthly_reg_count)                                           AS 등록량
    FROM Car_Model cm
    JOIN Brand b               ON cm.brand_id  = b.brand_id
    JOIN Monthly_Registration mr ON cm.model_id = mr.model_id
    WHERE b.brand_name = '현대'
      AND NOT EXISTS (
          SELECT 1 FROM Age_Registration ar2
          WHERE ar2.model_id = cm.model_id
            AND ar2.age_group = '70대 이상'
            AND ar2.gubun    = '모델'
      )
    GROUP BY b.brand_name, cm.model_name
) combined
ORDER BY 등록량 DESC
LIMIT 5;









-- =================================================================================
-- 20대 이하 선호 모델 TOP 5
-- =================================================================================
SELECT
    연령대, 브랜드, 모델, 등록량,
    ROW_NUMBER() OVER (ORDER BY 등록량 DESC)                               AS 순위
FROM (
    SELECT
        ar.age_group                                                        AS 연령대,
        b.brand_name                                                        AS 브랜드,
        cm.model_name                                                       AS 모델,
        ar.age_reg_count                                                    AS 등록량
    FROM Age_Registration ar
    JOIN Car_Model cm ON ar.model_id = cm.model_id
    JOIN Brand b     ON cm.brand_id  = b.brand_id
    WHERE ar.age_group = '20대 이하' AND ar.gubun = '모델'

    UNION ALL

    SELECT
        '20대 이하'                                                         AS 연령대,
        b.brand_name                                                        AS 브랜드,
        cm.model_name                                                       AS 모델,
        SUM(mr.monthly_reg_count)                                           AS 등록량
    FROM Car_Model cm
    JOIN Brand b               ON cm.brand_id  = b.brand_id
    JOIN Monthly_Registration mr ON cm.model_id = mr.model_id
    WHERE NOT EXISTS (
        SELECT 1 FROM Age_Registration ar2
        WHERE ar2.model_id = cm.model_id
          AND ar2.age_group = '20대 이하'
          AND ar2.gubun    = '모델'
    )
    GROUP BY b.brand_name, cm.model_name
) combined
ORDER BY 등록량 DESC
LIMIT 5;

-- =================================================================================
-- 30대 선호 모델 TOP 5
-- =================================================================================
SELECT
    연령대, 브랜드, 모델, 등록량,
    ROW_NUMBER() OVER (ORDER BY 등록량 DESC)                               AS 순위
FROM (
    SELECT
        ar.age_group                                                        AS 연령대,
        b.brand_name                                                        AS 브랜드,
        cm.model_name                                                       AS 모델,
        ar.age_reg_count                                                    AS 등록량
    FROM Age_Registration ar
    JOIN Car_Model cm ON ar.model_id = cm.model_id
    JOIN Brand b     ON cm.brand_id  = b.brand_id
    WHERE ar.age_group = '30대' AND ar.gubun = '모델'

    UNION ALL

    SELECT
        '30대'                                                              AS 연령대,
        b.brand_name                                                        AS 브랜드,
        cm.model_name                                                       AS 모델,
        SUM(mr.monthly_reg_count)                                           AS 등록량
    FROM Car_Model cm
    JOIN Brand b               ON cm.brand_id  = b.brand_id
    JOIN Monthly_Registration mr ON cm.model_id = mr.model_id
    WHERE NOT EXISTS (
        SELECT 1 FROM Age_Registration ar2
        WHERE ar2.model_id = cm.model_id
          AND ar2.age_group = '30대'
          AND ar2.gubun    = '모델'
    )
    GROUP BY b.brand_name, cm.model_name
) combined
ORDER BY 등록량 DESC
LIMIT 5;

-- =================================================================================
-- 40대 선호 모델 TOP 5
-- =================================================================================
SELECT
    연령대, 브랜드, 모델, 등록량,
    ROW_NUMBER() OVER (ORDER BY 등록량 DESC)                               AS 순위
FROM (
    SELECT
        ar.age_group                                                        AS 연령대,
        b.brand_name                                                        AS 브랜드,
        cm.model_name                                                       AS 모델,
        ar.age_reg_count                                                    AS 등록량
    FROM Age_Registration ar
    JOIN Car_Model cm ON ar.model_id = cm.model_id
    JOIN Brand b     ON cm.brand_id  = b.brand_id
    WHERE ar.age_group = '40대' AND ar.gubun = '모델'

    UNION ALL

    SELECT
        '40대'                                                              AS 연령대,
        b.brand_name                                                        AS 브랜드,
        cm.model_name                                                       AS 모델,
        SUM(mr.monthly_reg_count)                                           AS 등록량
    FROM Car_Model cm
    JOIN Brand b               ON cm.brand_id  = b.brand_id
    JOIN Monthly_Registration mr ON cm.model_id = mr.model_id
    WHERE NOT EXISTS (
        SELECT 1 FROM Age_Registration ar2
        WHERE ar2.model_id = cm.model_id
          AND ar2.age_group = '40대'
          AND ar2.gubun    = '모델'
    )
    GROUP BY b.brand_name, cm.model_name
) combined
ORDER BY 등록량 DESC
LIMIT 5;

-- =================================================================================
-- 50대 선호 모델 TOP 5
-- =================================================================================
SELECT
    연령대, 브랜드, 모델, 등록량,
    ROW_NUMBER() OVER (ORDER BY 등록량 DESC)                               AS 순위
FROM (
    SELECT
        ar.age_group                                                        AS 연령대,
        b.brand_name                                                        AS 브랜드,
        cm.model_name                                                       AS 모델,
        ar.age_reg_count                                                    AS 등록량
    FROM Age_Registration ar
    JOIN Car_Model cm ON ar.model_id = cm.model_id
    JOIN Brand b     ON cm.brand_id  = b.brand_id
    WHERE ar.age_group = '50대' AND ar.gubun = '모델'

    UNION ALL

    SELECT
        '50대'                                                              AS 연령대,
        b.brand_name                                                        AS 브랜드,
        cm.model_name                                                       AS 모델,
        SUM(mr.monthly_reg_count)                                           AS 등록량
    FROM Car_Model cm
    JOIN Brand b               ON cm.brand_id  = b.brand_id
    JOIN Monthly_Registration mr ON cm.model_id = mr.model_id
    WHERE NOT EXISTS (
        SELECT 1 FROM Age_Registration ar2
        WHERE ar2.model_id = cm.model_id
          AND ar2.age_group = '50대'
          AND ar2.gubun    = '모델'
    )
    GROUP BY b.brand_name, cm.model_name
) combined
ORDER BY 등록량 DESC
LIMIT 5;

-- =================================================================================
-- 60대 선호 모델 TOP 5
-- =================================================================================
SELECT
    연령대, 브랜드, 모델, 등록량,
    ROW_NUMBER() OVER (ORDER BY 등록량 DESC)                               AS 순위
FROM (
    SELECT
        ar.age_group                                                        AS 연령대,
        b.brand_name                                                        AS 브랜드,
        cm.model_name                                                       AS 모델,
        ar.age_reg_count                                                    AS 등록량
    FROM Age_Registration ar
    JOIN Car_Model cm ON ar.model_id = cm.model_id
    JOIN Brand b     ON cm.brand_id  = b.brand_id
    WHERE ar.age_group = '60대' AND ar.gubun = '모델'

    UNION ALL

    SELECT
        '60대'                                                              AS 연령대,
        b.brand_name                                                        AS 브랜드,
        cm.model_name                                                       AS 모델,
        SUM(mr.monthly_reg_count)                                           AS 등록량
    FROM Car_Model cm
    JOIN Brand b               ON cm.brand_id  = b.brand_id
    JOIN Monthly_Registration mr ON cm.model_id = mr.model_id
    WHERE NOT EXISTS (
        SELECT 1 FROM Age_Registration ar2
        WHERE ar2.model_id = cm.model_id
          AND ar2.age_group = '60대'
          AND ar2.gubun    = '모델'
    )
    GROUP BY b.brand_name, cm.model_name
) combined
ORDER BY 등록량 DESC
LIMIT 5;

-- =================================================================================
-- 70대 이상 선호 모델 TOP 5
-- =================================================================================
SELECT
    연령대, 브랜드, 모델, 등록량,
    ROW_NUMBER() OVER (ORDER BY 등록량 DESC)                               AS 순위
FROM (
    SELECT
        ar.age_group                                                        AS 연령대,
        b.brand_name                                                        AS 브랜드,
        cm.model_name                                                       AS 모델,
        ar.age_reg_count                                                    AS 등록량
    FROM Age_Registration ar
    JOIN Car_Model cm ON ar.model_id = cm.model_id
    JOIN Brand b     ON cm.brand_id  = b.brand_id
    WHERE ar.age_group = '70대 이상' AND ar.gubun = '모델'

    UNION ALL

    SELECT
        '70대 이상'                                                         AS 연령대,
        b.brand_name                                                        AS 브랜드,
        cm.model_name                                                       AS 모델,
        SUM(mr.monthly_reg_count)                                           AS 등록량
    FROM Car_Model cm
    JOIN Brand b               ON cm.brand_id  = b.brand_id
    JOIN Monthly_Registration mr ON cm.model_id = mr.model_id
    WHERE NOT EXISTS (
        SELECT 1 FROM Age_Registration ar2
        WHERE ar2.model_id = cm.model_id
          AND ar2.age_group = '70대 이상'
          AND ar2.gubun    = '모델'
    )
    GROUP BY b.brand_name, cm.model_name
) combined
ORDER BY 등록량 DESC
LIMIT 5;

-- =================================================================================
-- 전 연령대 통합 가장 많이 등록된 브랜드 TOP 5
-- =================================================================================
SELECT
    브랜드,
    SUM(등록량)                                                             AS 총등록량,
    ROW_NUMBER() OVER (ORDER BY SUM(등록량) DESC)                          AS 순위
FROM (
    SELECT
        b.brand_name                                                        AS 브랜드,
        ar.age_group,
        MAX(ar.age_reg_count)                                               AS 등록량
    FROM Age_Registration ar
    JOIN Brand b ON ar.brand_id = b.brand_id
    WHERE ar.gubun = '브랜드'
    GROUP BY b.brand_name, ar.age_group
) sub
GROUP BY 브랜드
ORDER BY 총등록량 DESC
LIMIT 5;

-- =================================================================================
-- 전 연령대 통합 가장 많이 등록된 차종 TOP 5
-- =================================================================================
SELECT
    b.brand_name                                                            AS 브랜드,
    cm.model_name                                                           AS 차종,
    SUM(ar.age_reg_count)                                                   AS 총등록량,
    ROW_NUMBER() OVER (ORDER BY SUM(ar.age_reg_count) DESC)                AS 순위
FROM Age_Registration ar
JOIN Car_Model cm ON ar.model_id = cm.model_id
JOIN Brand b     ON cm.brand_id  = b.brand_id
WHERE ar.gubun = '모델'
GROUP BY b.brand_name, cm.model_name
ORDER BY 총등록량 DESC
LIMIT 5;

