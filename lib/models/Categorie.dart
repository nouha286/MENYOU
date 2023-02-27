class Categorie {
  int id;
  String nom;
  String image;

  Categorie(this.id, this.nom, this.image);
}

List<Categorie> categories = [
  Categorie(1, "pizzirea", "images/pizza.png"),
  Categorie(2, "plats traditionnel", "images/trad.png"),
  Categorie(3, "plats asiatiques", "images/assiatic.png")
];
