# Optimisation de l'onboarding et de la rétention client dans un modèle freemium SaaS – Cas Foodie-Fi - SQL

---

##  Objectif métier

**Secteur ciblé : SaaS / E-commerce**

**Problématique :**  
Comment améliorer la conversion des utilisateurs après l’essai gratuit et réduire le taux de désabonnement (churn), tout en optimisant le parcours client dans une offre freemium ?


##  Méthodologie

Dans un contexte concurrentiel fort, les plateformes en ligne proposant des essais gratuits peinent souvent à **transformer ces utilisateurs en abonnés payants**.  

Foodie-Fi, entreprise fictive de streaming culinaire, constate un **taux de churn précoce préoccupant**. L’objectif est d’analyser les comportements d’abonnement pour :
- Mieux comprendre les **parcours d’usage**.
- Identifier les **leviers de rétention**.
- Structurer une stratégie de **fidélisation et de monétisation durable**.


##  But du projet

- Reconstituer les **parcours d’abonnement complets** de chaque client.
- Identifier les **comportements menant au churn** (ex : churn post-trial).
- Évaluer la **performance des différents plans tarifaires**.


##  Processus d’analyse

-  Nettoyage et modélisation des données en SQL (plans, dates, clients).
- Classement des séquences clients à l’aide de fonctions analytiques SQL (`RANK`, `ROW_NUMBER`).
- Création de KPIs : taux de conversion, churn, délai de souscription…
- Segmentation des clients par **stade d’engagement** pour des actions marketing ciblées.
- Mise en avant de plans à forte rétention (plan annuel pro) pour un **business model plus durable**.


## Résultats obtenus

- **19,4 %** des utilisateurs annulent après l’essai gratuit, sans tester de plan payant.
- Les clients qui souscrivent un **plan annuel** sont les plus fidèles.
- Le churn est particulièrement élevé chez les utilisateurs inactifs durant leur essai.
- Recommandations clés :
  - Proposer une **offre promotionnelle** à la fin de l’essai.
  - Envoyer un **email de réassurance ciblé** avant la fin de la période d’essai..
  - Détecter les signaux faibles d’un churn anticipé (peu d’interactions, essai trop court, etc.).


## Intentions d’apprentissage

Ce projet m’a permis de :

- Approfondir la **modélisation temporelle** de parcours utilisateurs.
- Travailler les fonctions analytiques SQL (`RANK`, `ROW_NUMBER`) pour créer des **séquences comportementales**.
- Simuler des paiements en intégrant une **logique métier réaliste**.
- Penser l'analyse sous l’angle de la **valeur client** et de la **durabilité du modèle économique**.
- **Comprendre un business model SaaS**, ses enjeux de conversion et de rétention.

## Exemple de requete

 Reconstituer le parcours d’abonnement des clients, étape par étape, pour identifier les combinaisons les plus fréquentes 
 ``` sql
WITH rank AS (
    SELECT
        s.customer_id,
        p.plan_name,
        s.start_date,
        RANK() OVER(PARTITION BY s.customer_id ORDER BY s.start_date) AS rank
    FROM plans p
    JOIN subscriptions s ON p.plan_id = s.plan_id
),
rank1 AS (SELECT * FROM rank WHERE rank = 1),
rank2 AS (SELECT * FROM rank WHERE rank = 2),
rank3 AS (SELECT * FROM rank WHERE rank = 3),
rank4 AS (SELECT * FROM rank WHERE rank = 4)

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
ORDER BY nb_customers DESC;
```
 Cette requête calcule le nombre d’abonnements au plan "trial" par mois, en utilisant MONTH() pour extraire le mois de la date de début.
  ``` sql
SELECT
    MONTH(s.start_date) AS months,
    COUNT(*) AS nb_sub_trial
FROM subscriptions s
JOIN plans p ON p.plan_id = s.plan_id
WHERE p.plan_name = 'trial'
GROUP BY MONTH(s.start_date);

 ```
 Pourcentage de clients ayant annulé
  ``` sql
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
    ROUND(CAST(cc.nb_churns * 100.0 / tc.nb_clients AS FLOAT), 1) AS percent_cancelled
FROM total_clients tc
CROSS JOIN nb_churn cc;
```
