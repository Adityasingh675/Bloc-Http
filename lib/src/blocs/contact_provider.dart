import 'package:bloc_http/src/blocs/contact_bloc.dart';
export 'package:bloc_http/src/blocs/contact_bloc.dart';
import 'package:flutter/material.dart';

class ContactProvider extends InheritedWidget {
  final ContactBloc bloc = ContactBloc();

  ContactProvider({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_) {
    return true;
  }

  static ContactBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<ContactProvider>()).bloc;
  }
}
