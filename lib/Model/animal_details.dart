class AnimalDetails {
  int id;
  String type,
      species,
      breed,
      furColor,
      age,
      gender,
      size,
      name,
      description,
      imageUrl;

  AnimalDetails(
      {required this.id,
      required this.type,
      required this.species,
      required this.breed,
      required this.furColor,
      required this.age,
      required this.gender,
      required this.size,
      required this.name,
      required this.description,
      required this.imageUrl});

  AnimalDetails.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        type = json['type'] ?? "Unknown",
        species = json['species'] ?? "Unknown",
        breed = json['breeds']['primary'] ?? "Unknown",
        furColor = json['colors']['primary'] ?? "Unknown",
        age = json['age'] ?? "Unknown",
        gender = json['gender'] ?? "Unknown",
        size = json['size'] ?? "Unknown",
        name = json['name'] ?? "Unknown",
        description = json['description'] ?? "Unknown",
        imageUrl = json['photos'] != null && json['photos'].isNotEmpty
            ? json['photos'][0]['medium'] ?? ''
            : '';
}
