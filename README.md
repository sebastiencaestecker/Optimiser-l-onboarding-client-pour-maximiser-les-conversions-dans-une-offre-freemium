# Analyse des Abonnements Foodie-Fi

## 📖 Description du Projet
Ce projet explore les données d'abonnement du service **Foodie-Fi** en analysant les parcours d'onboarding des clients, la distribution des abonnements et les tendances d'annulation. 📊📈

## 📂 Contenu du Projet
Le projet est structuré autour de plusieurs requêtes **SQL** permettant d'extraire des insights sur les abonnements et les comportements des utilisateurs. 🔍

### 🚀 A. Description du parcours d'onboarding
Un ensemble de requêtes SQL permet de reconstituer le **parcours d'onboarding** de chaque client en classant leurs abonnements par ordre chronologique et en regroupant les différentes étapes sous forme de tableau. 📅

### 🧐 B. Questions d'analyse de données
Ce projet répond à plusieurs questions clés :

1. **📌 Nombre total de clients**
   - 🔢 Requête SQL pour compter le nombre total d'abonnés uniques.

2. **📊 Distribution mensuelle des essais gratuits**
   - 📆 Requête SQL pour afficher la répartition mensuelle des abonnements d'essai.

3. **📅 Répartition des abonnements après 2020**
   - 🔎 Requête SQL pour identifier les abonnements souscrits après l'année 2020 et leur répartition par type.

4. **🚨 Taux d'annulation des abonnements**
   - ❌ Requête SQL pour calculer le nombre et le pourcentage de clients ayant annulé leur abonnement.

5. **📉 Annulations après l'essai gratuit**
   - ❗ Requête SQL pour identifier les clients ayant annulé immédiatement après leur essai gratuit.

6. **📈 Souscriptions après l'essai gratuit**
   - ✅ Requête SQL pour calculer le nombre et le pourcentage de clients ayant souscrit à un abonnement après leur période d'essai.

7. **📆 Répartition des abonnements au 31 décembre 2020**
   - 📜 Requête SQL pour afficher la répartition des clients selon leur dernier abonnement à cette date.

## 🛠️ Technologies Utilisées
- **SQL server** : Langage principal utilisé pour interroger la base de données. 🗄️

## ▶️ Exécution des Requêtes
Les requêtes SQL peuvent être exécutées sur n'importe quelle base de données contenant les tables suivantes :
- **`subscriptions`** : Contient les abonnements des clients avec `customer_id`, `plan_id` et `start_date`. 📜
- **`plans`** : Contient les différents types d'abonnements avec `plan_id` et `plan_name`. 📑



