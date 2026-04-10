select * from children_in_need

select * from children_in_need
where time_period = 2025

select * from [dbo].[children_in_need]
where time_period = 2013

select * from [dbo].[children_in_need]
where [anypoint_episodes] = 'x'





--Somerset appear under two codes across years
SELECT
    time_period,
    old_la_code,
    new_la_code,
    anypoint_child_num,
    started_child_num,
    ended_child_num,
    at31_episodes_num,
    awaiting_assessment_num,
	geographic_level,
	la_name
FROM [dbo].[children_in_need]
WHERE geographic_level = 'Local authority'
  AND la_name = 'Somerset'
ORDER BY time_period ASC;

--Children with an episode of need at any point in the year
select time_period,
sum(anypoint_child_num) as Anypoint_child 
from [dbo].[children_in_need]
group by time_period
Order by sum(anypoint_child_num) Desc

select region_name,
sum(anypoint_child_num) as Anypoint_child 
from [dbo].[children_in_need]
group by region_name
Order by sum(anypoint_child_num) Desc

select Top 10 la_name,
sum(anypoint_child_num) as Anypoint_child 
from [dbo].[children_in_need]
WHERE la_name IS NOT NULL
  AND la_name <> 'Not applicable'
GROUP BY la_name
ORDER BY SUM(anypoint_child_num) DESC;

--Annual Started_child
select time_period,
sum(started_child_num) as started_child
from [dbo].[children_in_need]
group by time_period
Order by sum(started_child_num) Desc

select region_name,
sum(started_child_num) as started_child
from [dbo].[children_in_need]
group by region_name
Order by sum(started_child_num) Desc

select top 10 la_name,
sum(started_child_num) as started_child
from [dbo].[children_in_need]
WHERE la_name IS Not  NULL
  AND la_name <> 'Not applicable'
GROUP BY la_name
Order by sum(started_child_num) Desc


--Annual Ended_child
select time_period,
sum(ended_child_num) as Ended_Child 
from [dbo].[children_in_need]
group by time_period
Order by sum(ended_child_num) Desc

select region_name,
sum(ended_child_num) as Ended_Child 
from [dbo].[children_in_need]
group by region_name
Order by sum(ended_child_num) Desc

select la_name,
sum(ended_child_num) as Ended_Child 
from [dbo].[children_in_need]
group by la_name
Order by sum(ended_child_num) Desc

--Children in need at 31 March
select time_period,
sum(at31_episodes_num) as Ended_Child 
from [dbo].[children_in_need]
group by time_period 
Order by time_period Desc

--Children awaiting assessment
select time_period,
sum(awaiting_assessment_num) as Ended_Child 
from [dbo].[children_in_need]
group by time_period 
Order by time_period ASC

--Comparison btw Anypoint_episodes and Anypoint_child
select time_period,
sum(anypoint_child_num) as Anypoint_Child,
sum(anypoint_episodes_num) as Anypoint_Episodes 
from [dbo].[children_in_need]
group by time_period 
Order by time_period ASC

select region_name, 
sum(anypoint_child_num) as Anypoint_Child,
sum(anypoint_episodes_num) as Anypoint_Episodes 
from [dbo].[children_in_need]
group by region_name 
Order by region_name ASC

select la_name, 
sum(anypoint_child_num) as Anypoint_Child,
sum(anypoint_episodes_num) as Anypoint_Episodes 
from [dbo].[children_in_need]
group by la_name 
Order by la_name ASC

select distinct(region_name)  from [dbo].[children_in_need]


SELECT TOP 10
    la_name,
    SUM(anypoint_child_num)    AS Anypoint_Child,
    SUM(anypoint_episodes_num) AS Anypoint_Episodes
FROM dbo.children_in_need
WHERE la_name IS NOT NULL
  AND la_name <> 'Not applicable'
GROUP BY la_name
ORDER BY SUM(anypoint_child_num) DESC;


SELECT
    time_period,
    CAST(
        SUM(ended_child_num) * 1.0 /
        NULLIF(SUM(started_child_num), 0)
        AS decimal(10,4)
    ) AS ended_to_started_ratio
FROM dbo.children_in_need
GROUP BY time_period
ORDER BY time_period ASC;

select 
sum(awaiting_assessment_num) as Ended_Child 
from [dbo].[children_in_need]
where time_period = 2013

select 
sum(anypoint_episodes_num) as Ended_Child 
from [dbo].[children_in_need]
where time_period = 2013