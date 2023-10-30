import 'package:flutter/material.dart';
import 'package:test_form/comp/testtone.dart';

class NewAccount extends StatefulWidget {
  const NewAccount({super.key});

  @override
  State<NewAccount> createState() => _NewAccountState();
}

class _NewAccountState extends State<NewAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          "New Account",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      // resizeToAvoidBottomInset: false, // this will show keyboard on top of fields
      body: SingleChildScrollView(
        // physics: const NeverScrollableScrollPhysics(),  // this will disable scrolling
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
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
            Divider(),
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
                  onPressed: () {
                    TestTone.instance.checkMe();
                  },
                  child: const Text("Create Account"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String? validatePassword(String value) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Enter valid password';
      } else {
        return null;
      }
    }
  }
}
