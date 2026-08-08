-- Write your query below
WITH rankedscores AS (
SELECT
    student_id,
    exam_id,
    score,
    DENSE_RANK() OVER (PARTITION BY student_id ORDER BY score DESC, exam_id ASC ) AS score_rank
FROM exam_results   
GROUP BY 
    student_id,
    exam_id
)

SELECT 
    student_id,
    exam_id,
    score
FROM rankedscores
WHERE score_rank = 1    