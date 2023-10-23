import 'package:flutter/material.dart';

class ListTwo extends StatefulWidget {
  const ListTwo({super.key});

  @override
  State<ListTwo> createState() => _ListTwoState();
}

class _ListTwoState extends State<ListTwo> {
  List<Persons> persons = [
    Persons(
      name: "John",
      posi: 'Ass. Software Engineer',
      degree: 'B.Sc',
      email: 'johndoe@me.com',
      phone: '9876543210',
      address: 'New York',
    ),
    Persons(
      name: "Jahir",
      posi: 'Accounce',
      degree: 'B.Sc',
      email: 'johndoe@me.com',
      phone: '9876543210',
      address: 'New York',
    ),
    Persons(
      name: "Bipul",
      posi: 'Software Engineer',
      degree: 'B.Sc',
      email: 'johndoe@me.com',
      phone: '9876543210',
      address: 'New York',
    ),
    Persons(
      name: "Udoy",
      posi: 'Ass. Manager',
      degree: 'B.Sc',
      email: 'johndoe@me.com',
      phone: '9876543210',
      address: 'New York',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 20),
        itemCount: persons.length,
        itemBuilder: (BuildContext context, int index) => ListTile(
          title: Text(
            persons[index].name,
            style: const TextStyle(fontSize: 20),
          ),
          subtitle: Text(persons[index].posi),
          leading:
              CircleAvatar(child: Text(persons[index].name.substring(0, 1))),
          trailing: Text(
              "${persons[index].name[0].toUpperCase()}:${persons[index].degree}"),
          onLongPress: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(persons[index].name),
                  content: Text(
                      "Position: ${persons[index].posi}, \nDegree: ${persons[index].degree}, \nPhone: ${persons[index].phone}, \nemail: ${persons[index].email}, \nAddress: ${persons[index].address}"),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("OK"))
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}

// RichText(
//               text: TextSpan(
//                 text: "${persons[index].name}",
//                 style: TextStyle(
//                   color: Colors.black54,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 18,
//                 ),
//                 children: [
//                   TextSpan(text: '${persons[index].posi}'),
//                   TextSpan(text: '${persons[index].degree}'),
//                 ],
//               ),
//             ),
class Persons {
  String name;
  String posi;
  String? degree;
  String? email;
  String? phone;
  String? address;
  Persons(
      {required this.name,
      required this.posi,
      this.degree,
      this.email,
      this.phone,
      this.address});
}
