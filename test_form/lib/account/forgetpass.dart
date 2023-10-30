import 'package:flutter/material.dart';

class ForgetPass extends StatefulWidget {
  const ForgetPass({super.key});

  @override
  State<ForgetPass> createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Login",
              style: TextStyle(fontSize: 24),
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: "Username"),
              validator: (value) => value!.isEmpty ? 'Enter username' : null,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: "Phone Number"),
              validator: (value) =>
                  value!.isEmpty ? 'Enter Valid Phone number' : null,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Request OTP"),
              ),
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
                      Navigator.pushNamed(context, '/account');
                    },
                    child: const Text("Create account")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
