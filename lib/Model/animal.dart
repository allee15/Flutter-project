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
        furColor = json['colors']['primary'],
        breed = json['breeds']['primary'] ?? "Unknown",
        age = json['age'] ?? "Unknown",
        gender = json['gender'] ?? "Unknown",
        id = json['id'],
        email = json['contact']['email'] ?? "Unknown",
        description = json['description'] ?? "Unknown";
}

var animals = [
  Animal(
      name: "Mia",
      imageUrl: "",
      type: "dog",
      breed: "boabe",
      age: "2",
      gender: "female",
      id: 1,
      email: "",
      description: "da"),
  Animal(
      name: "Chleo",
      imageUrl: "",
      type: "cat",
      breed: "boabe",
      age: "11",
      gender: "female",
      id: 2,
      email: "",
      description: "da"),
  Animal(
      name: "Sparky",
      imageUrl: "",
      type: "dog",
      breed: "conserve",
      age: "17",
      gender: "male",
      id: 3,
      email: "",
      description: "da")
];
