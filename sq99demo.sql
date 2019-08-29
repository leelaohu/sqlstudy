#查询编号>3的女神的男朋友信息，如果有列出详细，没有用null填充
SELECT 
  b.name gn,b.`id` gd,bo.* 
FROM
  beauty b 
  LEFT OUTER JOIN boys bo 
  ON b.`boyfriend_id` = bo.id 
  WHERE b.id>3;
#查询哪个城市没有部门
SELECT 
  city 
FROM
  departments d 
  RIGHT OUTER JOIN locations l 
    ON d.location_id = l.location_id 
WHERE d.department_id IS NULL ;

#查询部门名为sal或IT的员工信息
SELECT 
  e.* 
FROM
   departments d 
  LEFT OUTER JOIN employees e
    ON e.`department_id` = d.`department_id` 
WHERE department_name IN ('SAL', 'IT')