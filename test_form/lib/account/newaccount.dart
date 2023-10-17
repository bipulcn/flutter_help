import 'package:flutter/material.dart';

class NewAccount extends StatefulWidget {
  const NewAccount({super.key});

  @override
  State<NewAccount> createState() => _NewAccountState();
}

class _NewAccountState extends State<NewAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text(
              "New User Account",
              style: TextStyle(fontSize: 24),
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: "Full Name"),
              validator: (value) => value!.isEmpty ? 'Enter Full name' : null,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: "New id (login)"),
              validator: (value) => value!.isEmpty ? 'Enter username' : null,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: "Phone Number"),
              validator: (value) =>
                  value!.isEmpty ? 'Enter Valid Phone number' : null,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: "E-mail Address"),
              validator: (value) =>
                  value!.isEmpty ? 'Enter E-mail Address' : null,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: "Address"),
              validator: (value) =>
                  value!.isEmpty ? 'Enter mailing Address' : null,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: "Password"),
              validator: (value) =>
                  value!.isEmpty ? 'Password is required' : null,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  child: const Text("Login"),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Create Account"),
                ),
              ],
            ),
          ])),
    );
  }
}
