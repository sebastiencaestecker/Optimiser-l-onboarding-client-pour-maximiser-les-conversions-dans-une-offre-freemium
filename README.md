# 📌 Analyse des Abonnements Foodie-Fi

## 📖 Description du Projet
Ce projet explore les données d'abonnement du service **Foodie-Fi** en analysant les parcours d'onboarding des clients, la distribution des abonnements et les tendances d'annulation. 📊📈

## 📂 Contenu du Projet
Le projet est structuré autour de plusieurs requêtes **SQL** permettant d'extraire des insights sur les abonnements et les comportements des utilisateurs. 🔍

### 🚀 A. Description du parcours d'onboarding
Un ensemble de requêtes SQL permet de reconstituer le **parcours d'onboarding** de chaque client en classant leurs abonnements par ordre chronologique et en regroupant les différentes étapes sous forme de tableau. 📅

### 🧐 B. Questions d'analyse de données
Ce projet répond à plusieurs questions clés :

1. **📌 Nombre total de clients**
   - 🔢 Requête SQL simple utilisant `COUNT(DISTINCT customer_id)` pour obtenir le nombre total d'abonnés uniques.

2. **📊 Distribution mensuelle des essais gratuits**
   - 📆 Utilisation de la fonction `MONTH()` pour regrouper les abonnements d'essai par mois et compter les occurrences.

3. **📅 Répartition des abonnements après 2020**
   - 🔎 Requête utilisant `YEAR(start_date) > 2020` et `GROUP BY` pour identifier les abonnements souscrits après 2020.

4. **🚨 Taux d'annulation des abonnements**
   - ❌ Utilisation de **CTE (Common Table Expressions)** pour calculer le nombre total de clients et le nombre d'annulations, puis calcul du pourcentage avec `ROUND()`.

5. **📉 Annulations après l'essai gratuit**
   - ❗ Utilisation de `RANK() OVER (PARTITION BY customer_id ORDER BY start_date)` pour déterminer les clients ayant annulé après un essai gratuit, avec une **jointure sur les plans**.

6. **📈 Souscriptions après l'essai gratuit**
   - ✅ Approche similaire à la précédente, en filtrant sur les abonnements actifs après un essai gratuit.

7. **📆 Répartition des abonnements au 31 décembre 2020**
   - 📜 Utilisation de `ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY start_date DESC)` pour identifier l'abonnement actif à la date de référence et afficher sa distribution.

## ⚙️ Complexité des Requêtes SQL
Les requêtes SQL utilisées varient en complexité :
- **Simples** : Requêtes avec `COUNT()`, `GROUP BY`, et `WHERE`.
- **Moyennement complexes** : Utilisation de `JOIN` pour combiner plusieurs tables et obtenir des informations plus riches.
- **Complexes** : Requêtes avec **CTE**, **fenêtrage (`RANK()` et `ROW_NUMBER()`)**, et **sous-requêtes** pour analyser les parcours clients de manière détaillée.


## ▶️ Exécution des Requêtes
Les requêtes SQL peuvent être exécutées sur n'importe quelle base de données contenant les tables suivantes :
- **`subscriptions`** : Contient les abonnements des clients avec `customer_id`, `plan_id` et `start_date`. 📜
- **`plans`** : Contient les différents types d'abonnements avec `plan_id` et `plan_name`. 📑



