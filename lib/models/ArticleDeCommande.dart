// class ArticleDeCommande {
//   int id;
//   int quantite;
//   int plat_id;
//   int commande_id;
//   double prix;
//   ArticleDeCommande(this.id, this.commande_id, this.plat_id, this.quantite, this.prix);

//   Map<String, dynamic> toMap() {
//     return {
//       'quantite': quantite,
//       'plat_id': plat_id,
//       'commande_id': commande_id
//     };
//   }

//   factory ArticleDeCommande.fromJson(Map<String, dynamic> json) {
//     return ArticleDeCommande(json['id'], json['quantite'], json['plat_id'],
//         json['commande_id'], json['prix']);
//   }
// }
