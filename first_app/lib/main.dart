import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    Widget titleSection = Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: const Text('Marko Markovski', style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    padding: const EdgeInsets.only(bottom: 8),
                  ),
                  const Text('marko.markovski@gmail.com', style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
          ),
          Icon(Icons.favorite, color: Colors.red,),
          const Text('88')
        ],
      ),
    );
    Widget  buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(Colors.blueAccent, Icons.call, 'Call'),
        _buildButtonColumn(Colors.redAccent, Icons.email, 'Email'),
        _buildButtonColumn(Colors.yellow, Icons.share, 'Share'),
      ],
    );
    Widget textSection = const Padding(padding: EdgeInsets.all(20),
      child: Text('Lorem Ipsum is simply dummy text of the printing and '
          'typesetting industry. Lorem Ipsum has been the industrys standard dummy text '
          'ever since the 1500s, when an unknown printer took a galley of type and scrambled '
          'it to make a type specimen book. It has survived not only five centuries, but also'
          ' the leap into electronic typesetting, remaining essentially unchanged. It was popularised'
          ' in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,'
          ' and more recently with desktop publishing software like '
          'Aldus PageMaker including versions of Lorem Ipsum.',softWrap: true,),);
    Widget imageSection = Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(1000),
                bottomRight: Radius.circular(1000),
              ),
              child: Opacity(
                opacity: 0.8,
                child: Image.asset(
                  'assets/cover.jpg',
                  height: 220,
                  fit: BoxFit.cover,
    )
              ),
            ),
          ],
        ),
        Center(
          child: Padding(
              padding: const EdgeInsets.only(top: 170),
              child: Image.asset('assets/avatar.png', height: 70,),
        ),
        )
      ],
    );
    return MaterialApp(
      title: 'UACS student app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: ListView(
          children: [
            imageSection,
            titleSection,
            buttonSection,
            textSection
          ],
        ),
      )
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: color,),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(label, style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: color
          ),),
        )
      ],
    );
  }
}
