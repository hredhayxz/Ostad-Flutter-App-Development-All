import 'package:flutter/material.dart';

class ContactList extends StatefulWidget {
  const ContactList({super.key});

  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  final List<Contact> contacts = [
    Contact(
        name: 'Md Alhaz Mondal Hredhay',
        email: 'amhredhay102@gmail.com',
        phone: '01861883575'),
    Contact(
        name: 'Rephat', email: 'Rephat@example.com', phone: '123**********'),
    Contact(name: 'ABC', email: 'abc@example.com', phone: '123************'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact List'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return ListTile(
            title: Text(contact.name),
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return ContactDetails(contact: contact);
                },
              );
            },
          );
        },
      ),
    );
  }
}

class Contact {
  final String name;
  final String email;
  final String phone;

  Contact({required this.name, required this.email, required this.phone});
}

class ContactDetails extends StatelessWidget {
  final Contact contact;

  const ContactDetails({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Contact Details',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Name: ${contact.name}',
          ),
          const SizedBox(height: 16),
          Text(
            'Email: ${contact.email}',
          ),
          const SizedBox(height: 16),
          Text(
            'Phone: ${contact.phone}',
          ),
        ],
      ),
    );
  }
}
