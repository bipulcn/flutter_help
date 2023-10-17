import 'package:flutter/material.dart';
import 'package:test_data/models/dogs.dart';

class CreateDogWidget extends StatefulWidget {
  final Dog? dog;
  final ValueChanged<List<String>> onSubmit;

  const CreateDogWidget({Key? key, this.dog, required this.onSubmit})
      : super(key: key);

  @override
  State<CreateDogWidget> createState() => _CreateDogWidgetState();
}

class _CreateDogWidgetState extends State<CreateDogWidget> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final fromKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    controller1.text = widget.dog?.name ?? '';
    controller2.text = widget.dog?.age.toString() ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.dog != null;

    return AlertDialog(
      title: Text(isEditing ? 'Edit Dog' : 'Add Dog'),
      content: Form(
        key: fromKey,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          TextFormField(
            controller: controller1,
            decoration: const InputDecoration(hintText: 'Name'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
              controller: controller2,
              decoration: const InputDecoration(hintText: 'Age'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              }),
        ]),
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel")),
        TextButton(
            onPressed: () {
              if (fromKey.currentState!.validate()) {
                widget.onSubmit([controller1.text, controller2.text]);
              }
            },
            child: const Text('OK')),
      ],
    );
  }
}
