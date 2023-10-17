class Dog {
  final int id;
  final String name;
  final int age;

  const Dog({
    required this.id,
    required this.name,
    required this.age,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }

  factory Dog.fromSqfliteDatabase(Map<String, dynamic> map) => Dog(
        id: map['id'],
        name: map['name'],
        age: map['age'],
      );

  @override
  String toString() {
    return 'Dog{id: $id, name: $name, age: $age}';
  }
}
