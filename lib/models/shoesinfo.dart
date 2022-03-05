// To parse this JSON data, do
//
//     final Shoes = ShoesFromJson(jsonString);

import 'dart:convert';

List<Shoes> ShoesFromJson(String str) =>
    List<Shoes>.from(json.decode(str).map((x) => Shoes.fromJson(x)));

String ShoesToJson(List<Shoes> data) =>
    json.encode(List<List<Shoes>>.from(data.map((x) => x.toJson())));

class Shoes {
  Shoes({
    required this.productname,
    required this.price,
    required this.imageUrl,
    required this.id,
  });

  String productname;
  double price;
  String imageUrl;
  String id;

  factory Shoes.fromJson(Map<String, dynamic> json) => Shoes(
        productname: json["productname"] ,
        price: json["price"].toDouble(),
        imageUrl: json["imageURL"] ,
        id: json["id"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "productname": productname,
        "price": price,
        "imageURL": imageUrl,
        "id": id,
      };
}
