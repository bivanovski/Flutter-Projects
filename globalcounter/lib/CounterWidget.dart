import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  CounterState createState() => CounterState();
}

class CounterState extends State<CounterWidget> {
  int _count = 0;

  void increment() {
    setState(() {
      _count++;
    });
  }

  int get count => _count;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Count: $_count'),
        ElevatedButton(
          onPressed: increment,
          child: const Text('Increment'),
        ),
      ],
    );
  }
}