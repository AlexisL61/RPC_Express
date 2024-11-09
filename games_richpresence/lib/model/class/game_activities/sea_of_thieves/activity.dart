class SeaOfThievesActivity {
  final String id;
  final String name;
  final int length;
  final String description;
  final String image;
  final String rpc;

  const SeaOfThievesActivity({
    required this.id,
    required this.name,
    required this.length,
    required this.description,
    required this.image,
    required this.rpc
  });

  static SeaOfThievesActivity fromJson(Map<String, dynamic> json) {
    return SeaOfThievesActivity(
      id: json['id'] as String,
      name: json['name'] as String,
      length: json['length'] as int,
      description: json['description'] as String,
      image: json['image'] as String,
      rpc: json['rpc'] as String
    );
  }

  static List<SeaOfThievesActivity> fromJsonList(List<dynamic> json) {
    return json.map((e) => SeaOfThievesActivity.fromJson(e)).toList();
  }
}
