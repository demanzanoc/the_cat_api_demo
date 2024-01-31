class CatApiResponse {
  final String name;
  final String origin;
  final int affectionLevel;
  final int intelligence;
  final String referenceImageId;

  CatApiResponse({
    required this.name,
    required this.origin,
    required this.affectionLevel,
    required this.intelligence,
    required this.referenceImageId,
  });

  factory CatApiResponse.fromJson(Map<String, dynamic> json) =>
      CatApiResponse(
        name: json["name"],
        origin: json["origin"],
        affectionLevel: json["affection_level"],
        intelligence: json["intelligence"],
        referenceImageId: json["reference_image_id"] ?? '',
      );
}
