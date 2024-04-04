import 'package:flutter/material.dart';

class Contact {
  final String name;
  final String phoneNumber;

  Contact(this.name, this.phoneNumber);
}

class MyApp extends StatelessWidget {
  final List<Contact> contacts = [
    Contact('Alice', '123-456-7890'),
    Contact('Bob', '987-654-3210'),
    // Add more contacts here
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Phonebook')),
        body: ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(contacts[index].name),
              subtitle: Text(contacts[index].phoneNumber),
              onTap: () {
                // Navigate to detail page or show details here
                print('Selected contact: ${contacts[index].name}');
              },
            );
          },
        ),
      ),
    );
  }
}