class Categorie {
  int id;
  String nom;
  String image;

  Categorie(this.id, this.nom, this.image);
}

List<Categorie> categories = [
  Categorie(1, "pizzirea", "image"),
  Categorie(2, "plats traditionnel", "images/OIP.jpg"),
  Categorie(3, "plats asiatiques", "image")
];
