// import 'dart:js';

// import 'package:flutter/material.dart';
// import 'package:menyou/database/SqlDb.dart';
// import 'package:menyou/models/ArticleDeCommande.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class Commande {
//   int id = 1;
//   double prixTotal = 0.00;
//   DateTime dateCreation = DateTime.now();
//   List<ArticleDeCommande> articles = [];
//   String etat = 'No';

//   Commande(
//       this.id, this.prixTotal, this.dateCreation, this.articles, this.etat);

//   void addArticle(ArticleDeCommande articleDeCommande) {
//     this.articles.add(articleDeCommande);
//     this.prixTotal += articleDeCommande.prix++;
//   }

//   void ajouterAuPanier(int quantite, int id_plat, double prix) {
    
//       ArticleDeCommande article =
//           ArticleDeCommande(1, commandeActuelle.id, id_plat, quantite, prix);
//       commandeActuelle.articles.add(article);
     
    
//     }
  

//   Commande commandeActuelle = Commande(1, 0.0, DateTime.now(), [], 'No');

//   void CreateCommade(int idArticle, int quantite, double price) {
//     commandeActuelle.addArticle(
//         ArticleDeCommande(1, commandeActuelle.id, idArticle, quantite, price));
//   }

//   // void ValiderLaCommande(Commande commande) {
//   //   articles.forEach((element) {
//   //     commande.prixTotal += element.prix;
//   //   });
//   //   commande.etat = 'yes';
//   //   commande.dateCreation = DateTime.now();
//   //   SqlDb sqlDb = SqlDb();
//   //   sqlDb.insert(commande);
//   // }

//   Map<String, dynamic> toMap() {
//     return {
//       'prixTotal': prixTotal,
//       'dateCreation': dateCreation,
//     };
//   }


//   Future<void> addToCart(ArticleDeCommande article) async {
//   // Récupération de la liste des articles déjà enregistrés dans le panier
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   final List<String>? articlesStringList = prefs.getStringList('cart');
//   List<ArticleDeCommande> articles = [];
  
//   // Conversion de chaque article en objet ArticleDeCommande
//   if (articlesStringList != null) {
//     articles = articlesStringList
//         .map((articleString) => ArticleDeCommande.fromJson(articleString as Map<String, dynamic>))
//         .toList();
//   }
  
//   // Ajout du nouvel article à la liste
//   articles.add(article);
  
//   // Enregistrement de la nouvelle liste des articles dans le panier
//   final List<String> newArticlesStringList =
//       articles.map((article) => article.toMap()).cast<String>().toList();
//   await prefs.setStringList('cart', newArticlesStringList);
// }

// }
