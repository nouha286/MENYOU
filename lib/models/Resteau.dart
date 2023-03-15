import 'package:menyou/models/Categorie.dart';

class Resteau {
  int id;
  String adresse;
  String ville;
  String nom;
  String description;
  int categorie_id;
  String image;

  Resteau(this.id, this.adresse, this.description, this.nom, this.ville,
      this.categorie_id, this.image);

  factory Resteau.fromJson(Map<String, dynamic> json) {
    return Resteau(json['id'], json['adresse'], json['description'],
        json['nom'], json['ville'], json['category_id'], json['image']);
  }
}
