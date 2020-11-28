class Company {
  final String name;

  Company({this.name});

  factory Company.fromJson(Map<dynamic, dynamic> parsedJson) {
    return Company(
      name: parsedJson['name'],
    );
  }
}
