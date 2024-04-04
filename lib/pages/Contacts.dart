import 'package:flutter/material.dart';

class Contact {
  final String name;
  final String phoneNumber;
  final String address;
  // Thêm các thông tin khác của liên hệ

  Contact(this.name, this.phoneNumber, this.address);
}



class MyApp extends StatelessWidget {
  final List<Contact> contacts = [
    Contact('Alice', '123-456-7890', '123 Main St'),
    Contact('Bob', '987-654-3210', '456 Elm St'),
    // Thêm các liên hệ khác vào đây
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ContactDetailPage(contact: contacts[index]),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class ContactDetailPage extends StatelessWidget {
  final Contact contact;

  ContactDetailPage({required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(contact.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Phone: ${contact.phoneNumber}'),
            Text('Address: ${contact.address}'),
            // Thêm các thông tin khác của liên hệ
          ],
        ),
      ),
    );
  }
}
