import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test_form/comp/styles.dart';
import 'package:test_form/comp/testtone.dart';
import 'package:crypto/crypto.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          "Login",
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
              decoration: textDecor("Password", "Password"),
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
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [Text("Login  "), Icon(Icons.login)],
                ),
              ),
            ),
            const Divider(),
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
                      child: const Row(children: [
                        Text("Recover Password  "),
                        Icon(Icons.lock)
                      ])),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/account');
                    },
                    child: const Row(
                        children: [Text("Create  "), Icon(Icons.person_add)]),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                      onPressed: () {
                        String text =
                            md5.convert(utf8.encode("bipul")).toString();
                        debugPrint(text);
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
