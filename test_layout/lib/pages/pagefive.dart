import 'package:flutter/material.dart';

class PageFive extends StatefulWidget {
  const PageFive({super.key});

  @override
  State<PageFive> createState() => _PageFiveState();
}

class _PageFiveState extends State<PageFive> {
  List<bool> active = [false, false];
  String exTitle = "Sport Categories";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Page Five")),
      body: Container(
        color: Colors.blueGrey.shade100,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Page Five"),
            ExpansionPanelList(
              expansionCallback: (panelIndex, isExpanded) {
                active[panelIndex] = !active[panelIndex];
                setState(() {});
              },
              children: <ExpansionPanel>[
                ExpansionPanel(
                    headerBuilder: (context, isExpanded) {
                      return const Text("Expandable Title one",
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center);
                    },
                    body: const Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      spacing: 7,
                      children: [
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 30),
                            child: Text("hell world lora")),
                      ],
                    ),
                    isExpanded: active[0],
                    canTapOnHeader: true),
                ExpansionPanel(
                    headerBuilder: (context, isExpanded) {
                      return const Text("Title two",
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center);
                    },
                    body: const Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      spacing: 7,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 30),
                          child: Text("hell world lora"),
                        )
                      ],
                    ),
                    isExpanded: active[1],
                    canTapOnHeader: true)
              ],
            ),
            // for (int i = 0; i < items.length; i++) items[i]
          ],
        ),
      ),
    );
  }
}
