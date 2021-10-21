// To parse this JSON data, do
//
//     final cat = catFromJson(jsonString);

import 'dart:convert';

List<Cat> catFromJson(String str) => List<Cat>.from(json.decode(str).map((x) => Cat.fromJson(x)));

String catToJson(List<Cat> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Cat {
  Cat({
    required this.id,
    required this.url,
    required this.width,
    required this.height,
  });


  String id;
  String url;
  int width;
  int height;

  factory Cat.fromJson(Map<String, dynamic> json) => Cat(
    id: json["id"],
    url: json["url"],
    width: json["width"],
    height: json["height"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "url": url,
    "width": width,
    "height": height,
  };
}



class Weight {
  Weight({
    required this.imperial,
    required this.metric,
  });

  String imperial;
  String metric;

  factory Weight.fromJson(Map<String, dynamic> json) => Weight(
    imperial: json["imperial"],
    metric: json["metric"],
  );

  Map<String, dynamic> toJson() => {
    "imperial": imperial,
    "metric": metric,
  };
}
