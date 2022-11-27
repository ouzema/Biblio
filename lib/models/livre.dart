class Livre {
  int? id;
  String? libelle;
  String? description;
  int? nbPage;
  String? image;
  int? categorieId;
  int? auteurId;

  Livre(
      {this.id,
      this.libelle,
      this.description,
      this.nbPage,
      this.image,
      this.auteurId,
      this.categorieId});

  Livre.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    libelle = json["libelle"];
    description = json["description"];
    nbPage = json["nbPage"];
    image = json["image"];
    categorieId = json["categorieId"];
    auteurId = json["auteurId"];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {};
    libelle = map["libelle"];
    description = map["description"];
    nbPage = map["nbPage"];
    image = map["image"];
    categorieId = map["categorieId"];
    auteurId = map["auteurId"];
    return map;
  }
}
