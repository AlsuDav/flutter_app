// To parse this JSON data, do
//
//     final cat = catFromJson(jsonString);

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
part 'cat.g.dart';
// List<Cat> catFromJson(String str) => List<Cat>.from(json.decode(str).map((x) => Cat.fromJson(x)));
//
// String catToJson(List<Cat> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
@JsonSerializable()
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
  factory Cat.fromJson(Map<String, dynamic> json) => _$CatFromJson(json);
  Map<String, dynamic> toJson() => _$CatToJson(this);

}




