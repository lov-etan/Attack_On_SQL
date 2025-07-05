# 리뷰를 가장 많이 작성한 회원 1명 \ 그의 리뷰들 
-- 버전1
SELECT p.member_name, r.review_text, DATE_FORMAT(r.review_date, "%Y-%m-%d") as review_date
FROM member_profile as p 
JOIN rest_review as r 
    ON p.member_id = r.member_id
JOIN (SELECT member_id FROM rest_review 
      GROUP BY member_id 
      ORDER BY COUNT(*) DESC LIMIT 1) as max_r
     ON r.member_id = max_r.member_id
ORDER BY r.review_date, r.review_text

-- 원래 WHERE 절에 IN (댓글 수 LIMIT 1) 하려고 했는데 IN 안의 서브쿼리에 LIMIT 1 안된다고 함
-- 버전2
SELECT p.member_name, r.review_text, DATE_FORMAT(r.review_date, "%Y-%m-%d") as review_date
FROM member_profile as p 
JOIN rest_review as r 
    ON p.member_id = r.member_id
WHERE r.member_id = (SELECT member_id FROM rest_review 
                      GROUP BY member_id 
                      ORDER BY COUNT(*) DESC LIMIT 1)
ORDER BY r.review_date, r.review_text