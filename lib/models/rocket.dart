class Rocket {
  const Rocket({
    required this.name,
    required this.description,
    required this.type,
    required this.stages,
    required this.company,
    required this.boosters,
    required this.wikipediaUrl,
  });

  final String name;
  final String description;
  final String type;
  final int stages;
  final String company;
  final int boosters;
  final String wikipediaUrl;
}
