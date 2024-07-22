class UserModel {
  final String name;
  final int age;
  final DateTime birthdate;
  final String gender;
  final List<String> languages;

  UserModel({
    required this.name,
    required this.age,
    required this.birthdate,
    required this.gender,
    required this.languages,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
      'birthdate': birthdate.toIso8601String(),
      'gender': gender,
      'languages': languages,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      age: map['age'],
      birthdate: DateTime.parse(map['birthdate']),
      gender: map['gender'],
      languages: List<String>.from(map['languages']),
    );
  }
}
