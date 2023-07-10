class AnimalModel {
  Data? data;

  AnimalModel({this.data});

  AnimalModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Animal>? animal;

  Data({this.animal});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['animal'] != null) {
      animal = <Animal>[];
      json['animal'].forEach((v) {
        animal!.add(new Animal.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.animal != null) {
      data['animal'] = this.animal!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Animal {
  int? id;
  String? name;
  String? description;
  String? quantidade;

  Animal({this.id, this.name, this.description, this.quantidade});

  Animal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    quantidade = json['quantidade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['quantidade'] = this.quantidade;
    return data;
  }
}
