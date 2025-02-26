import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EmojiSwapper(),
    );
  }
}

class EmojiSwapper extends StatefulWidget {
  @override
  _EmojiSwapperState createState() => _EmojiSwapperState();
}

class _EmojiSwapperState extends State<EmojiSwapper> {
  bool swapped = false;
  final emoji1Key = UniqueKey();
  final emoji2Key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emoji Swapper'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: swapped
                  ? [
                _buildEmojiContainer('😀', emoji2Key),
                _buildEmojiContainer('😎', emoji1Key),
              ]
                  : [
                _buildEmojiContainer('😀', emoji1Key),
                _buildEmojiContainer('😎', emoji2Key),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  swapped = !swapped;
                });
              },
              child: Text('Swap Emojis'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmojiContainer(String emoji, Key key) {
    return Container(
      key: key,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        emoji,
        style: TextStyle(fontSize: 50),
      ),
    );
  }
}