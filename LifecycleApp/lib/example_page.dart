import 'package:flutter/material.dart';

class ExamplePage extends StatelessWidget {
  const ExamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example Page', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Text('This is an empty example page.'),
      ),
    );
  }
}