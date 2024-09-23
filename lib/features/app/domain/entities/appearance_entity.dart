class AppearanceEntity {
  final String gender;
  final String race;

  AppearanceEntity({
    required this.gender,
    required this.race,
  });

  AppearanceEntity copyWith({
    String? gender,
    String? race,
  }) =>
      AppearanceEntity(
        gender: gender ?? this.gender,
        race: race ?? this.race,
      );

  factory AppearanceEntity.fromJson(Map<String, dynamic> json) =>
      AppearanceEntity(
        gender: json["gender"],
        race: json["race"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "gender": gender,
        "race": race,
      };
}
