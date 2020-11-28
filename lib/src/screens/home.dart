import 'dart:ui';

import 'package:bloc_http/src/blocs/contact_provider.dart';
import 'package:bloc_http/src/models/contact.dart';
import 'package:bloc_http/src/screens/contact.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = ContactProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts App'),
      ),
      body: StreamBuilder<List<Contact>>(
        stream: bloc.contacts,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(),
            );
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.person),
                ),
                title: Text(
                  snapshot.data[index].name,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
                ),
                subtitle: Text(
                  snapshot.data[index].company.name,
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ContactPage(
                        contact: snapshot.data[index],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
