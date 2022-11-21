class Rocket {
  final String name;
  final String description;
  final String type;
  final int stages;
  final String company;
  final int boosters;
  final String wikipediaUrl;

  const Rocket({
    required this.name,
    required this.description,
    required this.type,
    required this.stages,
    required this.company,
    required this.boosters,
    required this.wikipediaUrl,
  });

  Rocket.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        description = json['description'],
        type = json['type'],
        stages = json['stages'],
        company = json['company'],
        boosters = json['boosters'],
        wikipediaUrl = json['wikipedia'];
}
