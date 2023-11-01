import 'package:flutter/material.dart';
import 'package:test_form/comp/styles.dart';

class ForgetPass extends StatefulWidget {
  const ForgetPass({super.key});

  @override
  State<ForgetPass> createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          "Forget Password",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: textDecor("Username", "Username"),
              validator: (value) => value!.isEmpty ? 'Enter username' : null,
            ),
            const SizedBox(height: 30),
            TextFormField(
              decoration: textDecor("Phone Number", "Phone Number"),
              validator: (value) =>
                  value!.isEmpty ? 'Enter Valid Phone number' : null,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: ElevatedButton(
                onPressed: () {},
                child: const Row(
                  children: [Text("Request OTP"), Icon(Icons.send)],
                ),
              ),
            ),
            const Divider(),
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
                  child: const Row(
                    children: [Text("Login  "), Icon(Icons.login)],
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/account');
                  },
                  child: const Row(
                      children: [Text("Create  "), Icon(Icons.person_add)]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
