import 'package:flutter/material.dart';

class Answer extends StatelessWidget {

  final VoidCallback selectedHandler;
  final String answerText;

  const Answer(this.selectedHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(onPressed: selectedHandler, child: Text(answerText, style: TextStyle(color: Colors.white),),style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF584484)),),
    );
  }
}
