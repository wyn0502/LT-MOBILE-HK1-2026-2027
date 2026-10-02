import 'package:flutter/material.dart';

class Lienhe extends StatelessWidget {
  const Lienhe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Liên Hệ')),
      body: const Center(
        child: Text(
          "Bấm vào nút bên dưới để xem thông tin sinh viên",
          style: TextStyle(fontSize: 16),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink[300], 
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Thông tin Sinh viên'),
              content: const Text('Họ và tên: Đặng Tài\nMã sinh viên: 24107665'), 
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Đóng'),
                ),
              ],
            ),
          );
        },
        child: const Icon(Icons.person),
      ),
    );
  }
}