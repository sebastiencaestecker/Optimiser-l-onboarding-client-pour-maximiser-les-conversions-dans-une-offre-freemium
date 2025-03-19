# 🍽️ Foodie-Fi SQL Analysis

## 📌 Présentation du projet  
Analyse les données de **Foodie-Fi**, un service de streaming culinaire par abonnement. L'objectif est d'examiner le parcours d'onboarding des clients, l'évolution des abonnements, l'impact des annulations et l'analyse des paiements en utilisant **SQL**.

---

## 📊 Catégories d’analyse

### 📍 A. Description du parcours d'onboarding  
L’objectif est d’analyser les étapes par lesquelles passent les clients lors de leur inscription :  
- 🔹 **Classement des abonnements pour chaque client** avec **RANK()**  
- 🔹 **Détermination des principales étapes du parcours**  
- 🔹 **Nombre de clients ayant suivi un parcours spécifique**  

📌 *Permet d'identifier les tendances d'inscription et d'améliorer l'expérience utilisateur.*

---

### 📈 B. Analyse des données clients  
Cette section explore les tendances des abonnements et les comportements des clients :  
1️⃣ **Nombre total de clients**  
2️⃣ **Distribution mensuelle des abonnements d’essai**  
3️⃣ **Nombre d’abonnements commencés après 2020**  
4️⃣ **Taux d’annulation des abonnements**  
5️⃣ **Annulations après l’essai gratuit**  
6️⃣ **Taux de conversion après essai gratuit**  
7️⃣ **Répartition des plans au 31 décembre 2020**  
8️⃣ **Nombre de clients ayant choisi un plan annuel**  
9️⃣ **Délai moyen avant passage à un plan annuel**  
🔟 **Décomposition de ce délai en périodes de 30 jours**  
1️⃣1️⃣ **Nombre de rétrogradations d’un plan Pro à un plan Basique**  

📌 *Ces analyses permettent d’évaluer le succès du modèle d’abonnement et d’identifier les opportunités d’amélioration.*

---

### 💳 C. Analyse des paiements  
L’objectif est de **simuler une table des paiements** pour 2020 en respectant les règles de facturation :  
- 📆 **Paiements mensuels à la même date que l’inscription**  
- 🔄 **Ajustement en cas de mise à niveau d’un plan**  
- 🏁 **Fin de facturation après annulation de l’abonnement**  

📌 *Permet d’avoir une vision claire des revenus et d’optimiser la gestion des abonnements.*

---

### 💡 D. Questions ouvertes  
Cette section explore des axes d’analyse plus stratégiques :  
🔹 **Taux de croissance de Foodie-Fi**  
🔹 **Indicateurs clés pour mesurer la performance**  
🔹 **Expériences client à analyser pour améliorer la fidélisation**  
🔹 **Questions à inclure dans un sondage de sortie**  
🔹 **Stratégies pour réduire le churn (taux de désabonnement)**  

📌 *Ces réflexions permettent d’aborder l’analyse sous un angle business et stratégique.*

---

## 🛠️ Technologies et outils utilisés  
- **SQL (SQL Server)** : Requêtes analytiques et transformations de données  

## 🎯 Améliorations possibles  
- 🔹 **Prédiction du churn** avec des modèles de Machine Learning  
- 🔹 **Segmentation des clients** en fonction de leur parcours d’abonnement  
- 🔹 **Optimisation des prix et promotions** pour maximiser la conversion  
- 🔹 **Visualisation dynamique des abonnements et des paiements**  

---

examiner le parcours d'onboarding des clients, l'évolution des abonnements, l'impact des annulations et l'analyse des paiements en utilisant SQL
