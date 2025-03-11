import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emoji Swapper',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> emojis = [
    Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(key: UniqueKey(), child: GetEmoji(emoji: "😎")),
    ),
    Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(key: UniqueKey(), child: GetEmoji(emoji: "🤠")),
    ),
  ];


  swapEmoji() {
    setState(() {
      emojis.insert(1, emojis.removeAt(0));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: emojis,
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(onPressed: swapEmoji, child: const Text('Swap'))
          ],
        ),
      ),
    );
  }
}


class GetEmoji extends StatefulWidget {
  String emoji;
  GetEmoji({super.key, required this.emoji});

  @override
  State<GetEmoji> createState() => _GetEmojiState();
}

class _GetEmojiState extends State<GetEmoji> {
  late String emoji;

  @override
  void initState() {
    super.initState();
    emoji = widget.emoji;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
      child: Text(
        emoji,
        style: TextStyle(fontSize: 100),
      ),
    );
  }
}



