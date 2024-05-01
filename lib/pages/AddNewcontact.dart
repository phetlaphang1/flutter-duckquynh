import 'dart:convert';
import 'dart:io';
import 'contacts.json';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Contact {
  final String name;
  final String phoneNumber;
  final String address;

  Contact(this.name, this.phoneNumber, this.address);

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
      'address': address,
    };
  }

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      json['name'],
      json['phoneNumber'],
      json['address'],
    );
  }
}

class ContactService {
  final String _filePath;

  ContactService(this._filePath);

  Future<List<Contact>> getContacts() async {
    try {
      final file = File(_filePath);
      if (!(await file.exists())) {
        return [];
      }
      final jsonString = await file.readAsString();
      final jsonData = json.decode(jsonString) as List;
      return jsonData.map((item) => Contact.fromJson(item)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<void> addContact(Contact contact) async {
    try {
      final file = File(_filePath);
      List<Contact> contacts = await getContacts();
      contacts.add(contact);
      await file.writeAsString(json.encode(contacts.map((e) => e.toJson()).toList()));
    } catch (e) {
      throw Exception('Failed to add contact');
    }
  }
}

class MyApp extends StatelessWidget {
  final String _filePath = 'contacts.json';
  final ContactService _contactService = ContactService('contacts.json');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contacts App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(_contactService),
    );
  }
}

class HomePage extends StatefulWidget {
  final ContactService contactService;

  HomePage(this.contactService);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Contact>> _contactsFuture;

  @override
  void initState() {
    super.initState();
    _contactsFuture = widget.contactService.getContacts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: FutureBuilder<List<Contact>>(
        future: _contactsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final contacts = snapshot.data!;
            return ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(contacts[index].name),
                  subtitle: Text(contacts[index].phoneNumber),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ContactDetailPage(contacts[index]),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddContactPage(widget.contactService),
            ),
          ).then((_) {
            setState(() {
              _contactsFuture = widget.contactService.getContacts();
            });
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class ContactDetailPage extends StatelessWidget {
  final Contact contact;

  ContactDetailPage(this.contact);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(contact.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${contact.name}'),
            Text('Phone Number: ${contact.phoneNumber}'),
            Text('Address: ${contact.address}'),
          ],
        ),
      ),
    );
  }
}

class AddContactPage extends StatefulWidget {
  final ContactService contactService;

  AddContactPage(this.contactService);

  @override
  _AddContactPageState createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  final _nameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _addressController = TextEditingController();

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
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _phoneNumberController,
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(labelText: 'Address'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _addContact(context);
              },
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }

  void _addContact(BuildContext context) async {
    final name = _nameController.text;
    final phoneNumber = _phoneNumberController.text;
    final address = _addressController.text;

    if (name.isNotEmpty && phoneNumber.isNotEmpty && address.isNotEmpty) {
      final newContact = Contact(name, phoneNumber, address);
      await widget.contactService.addContact(newContact);
      Navigator.pop(context);
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please fill all fields.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneNumberController.dispose();
    _addressController.dispose();
    super.dispose();
  }
}
