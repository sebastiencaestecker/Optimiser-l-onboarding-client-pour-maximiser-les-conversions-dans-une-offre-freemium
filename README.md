# Optimisation de l'onboarding et de la rétention client dans un modèle freemium SaaS – Cas Foodie-Fi

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


