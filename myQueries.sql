WITH RankedRows AS (
    SELECT
        code,
        name,
        headDivisionCode,
        entityObj,
        createdAt,
        ROW_NUMBER() OVER (PARTITION BY code, headDivisionCode ORDER BY createdAt DESC) AS rn
    FROM divisionMaster
)
SELECT code,name, headDivisionCode, entityObj, createdAt
FROM RankedRows
WHERE rn = 1 and createdAt BETWEEN '2023-09-05' and '2023-09-11'

-- ranked rows is used to rank wach row in a group each the above query is used to fetch first row in each rows