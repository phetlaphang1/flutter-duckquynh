import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color _randomColor = Colors.grey; // Màu mặc định

  void _changeColor() {
    setState(() {
      // Tạo màu ngẫu nhiên
      _randomColor = Color(Random().nextInt(0xFFFFFFFF));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ô Vuông Màu Ngẫu Nhiên'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: _changeColor,
          child: Container(
            width: 100,
            height: 100,
            color: _randomColor,
          ),
        ),
      ),
    );
  }
}
