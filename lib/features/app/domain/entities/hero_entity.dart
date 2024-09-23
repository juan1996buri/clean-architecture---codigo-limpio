// To parse this JSON data, do
//
//     final heroEntity = heroEntityFromJson(jsonString);

import 'dart:convert';

import 'package:api_rest/features/app/domain/entities/appearance_entity.dart';
import 'package:api_rest/features/app/domain/entities/images_entity.dart';

List<HeroEntity> heroEntityFromJson(String str) =>
    List<HeroEntity>.from(json.decode(str).map((x) => HeroEntity.fromJson(x)));

String heroEntityToJson(List<HeroEntity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HeroEntity {
  final int id;
  final String name;
  final String slug;
  final AppearanceEntity appearance;
  final ImagesEntity images;

  HeroEntity({
    required this.id,
    required this.name,
    required this.slug,
    required this.appearance,
    required this.images,
  });

  HeroEntity copyWith({
    int? id,
    String? name,
    String? slug,
    AppearanceEntity? appearance,
    ImagesEntity? images,
  }) =>
      HeroEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        slug: slug ?? this.slug,
        appearance: appearance ?? this.appearance,
        images: images ?? this.images,
      );

  factory HeroEntity.fromJson(Map<String, dynamic> json) => HeroEntity(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        appearance: AppearanceEntity.fromJson(json["appearance"]),
        images: ImagesEntity.fromJson(json["images"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "appearance": appearance.toJson(),
        "images": images.toJson(),
      };
}
