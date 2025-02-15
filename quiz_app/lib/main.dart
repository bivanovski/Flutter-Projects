import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('UACS Quiz App', style: TextStyle(color: Colors.white),),
          backgroundColor: Color(0xFF29176b),
        ),
        body: Padding(padding: const EdgeInsets.all(30),
        child: _questionIndex < _questions.length ?
          Quiz(_questions, _questionIndex, _answerQuestion)
          :
          Result(_totalScore, _resetQuiz),
      ),
    ),
    debugShowCheckedModeBanner: false,
    );
  }

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore  = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

  }

  final _questions = [
    {
      'question text': 'Q1. Who created Flutter?',
      'answers': [
        {'text': 'Microsoft', 'score': -2},
        {'text': 'Apache', 'score': -2},
        {'text': 'Google', 'score': 10},
        {'text': 'X', 'score': -2},
      ]
    },
    {
      'question text': 'Q2. Flutter is a: ',
      'answers': [
        {'text': 'Programming Language', 'score': -2},
        {'text': 'SDK', 'score': 10},
        {'text': 'Both', 'score': -2},
        {'text': 'None of the above', 'score': -2},
      ]
    },
    {
      'question text': 'Q3. How many types of widgets are there in Flutter: ',
      'answers': [
        {'text': '2', 'score': 10},
        {'text': '3', 'score': -2},
        {'text': '4', 'score': -2},
        {'text': '5', 'score': -2},
      ]
    },
    {
      'question text': 'Q4. Is Flutter for web and desktop available in stable version? ',
      'answers': [
        {'text': 'Yes', 'score': 10},
        {'text': 'No', 'score': -2},
      ]
    }
  ];




}

