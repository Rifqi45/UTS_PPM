import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Picture Navigation',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
        useMaterial3: true,
      ),
      home: const MyHomePage(
        title: 'Picture Navigation',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _index = 0;
  List<String> _pictures = [
    "https://picsum.photos/id/1/200/300",
    "https://picsum.photos/id/2/200/300",
    "https://picsum.photos/id/6/200/300",
    "https://picsum.photos/id/10/200/300",
    "https://picsum.photos/id/3/200/300",
    "https://picsum.photos/id/5/200/300",
    "https://picsum.photos/id/4/200/300",
    "https://picsum.photos/id/7/200/300",
    "https://picsum.photos/id/9/200/300",
    "https://picsum.photos/id/8/200/300",
  ];

  void _incrementCounter() {
    setState(() {
      _index = min(++_index, _pictures.length - 1);
    });
  }

  void _decrementCounter() {
    setState(() {
      _index = max(--_index, 0);
    });
  }

  void _lastCounter() {
    setState(() {
      _index = _pictures.length - 1;
    });
  }

  void _firsCounter() {
    setState(() {
      _index = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(_pictures[_index]),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(onPressed: _firsCounter, child: Text("First")),
                TextButton(
                    onPressed: _decrementCounter, child: Text("Previous")),
                TextButton(onPressed: _incrementCounter, child: Text("Next")),
                TextButton(onPressed: _lastCounter, child: Text("Last")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
