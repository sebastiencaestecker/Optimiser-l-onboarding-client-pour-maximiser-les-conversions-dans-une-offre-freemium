-- A. Description du parcours d'onboarding
-- En vous basant sur les 8 clients fournis dans l'échantillon de la table des abonnements, rédigez une brève description du parcours d'onboarding de chaque client.
-- Essayez de rester aussi concis que possible. Vous pouvez également effectuer un JOIN pour faciliter les explications.
WITH rank AS (
    SELECT
        s.customer_id,
        p.plan_name,
        s.start_date,
        RANK() OVER(PARTITION BY s.customer_id ORDER BY s.start_date) AS rank
    FROM plans p
    JOIN subscriptions s ON p.plan_id = s.plan_id
),
rank1 AS (
    SELECT * FROM rank WHERE rank = 1
),
rank2 AS (
    SELECT * FROM rank WHERE rank = 2
),
rank3 AS (
    SELECT * FROM rank WHERE rank = 3
),
rank4 AS (
    SELECT * FROM rank WHERE rank = 4
)
SELECT 
    r1.plan_name AS etape1,
    r2.plan_name AS etape2,
    r3.plan_name AS etape3,
    r4.plan_name AS etape4,
    COUNT(r1.customer_id) AS nb_customers
FROM rank1 r1
LEFT JOIN rank2 r2 ON r1.customer_id = r2.customer_id
LEFT JOIN rank3 r3 ON r2.customer_id = r3.customer_id
LEFT JOIN rank4 r4 ON r3.customer_id = r4.customer_id
GROUP BY r1.plan_name, r2.plan_name, r3.plan_name, r4.plan_name
ORDER BY nb_customers DESC




-- B. Questions d'analyse de données
-- 1. Combien de clients Foodie-Fi a-t-il eus au total ?

select count(distinct customer_id) from subscriptions

-- 2. Quelle est la distribution mensuelle des valeurs de start_date des plans d'essai dans notre dataset ? Utilisez le début du mois comme valeur de groupement.

SELECT
    MONTH(s.start_date) as MONTHs,
   count(*) as nb_sub_trial
from subscriptions s
join plans p on p.plan_id=s.plan_id
where p.plan_name ='trial'
group by MONTH(s.start_date)

-- 3. Quelles valeurs de start_date de plan apparaissent après l'année 2020 dans notre dataset ? Affichez la répartition par nombre d'événements pour chaque plan_name.

SELECT 
    p.plan_name,
    year(start_date) as annee,
    count(*) as nb_plan
from subscriptions s 
join plans p on p.plan_id=s.plan_id
Where year(s.start_date) >2020
group by p.plan_name,year(start_date)

-- 4. Quelle est le nombre de clients et le pourcentage de clients qui ont annulé leur abonnement, arrondi à une décimale ?

WITH nb_churn AS (
    SELECT COUNT(DISTINCT s.customer_id) AS nb_churns
    FROM subscriptions s 
    JOIN plans p ON s.plan_id = p.plan_id
    WHERE p.plan_name = 'churn'
),
total_clients AS (
    SELECT COUNT(DISTINCT customer_id) AS nb_clients
    FROM subscriptions
)
SELECT
    tc.nb_clients,
    cc.nb_churns,
    ROUND(cast(cc.nb_churns*100.0/tc.nb_clients as float),1) AS percent_cancelled
FROM total_clients tc
CROSS JOIN nb_churn cc




-- 5. Combien de clients ont annulé leur abonnement juste après leur essai gratuit initial ? Quel pourcentage cela représente-t-il, arrondi à l'entier le plus proche ?
WITH rank AS (
    SELECT
        s.customer_id,
        p.plan_name,
        s.start_date,
        RANK() OVER(PARTITION BY s.customer_id ORDER BY s.start_date) AS rank
    FROM plans p
    JOIN subscriptions s ON p.plan_id = s.plan_id
),
annulation as (
select 
    count(distinct customer_id) as nb_annule
from rank
where rank =2 AND plan_name='churn'
),

