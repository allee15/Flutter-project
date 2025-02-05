class Animal {
  String? name, imageUrl, type, furColor, breed;
  int? age, id;

  Animal(String this.name, String this.imageUrl, String this.type,
      String this.furColor, String this.breed, int this.age, int this.id);
}

var animals = [
  Animal("Mia", "", "dog", "caramel", "boabe", 1, 1),
  Animal("Chleo", "", "cat", "white&black", "boabe", 11, 2),
  Animal("Sparky", "", "dog", "white&black", "conserva", 17, 3)
];
