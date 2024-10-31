class Dog {
  final String dogName;
  final String description;
  final int age;
  final String image;

  Dog({
    required this.dogName,
    required this.description,
    required this.age,
    required this.image,
  });

  factory Dog.fromJson(Map<String, dynamic> json) {
    return Dog(
      dogName: json['dogName'] as String,
      description: json['description'] as String,
      age: json['age'] as int,
      image: json['image'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dogName': dogName,
      'description': description,
      'age': age,
      'image': image,
    };
  }
}