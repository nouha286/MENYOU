import 'package:menyou/models/Categorie.dart';
import 'package:menyou/models/Classification.dart';

import 'package:menyou/models/Resteau.dart';

class Plat {
  int id;
  String nom;
  String ingredient;
  Classification classification;
  Resteau resteau;
  String image;
  Plat(this.id, this.nom, this.ingredient, this.image, this.classification, this.resteau);
}

// Plat plat = Plat(1, "nom", "ingredient", "image", Classification.Boisson);
