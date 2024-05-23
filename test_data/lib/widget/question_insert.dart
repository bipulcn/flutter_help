import 'package:flutter/material.dart';

class QuestionInsert extends StatefulWidget {
  final ValueChanged<List<String>> onSubmit;
  const QuestionInsert({Key? key, required this.onSubmit});

  @override
  State<QuestionInsert> createState() => _QuestionInsertState();
}

class _QuestionInsertState extends State<QuestionInsert> {
  final cont1 = TextEditingController();
  final optcn1 = TextEditingController();
  final optcn2 = TextEditingController();
  final optcn3 = TextEditingController();
  final optcn4 = TextEditingController();
  final fromKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Form Dialog"),
      content: Form(
        key: fromKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Question Title", textAlign: TextAlign.start),
            TextFormField(
              controller: cont1,
              decoration: const InputDecoration(hintText: "Title"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter question title";
                }
                return null;
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context), child: Text("Cancel")),
        TextButton(
            onPressed: () {
              if (fromKey.currentState!.validate()) {
                widget.onSubmit([cont1.text]);
              }
            },
            child: Text("Save"))
      ],
    );
  }
}
