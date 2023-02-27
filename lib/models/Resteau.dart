import 'package:menyou/models/Categorie.dart';

class Resteau {
  int id;
  String adresse;
  String ville;
  String nom;
  String description;
  Categorie categorie;
  String image;

  Resteau(this.id, this.adresse, this.description, this.nom, this.ville,
      this.categorie, this.image);
}

List<Resteau> resteaux = [
  Resteau(1, "test", "test", "sushia", "test", Categorie(1, "nom", "image"),'images/sushia.jpg'),
  Resteau(2, "test", "test", "ferkous", "test", Categorie(1, "nom", "image"),'images/maroc.jpg'),
  Resteau(3, "test", "test", "Macdo", "test", Categorie(1, "nom", "image"),'images/mcdo.jpg'),
];
