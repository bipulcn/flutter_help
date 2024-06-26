import 'package:chainids/units/blockdata.dart';
import 'package:flutter/material.dart';

class WalletMan extends StatefulWidget {
  const WalletMan({super.key});

  @override
  State<WalletMan> createState() => _WalletManState();
}

class _WalletManState extends State<WalletMan> {
  final blocs = BlockData();

  @override
  void initState() {
    super.initState();
    blocs.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Wallet Man", style: TextStyle(fontSize: 30)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                    shape: WidgetStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0))),
                    backgroundColor:
                        WidgetStateProperty.all(Colors.blueAccent)),
                onPressed: () async {
                  BlockData bdata = BlockData();
                  await bdata.creatAccount();
                },
                child: const Text(
                  "Press",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                style: ButtonStyle(
                    shape: WidgetStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0))),
                    backgroundColor: WidgetStateProperty.all(
                        const Color.fromARGB(255, 228, 135, 13))),
                onPressed: () {
                  debugPrintStack();
                  BlockData().getPublicAddress();
                },
                child: const Text(
                  "Check",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all(Colors.lightBlueAccent)),
                onPressed: () async {
                  debugPrintStack(maxFrames: 2, label: "helloworld");
                  BlockData bdata = BlockData();
                  bdata.getUserName();
                },
                child: const Text("hello"),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all(Colors.lightBlueAccent)),
                onPressed: () async {
                  BlockData bdata = BlockData();
                  double amt = await bdata.getBalace();
                  debugPrint(amt.toString());
                },
                child: const Text("Balace"),
              ),
            ],
          ),
          TextButton(
            style: ButtonStyle(
                backgroundColor:
                    WidgetStateProperty.all(Colors.lightBlueAccent)),
            onPressed: () async {
              // BlockData bdata = await BlockData();
              // await bdata.sendMoney();
            },
            child: const Text("Send Money"),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            child: createForm(context),
          )
        ],
      ),
    );
  }

  void checkWalte() {}

  Widget createForm(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController nameCon = TextEditingController();
    TextEditingController ageCon = TextEditingController();
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: nameCon,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Name'),
              validator: (String? value) {
                // if (value == null || value.isEmpty) {
                //   return "Please enter your name";
                // }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: ageCon,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), label: Text("Age")),
              validator: (String? value) {
                // if (value == null || value.isEmpty) {
                //   return "Please enter your age";
                // }
                return null;
              },
            ),
          ),
          const SizedBox(height: 10),
          TextButton(
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white),
              onPressed: () async {
                BlockData bdata = BlockData();
                bdata.saveUser(nameCon.text, int.parse(ageCon.text));
                if (formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                  saveDataToWalet(nameCon.text, int.parse(ageCon.text));
                }
              },
              child: const Icon(Icons.save))
        ],
      ),
    );
  }

  void saveDataToWalet(String? name, int? age) async {
    debugPrint("$name $age");
  }
}
