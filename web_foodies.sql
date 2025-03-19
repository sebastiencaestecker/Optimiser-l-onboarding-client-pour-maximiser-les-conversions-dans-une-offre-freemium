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
-- 2. Quelle est la distribution mensuelle des valeurs de start_date des plans d'essai dans notre dataset ? Utilisez le début du mois comme valeur de groupement.
-- 3. Quelles valeurs de start_date de plan apparaissent après l'année 2020 dans notre dataset ? Affichez la répartition par nombre d'événements pour chaque plan_name.
-- 4. Quelle est le nombre de clients et le pourcentage de clients qui ont annulé leur abonnement, arrondi à une décimale ?
-- 5. Combien de clients ont annulé leur abonnement juste après leur essai gratuit initial ? Quel pourcentage cela représente-t-il, arrondi à l'entier le plus proche ?
-- 6. Quel est le nombre et le pourcentage de clients ayant souscrit à un plan après leur essai gratuit initial ?
-- 7. Quel est le nombre de clients et la répartition en pourcentage des cinq valeurs de plan_name à la date du 31 décembre 2020 ?
-- 8. Combien de clients sont passés à un plan annuel en 2020 ?
-- 9. Combien de jours en moyenne faut-il à un client pour passer à un plan annuel depuis le jour où il rejoint Foodie-Fi ?
-- 10. Pouvez-vous décomposer cette valeur moyenne en périodes de 30 jours (par exemple : 0-30 jours, 31-60 jours, etc.) ?
-- 11. Combien de clients ont rétrogradé d'un plan pro mensuel à un plan de base mensuel en 2020 ?

-- C. Question sur les paiements
-- L'équipe de Foodie-Fi souhaite que vous créiez une nouvelle table des paiements pour l'année 2020, incluant les montants payés par chaque client dans la table des abonnements avec les exigences suivantes :
-- - Les paiements mensuels ont lieu toujours à la même date du mois que la date de début de tout plan mensuel payé.
-- - Les mises à niveau d'un plan de base vers un plan mensuel ou pro sont ajustées par le montant déjà payé ce mois-là et commencent immédiatement.
-- - Les mises à niveau d'un plan pro mensuel vers un plan pro annuel sont payées à la fin de la période de facturation actuelle et commencent à la fin du mois.
-- - Une fois qu'un client annule son abonnement, il ne fera plus de paiements.
-- Exemple de sortie pour cette table :
-- customer_id | plan_id | plan_name | payment_date | amount | payment_order

-- D. Questions ouvertes
-- Les questions suivantes sont ouvertes et pourraient être posées lors d’un entretien technique pour cette étude de cas. Il n'y a pas de bonnes ou mauvaises réponses, mais des réponses qui font sens tant d'un point de vue technique que commercial laisseront une impression positive !
-- 1. Comment calculeriez-vous le taux de croissance de Foodie-Fi ?
-- 2. Quels sont les indicateurs clés que vous recommanderiez à la direction de Foodie-Fi pour suivre la performance de leur entreprise au fil du temps ?
-- 3. Quels sont les principaux parcours ou expériences clients que vous analyseriez davantage pour améliorer la fidélisation des clients ?
-- 4. Si l’équipe de Foodie-Fi devait créer un sondage de sortie pour les clients qui souhaitent annuler leur abonnement, quelles questions incluriez-vous dans ce sondage ?
-- 5. Quels leviers commerciaux l’équipe de Foodie-Fi pourrait-elle utiliser pour réduire le taux de désabonnement ? Comment valideriez-vous l'efficacité de vos idées ?

-- Conclusion
-- Cette étude de cas devrait refléter des questions réalistes que nous abordons habituellement dans toutes les demandes d’analyse produit dans une grande variété d'industries, surtout dans le domaine numérique !
