import 'package:flutter/material.dart';
import 'package:test_form/comp/ksrl.dart';
import 'package:test_form/comp/styles.dart';

class NewAccount extends StatefulWidget {
  const NewAccount({super.key});

  @override
  State<NewAccount> createState() => _NewAccountState();
}

// enum Gender { male, female, other }

class _NewAccountState extends State<NewAccount> {
  DateTime dobirth = DateTime.now();
  final _nameCon = TextEditingController();
  String _gender = 'M';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: dobirth,
        firstDate: DateTime(1900, 1),
        lastDate: DateTime(2025));
    if (picked != null && picked != dobirth) {
      setState(() {
        dobirth = picked;
      });
    }
  }

  void validateAndSave() {
    final FormState form = _formKey.currentState!;
    if (form.validate()) {
      debugPrint('Form is valid');
    } else {
      debugPrint('Form is invalid');
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
                controller: _nameCon,
                decoration:
                    textDecor("Full Name", "Full Name as shown in offical id"),
                validator: (value) => value!.isEmpty ? 'Enter Full name' : null,
              ),
              const SizedBox(height: 10),
              Row(children: [
                // const Text("Gender"),
                const Icon(Icons.person_2_outlined),
                Expanded(
                  flex: 4,
                  child: ListTile(
                    title: const Text("Male"),
                    leading: Radio(
                      activeColor: Colors.blue,
                      value: 'M',
                      groupValue: _gender,
                      onChanged: (value) {
                        setState(() {
                          debugPrint(value.toString());
                          _gender = value.toString();
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                    flex: 5,
                    child: ListTile(
                      title: const Text("Female"),
                      leading: Radio(
                        value: "F",
                        groupValue: _gender,
                        onChanged: (value) {
                          setState(() {
                            debugPrint(value.toString());
                            _gender = value.toString();
                          });
                        },
                      ),
                    ))
              ]),
              const SizedBox(height: 10),
              TextFormField(
                decoration: textDecor("Address", "District, Division"),
                validator: (value) =>
                    value!.isEmpty ? 'Enter mailing Address' : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                  controller: TextEditingController(
                      text: dobirth.toLocal().toString().split(' ')[0]),
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
              Row(children: [
                Expanded(
                  child: TextFormField(
                    decoration:
                        textDecor("User id", "It will be used for login"),
                    validator: (value) =>
                        value!.isEmpty ? 'Enter username' : null,
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  width: 50,
                  child: IconButton(
                      onPressed: () {},
                      color: Colors.white,
                      icon: const Icon(Icons.search)),
                ),
              ]),

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
                      dobHash(dobirth.toString(), _gender.toString());
                      nameHash(_nameCon.text);
                      // validateAndSave();
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
