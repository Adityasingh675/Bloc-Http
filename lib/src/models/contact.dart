import 'package:bloc_http/src/models/company.dart';

class Contact {
  final int id;
  final String name;
  final String username;
  final String email;
  final Company company;

  Contact({this.email, this.id, this.name, this.username, this.company});

  factory Contact.fromJson(Map<String, dynamic> parsedJson) {
    return Contact(
      id: parsedJson['id'],
      name: parsedJson['name'],
      username: parsedJson['username'],
      email: parsedJson['email'],
      company: Company.fromJson(parsedJson['company']),
    );
  }
}
