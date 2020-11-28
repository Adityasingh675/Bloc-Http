import 'package:bloc_http/src/data/repository.dart';
import 'package:bloc_http/src/models/contact.dart';
import 'package:rxdart/rxdart.dart';

class ContactBloc {
  // Constructor
  ContactBloc() {
    _fetchContacts();
  }
  // Define subjects
  final _contacts = BehaviorSubject<List<Contact>>();
  final Repository _repository = Repository();

  // Get Data
  Stream<List<Contact>> get contacts => _contacts.stream;

  // Set Data
  Function(List<Contact>) get changeContact => _contacts.sink.add;

  void dispose() {
    _contacts.close();
  }

  _fetchContacts() =>
      _repository.fetchContacts().then((contacts) => changeContact(contacts));
}
