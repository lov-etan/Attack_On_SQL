SELECT DISTINCT d.id, d.email, d.first_name, d.last_name
FROM developers as d
JOIN (SELECT * FROM skillcodes WHERE category = 'Front End') as s
ON d.skill_code & s.code
ORDER BY 1

# distinct: JOIN 을 하게 되면 조건 때문에 vue 따로 React 따로 개발자 id가 나오게 된다. 