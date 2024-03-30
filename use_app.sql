use app;

-- eventos por tipo
select event_type, count(*) as total_events
from events
group by event_type;

-- usuarios registrados por ano
select year(registration_date) as year, count(*) as user_count
from users
group by year; 

-- campanhas por preco
select campaign_name, budget
from campaigns
order by budget desc;

-- atividades por usuario
SELECT u.username, COUNT(a.activity_id) AS activities_count
FROM Users u
JOIN User_Activities a ON u.user_id = a.user_id
GROUP BY u.username
ORDER BY activities_count DESC;

-- campanhas ativas dentro de um periodo
select campaign_name, start_date, end_date
from campaigns
where year(start_date)=2023;

-- gasto total com campanhas por ano
select year(start_date) as year, sum(budget) as total_spent
from campaigns
group by year;

-- usuarios com mais de um dispositivo 
select user_id, count(distinct device_type) as device_types_count
from devices
group by user_id
having count(distinct device_type) > 1;

-- usuarios e seus eventos
select e.user_id, u.username, e.event_type, e.event_timestamp
from events e
join users u on e.user_id = u.user_id;

-- Numero total de eventos por tipo
select event_type, count(*) as total_events
from events
group by event_type;

-- Visao geral de eventos por pagina
select p.page_name, count(e.event_id) as event_count
from events e 
join pages p on e.page_id = p.page_id
group by p.page_name; 

-- dispositivos mais usados
select device_type, count(*) as total_usage
from devices
group by device_type
order by total_usage desc;

-- evolucao do numero de atividades ao longo do tempo
select date_format(activity_timestamp, 'y%-m%') as month, count(*) as activity_county
from user_activities
group by 1
order by 1;

-- usuarios por genero com a soma de orcamento das campanhas
SELECT ud.gender, round(sum(c.budget), 2) as total_budget
from user_details ud
join users u on ud.user_id = u.user_id
join campaign_events ce on u.user_id = ce.campaign_id
join campaigns c on ce.campaign_id = c.campaign_id
group by ud.gender;

-- top 5 paginas mais visualizadas
select p.page_name, count(e.event_id) as views
from events e
join pages p on e.page_id = p.page_id
where e.event_type = 'view'
group by p.page_name
order by views desc
limit 5;

-- usuarios e seus dispositivos
select u.username, d.device_type, d.os
from users u
join devices d on u.user_id = d.user_id;

-- usuarios ativos por faixa etaria



