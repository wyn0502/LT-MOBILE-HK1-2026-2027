import 'package:flutter/material.dart';

class TrangChu extends StatelessWidget {
  const TrangChu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Trang Chủ')),
      body: Center(
        child: Text(
          "Chào mừng bạn đến với ứng dụng KTGK",
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