total_client as(
select 
    count(distinct customer_id) as nb_total_client
from rank)

SELECT
    a.nb_annule as churn,
    tc.nb_total_client,
    ROUND(((a.nb_annule * 100.0) / tc.nb_total_client), 2) AS percent_churn
from annulation a, total_client tc
group by a.nb_annule,tc.nb_total_client

-- autre facon de faire
SELECT
    COUNT(DISTINCT CASE WHEN rnk = 2 AND plan_name = 'churn' THEN customer_id END) AS nb_annule,
    COUNT(DISTINCT customer_id) AS nb_total_client,
    ROUND(
        COUNT(DISTINCT CASE WHEN rnk = 2 AND plan_name = 'churn' THEN customer_id END) * 100.0 /
        COUNT(DISTINCT customer_id), 1
    ) AS percent_churn
FROM (
    SELECT
        s.customer_id,
        p.plan_name,
        RANK() OVER (PARTITION BY s.customer_id ORDER BY s.start_date) AS rnk
    FROM subscriptions s
    JOIN plans p ON s.plan_id = p.plan_id
) AS sub;


-- 6. Quel est le nombre et le pourcentage de clients ayant souscrit à un plan après leur essai gratuit initial ?
with rank as(
    SELECT
        s.customer_id,
        p.plan_name,
        RANK() OVER (PARTITION BY s.customer_id ORDER BY s.start_date) AS rank
    FROM subscriptions s
    JOIN plans p ON s.plan_id = p.plan_id
)

Select 
    COUNT(DISTINCT case 
                    when rank =2 and plan_name='basic monthly' then customer_id     
                    when rank =2 and plan_name='pro monthly' then customer_id
                    when rank =2 and plan_name='pro annual' then customer_id 
                    END) as nb_abonne,
    COUNT(DISTINCT customer_id) AS nb_total_client,
    ROUND(
        COUNT(DISTINCT case 
                    when rank =2 and plan_name='basic monthly' then customer_id     
                    when rank =2 and plan_name='pro monthly' then customer_id
                    when rank =2 and plan_name='pro annual' then customer_id 
                    END) *100.0 /
        COUNT(DISTINCT customer_id)
        ,1
    )
from rank

-- 7. Quel est le nombre de clients et la répartition en pourcentage des cinq valeurs de plan_name à la date du 31 décembre 2020 ?
with date_plan as (
SELECT
        s.customer_id,
        p.plan_name,
        s.start_date as dates,
        ROW_NUMBER() OVER (PARTITION BY s.customer_id ORDER BY s.start_date DESC) AS rn
FROM subscriptions s
JOIN plans p ON s.plan_id = p.plan_id
where s.start_date<='2020-12-31'
)

select 
    count(distinct customer_id) as nb_client,
    COUNT(distinct case when plan_name='basic monthly' then customer_id end) as basic,
    COUNT(distinct case when plan_name='pro annual' then customer_id end) as pro_annuel,
    COUNT(distinct case when plan_name='pro monthly' then customer_id end)as pro_monthly,
    COUNT(distinct case when plan_name='trial' then customer_id end) as trial,
    ROUND(
            COUNT(distinct case when plan_name='basic monthly' then customer_id end) *100.0
            / count(distinct customer_id)
        ,1
    ) as percent_basic,
    ROUND(
            COUNT(distinct case when plan_name='pro annual' then customer_id end) *100.0
            / count(distinct customer_id)
        ,1
    ) as perceny_pro_annual,
    ROUND(
            COUNT(distinct case when plan_name='pro monthly' then customer_id end) *100.0
            / count(distinct customer_id)
        ,1
    ) as percent_pro_monthly,
    ROUND(
            COUNT(distinct case when plan_name='trial' then customer_id end) *100.0
            / count(distinct customer_id)
        ,1
    ) as percent_trial
    
from date_plan
where rn=1 and plan_name !='churn'



