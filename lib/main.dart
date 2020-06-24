import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  final ScrollController scroller = ScrollController();

  @override
  Widget build(BuildContext context) {
    // A dirty trick to automatically scroll the widget
    Future<void>.delayed(
      const Duration(milliseconds: 100),
          () {
        scroller.animateTo(
          scroller.offset + 2000,
          duration: const Duration(milliseconds: 5000),
          curve: Curves.linear,
        );
      },
    );
    return MaterialApp(
      home: Scaffold(
        body: ListView.builder(
        // this key is used by the driver test
        key: const ValueKey<String>('complex-scroll'),
        controller: scroller,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(title: Text('Tile number $index'));
        },
      ),
    ),
    );
  }
}
