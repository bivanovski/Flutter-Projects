import 'package:flutter/material.dart';

import 'CounterWidget.dart';
import 'SecondPage.dart';

void main() {
  runApp(const MyApp());
}

 class MyApp extends StatelessWidget {
   const MyApp({super.key});

   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       home: HomePage(),
     );
   }
 }

 class HomePage extends StatelessWidget {
  final GlobalKey<CounterState> counterKey = GlobalKey();
   HomePage({super.key});

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: const Text('Global Counter App'),
       ),
       body: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             CounterWidget(key: counterKey),
             ElevatedButton(
                 onPressed: () {
                   Navigator.push(
                     context,
                     MaterialPageRoute(
                         builder: (context) => SecondPage(counterKey: counterKey)
                     ),
                   );
                 },
                 child: const Text('Navigate to Second Page'),
             )
           ],
         ),
       ),
     );
   }
 }

