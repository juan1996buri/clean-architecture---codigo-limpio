class ImagesEntity {
  final String xs;
  final String sm;
  final String md;
  final String lg;

  ImagesEntity({
    required this.xs,
    required this.sm,
    required this.md,
    required this.lg,
  });

  ImagesEntity copyWith({
    String? xs,
    String? sm,
    String? md,
    String? lg,
  }) =>
      ImagesEntity(
        xs: xs ?? this.xs,
        sm: sm ?? this.sm,
        md: md ?? this.md,
        lg: lg ?? this.lg,
      );

  factory ImagesEntity.fromJson(Map<String, dynamic> json) => ImagesEntity(
        xs: json["xs"],
        sm: json["sm"],
        md: json["md"],
        lg: json["lg"],
      );

  Map<String, dynamic> toJson() => {
        "xs": xs,
        "sm": sm,
        "md": md,
        "lg": lg,
      };
}
