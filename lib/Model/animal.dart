class Animal {
  String name, imageUrl, type, breed, age, gender;
  String email, description;
  int id;
  String? furColor;

  Animal(
      {required this.name,
      required this.imageUrl,
      required this.type,
      this.furColor,
      required this.breed,
      required this.age,
      required this.gender,
      required this.id,
      required this.email,
      required this.description});

  Animal.fromJson(Map<String, dynamic> json)
      : name = json['name'] ?? "Unknown",
        imageUrl = json['photos'] != null && json['photos'].isNotEmpty
            ? json['photos'][0]['medium'] ?? ''
            : '',
        type = json['type'] ?? "Unknown",
        breed = json['breeds']['primary'] ?? "Unknown",
        furColor = json['colors']['primary'] ?? "Unknown",
        age = json['age'] ?? "Unknown",
        gender = json['gender'] ?? "Unknown",
        id = json['id'],
        email = json['contact']['email'] ?? "Unknown",
        description = json['description'] ?? "Unknown";
}
