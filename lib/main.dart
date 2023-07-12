import 'package:flutter/material.dart';
import 'package:flutter_rtmp_streaming_prototype/apivideo/apivideo_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter_rtmp_streaming_prototype',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ApiVideoPage(),
    );
  }
}
