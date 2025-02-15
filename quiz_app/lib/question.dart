import 'package:flutter/material.dart';

class Question extends StatelessWidget {

  final String questionText;


  const Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 20),
      child: Text(questionText, style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,)
    );
  }
}
