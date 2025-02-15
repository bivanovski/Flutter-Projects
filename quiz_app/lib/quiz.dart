import 'package:flutter/material.dart';
import 'package:quiz_app/question.dart';

import 'answer.dart';

class Quiz extends StatelessWidget {

  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  const Quiz(this.questions, this.questionIndex, this.answerQuestion);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]['question text'].toString()
        ),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>).map((answer){
          return Answer(() => answerQuestion(answer['score']), answer['text'] as String);
        })
      ],
    );
  }
}
