import 'package:flutter/material.dart';

class Noidung extends StatelessWidget {
  const Noidung({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nội Dung')),
      body: Center(
        child: Text(
          "Nội dung bài thi giữa kỳ gồm 03 câu",
          style: TextStyle(
            fontSize: 20,
            color: Colors.pink[900],
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}