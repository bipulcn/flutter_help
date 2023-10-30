import 'package:flutter/material.dart';
import 'package:test_form/comp/testtone.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
              decoration: const InputDecoration(labelText: "Password"),
              validator: (value) =>
                  value!.isEmpty ? 'Password is required' : null,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Login"),
              ),
            ),
            Divider(),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(8),
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/forgets');
                    },
                    child: const Text("Recover Password"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/account');
                    },
                    child: const Text("Create account"),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        TestTone.instance.checkValue();
                      },
                      child: const Text("Test Me")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
