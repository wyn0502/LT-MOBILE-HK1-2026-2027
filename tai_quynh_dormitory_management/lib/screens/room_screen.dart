import 'package:flutter/material.dart';

class RoomScreen extends StatelessWidget {
  const RoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đăng ký phòng ở'),
        backgroundColor: const Color(0xFF2563EB),
      ),
      body: const Center(
        child: Text(
          'Tab 2: Danh sách & Đăng ký phòng KTX',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}