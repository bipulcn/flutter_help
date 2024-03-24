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
      phone: '015487545588',
      address: 'New York',
    ),
    Persons(
      name: "Jahir",
      posi: 'Accounce',
      degree: 'B.Sc',
      email: 'johndoe@me.com',
      phone: '0168975464123',
      address: 'New York',
    ),
    Persons(
      name: "Bipul",
      posi: 'Software Engineer',
      degree: 'B.Sc',
      email: 'johndoe@me.com',
      phone: '01254897555',
      address: 'New York',
    ),
    Persons(
      name: "Udoy",
      posi: 'Ass. Manager',
      degree: 'B.Sc',
      email: 'johndoe@me.com',
      phone: '01754986565',
      address: 'New York',
    ),
  ];

  void _nameSort() {
    persons.sort((a, b) => a.name.compareTo(b.name));
    setState(() {});
  }

  void _posiSort() {
    persons.sort((a, b) => a.posi.compareTo(b.posi));
    setState(() {});
  }

  void _phoneSort() {
    persons.sort((a, b) => a.phone.compareTo(b.phone));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                "${persons[index].phone.substring(0, 5).toUpperCase()}:${persons[index].degree}"),
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
                          child: const Text("OK"))
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _nameSort,
            child: const Icon(Icons.near_me_sharp),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: _posiSort,
            child: const Icon(Icons.point_of_sale),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: _phoneSort,
            child: const Icon(Icons.phone),
          ),
        ],
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
  String phone;
  String? degree;
  String? email;
  String? address;
  Persons(
      {required this.name,
      required this.posi,
      required this.phone,
      this.degree,
      this.email,
      this.address});
}
