import 'package:shared_preferences/shared_preferences.dart';

class ArticleDTO {
  int id;
  int quantite;
  int plat_id;
  double prix;


  ArticleDTO(
      this.id,
      this.plat_id,
      this.quantite,
      this.prix,
    );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'quantite': quantite,
      'plat_id': plat_id,
      'prix': prix,
      
    };
  }

  factory ArticleDTO.fromJson(Map<String, dynamic> json) {
    return ArticleDTO(
      json['id'] as int,
      json['plat_id'] as int,
      json['quantite'] as int,
      json['prix'] as double
     
    );
  }
}
