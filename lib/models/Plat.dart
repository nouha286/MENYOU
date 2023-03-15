import 'package:menyou/models/Categorie.dart';
import 'package:menyou/models/Classification.dart';

import 'package:menyou/models/Resteau.dart';

class Plat {
  int id;
  String nom;
  String ingredient;
  String classification;
  int resteau_id;
  String image;
  double prix;
  Plat(this.id, this.nom, this.ingredient, this.image, this.classification,
      this.resteau_id, this.prix);

  factory Plat.fromJson(Map<String, dynamic> json) {
    return Plat(json['id'], json['nom'], json['ingredient'], json['image'],
        json['classification'], json['resteau_id'], json['prix']);
  }
}

// Plat plat = Plat(1, "nom", "ingredient", "image", Classification.Boisson);
