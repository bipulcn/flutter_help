import 'package:flutter/material.dart';
import 'package:test_form/comp/styles.dart';
import 'package:test_form/comp/testtone.dart';

class NewAccount extends StatefulWidget {
  const NewAccount({super.key});

  @override
  State<NewAccount> createState() => _NewAccountState();
}

class _NewAccountState extends State<NewAccount> {
  DateTime selectedDate = DateTime.now();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900, 1),
        lastDate: DateTime(2025));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void validateAndSave() {
    final FormState form = _formKey.currentState!;
    if (form.validate()) {
      print('Form is valid');
    } else {
      print('Form is invalid');
    }
  }

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
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              TextFormField(
                decoration:
                    textDecor("Full Name", "Full Name as shown in offical id"),
                validator: (value) => value!.isEmpty ? 'Enter Full name' : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: textDecor("Address", "District, Division"),
                validator: (value) =>
                    value!.isEmpty ? 'Enter mailing Address' : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                  controller: TextEditingController(
                      text: selectedDate.toLocal().toString().split(' ')[0]),
                  decoration: const InputDecoration(
                      labelText: "Date of birth",
                      border: OutlineInputBorder(),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      suffixIcon: Icon(Icons.calendar_month)),
                  validator: (value) =>
                      value!.isEmpty ? 'Enter mailing Address' : null,
                  readOnly: true,
                  onTap: () {
                    _selectDate(context);
                  }),
              const SizedBox(height: 10),
              TextFormField(
                decoration: textDecor("User id", "It will be used for login"),
                validator: (value) => value!.isEmpty ? 'Enter username' : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: textDecor("Phone Number (optional)",
                    "It will used to recover password"),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: textDecor(
                    "E-mail Address (optional)", "Personal email address"),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: textDecor(
                    "Password", "8+ char, Upper & lowercase letters, numbers"),
                validator: (value) => validatePassword(value.toString()),
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
              ),
              // const Divider(height: 50),
              const Padding(padding: EdgeInsets.symmetric(vertical: 16)),
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
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      validateAndSave();
                      // TestTone.instance.checkMe();
                    },
                    child: const Row(
                        children: [Text("Create  "), Icon(Icons.person_add)]),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? validatePassword(String value) {
    RegExp regex = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$'); // r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'
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
