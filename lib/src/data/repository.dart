import 'package:bloc_http/src/data/jsonplaceholder_provider.dart';
import 'package:bloc_http/src/models/contact.dart';

class Repository {
  final JsonPlaceholderProvider jsonPlaceholderProvider =
      JsonPlaceholderProvider();

  Future<List<Contact>> fetchContacts() async {
    return await jsonPlaceholderProvider.fetchContacts();
  }
}
