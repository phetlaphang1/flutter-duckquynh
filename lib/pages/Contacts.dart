  import 'package:flutter/material.dart';

  void main() {
    runApp(MaterialApp(home: MyApp()));
  }

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
      return Scaffold(
          appBar: AppBar(
            title: Text('Phonebook'),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddContactPage(),
                    ),
                  );
                },
                icon: Icon(Icons.add),
              ),
            ],
          ),
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

class AddContactPage extends StatefulWidget {
  @override
  _AddContactPageState createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  late String name;
  late String phoneNumber;
  late String address;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Name',
              ),
              onChanged: (value) {
                name = value;
              },
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Phone Number',
              ),
              onChanged: (value) {
                phoneNumber = value;
              },
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Address',
              ),
              onChanged: (value) {
                address = value;
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Thêm liên hệ vào danh sách và quay trở lại trang trước
                Contact newContact = Contact(name, phoneNumber, address);

                Navigator.pop(context, newContact);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}