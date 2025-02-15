import 'package:flutter/material.dart';

class Result extends StatelessWidget {

  final int resultScore;
  final Function() resetHandler;


  const Result(this.resultScore, this.resetHandler);


  String get resultPhrase {
    String resultText;
    if(resultScore >= 31) {
      resultText = 'Wow! Great job!';
    } else if(resultScore >= 11) {
      resultText = 'Pretty likeable';
    }
    else if(resultScore >= 1) {
      resultText = 'You need to work harder';
    }
    else {
      resultText = 'Poor score';
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(resultPhrase, style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),),
          Text('Score: ' '$resultScore', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),),
          TextButton(onPressed: resetHandler, child: Text('Restart quiz', style: TextStyle(fontSize: 16, color: Colors.red),))
        ],
      ),
    );
  }
}
