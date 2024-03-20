import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var player = AudioPlayer();
  void palySound(int num) {
    if (num == 0) player.setAsset('assets/audio/do.mp3');
    if (num == 1) player.setAsset('assets/audio/re.mp3');
    if (num == 2) player.setAsset('assets/audio/mi.mp3');
    if (num == 3) player.setAsset('assets/audio/fa.mp3');
    if (num == 4) player.setAsset('assets/audio/si.mp3');
    if (num == 5) player.setAsset('assets/audio/la.mp3');
    if (num == 6) player.setAsset('assets/audio/do.mp3'); // ti.mp3
    player.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            FilledButton(
                onPressed: () async {
                  palySound(0);
                },
                child: const Text("do")),
            FilledButton(
                onHover: (value) => palySound(1),
                onPressed: () async {
                  palySound(1);
                },
                child: const Text("re")),
            FilledButton(
                onPressed: () async {
                  palySound(2);
                },
                child: const Text("mi")),
            FilledButton(
                onPressed: () async {
                  palySound(3);
                },
                child: const Text("fa")),
            FilledButton(
                onPressed: () async {
                  palySound(4);
                },
                child: const Text("si")),
            FilledButton(
                onPressed: () async {
                  palySound(5);
                },
                child: const Text("la")),
            FilledButton(
                onPressed: () async {
                  palySound(6);
                },
                child: const Text("do")),
          ],
        ),
      ),
    );
  }
}
