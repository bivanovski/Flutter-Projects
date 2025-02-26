import 'package:flutter/material.dart';

import 'CounterWidget.dart';

class SecondPage extends StatelessWidget {
  final GlobalKey<CounterState> counterKey;

  const SecondPage({required this.counterKey, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: Text('Count value: ${counterKey.currentState?.count ?? 0}'),
      ),
    );
  }
}