import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trang chủ KTX'),
        backgroundColor: const Color(0xFF2563EB),
      ),
      body: const Center(
        child: Text(
          'Tab 1: Trang chủ & Bảng tin & Báo sự cố',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}