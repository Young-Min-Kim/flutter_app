class User {
  late String name;
  late int age;

  User(this.name, this.age);

  factory User.fromJson(Map<String, dynamic> data) {
    var result = User(data['name'], data['age']);
    return result;
  }
}
