import 'package:flutter/material.dart';
import 'package:test_data/database/question_db.dart';
import 'package:test_data/models/question.dart';
import 'package:test_data/widget/question_insert.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  Future<List<Question>>? futureQus;
  final qusDb = QuestionDb();

  @override
  void initState() {
    super.initState();
    fetchQuestions();
  }

  void fetchQuestions() {
    setState(() {
      futureQus = qusDb.getAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Question List",
                    style: TextStyle(fontSize: 30),
                  )),
              ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) => QuestionInsert(
                              onSubmit: (dts) async {
                                await qusDb.create(
                                    id: 5, title: dts[0], result: 0);
                                if (!mounted) return;
                                fetchQuestions();
                                Navigator.of(context).pop();
                              },
                            ));
                  },
                  child: Icon(Icons.add)),
            ],
          ),
          FutureBuilder(
              future: futureQus,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  var ques = [];
                  print(snapshot.data.toString());
                  if (snapshot.data != null) ques = snapshot.data!;
                  return ques.isEmpty
                      ? const Center(child: Text("No questions..."))
                      : Container(
                          height: 500,
                          child: ListView.separated(
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 12),
                            itemCount: ques.length,
                            itemBuilder: (context, index) {
                              final qs = ques[index];
                              return ListTile(
                                title: Text(qs.title),
                              );
                            },
                          ),
                        );
                }
              }),
        ],
      ),
    );
  }
}
