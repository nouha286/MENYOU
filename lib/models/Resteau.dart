import 'package:menyou/models/Categorie.dart';

class Resteau {
  int id;
  String adresse;
  String ville;
  String nom;
  String description;
  Categorie categorie;

  Resteau( this.id, this. adresse, this. description, this. nom, this. ville,
      this. categorie);
}

List<Resteau> resteaux = [
  Resteau(1, "test", "test", "test", "test", Categorie(1, "nom", "image")),
  Resteau(2, "test", "test", "test", "test", Categorie(1, "nom", "image")),
  Resteau(3, "test", "test", "test", "test", Categorie(1, "nom", "image")),
];
