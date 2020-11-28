import 'package:bloc_http/src/models/contact.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class JsonPlaceholderProvider {
  Future<List<Contact>> fetchContacts() async {
    http.Response response =
        await http.get("https://jsonplaceholder.typicode.com/users");
    var jsonResponse = convert.jsonDecode(response.body);
    var contactsJson = jsonResponse as List;
    List<Contact> contacts = List<Contact>();

    contactsJson.forEach((contact) {
      contacts.add(Contact.fromJson(contact));
    });

    contacts.forEach((contact) {
      print(contact.name);
    });

    return contacts;
  }
}
