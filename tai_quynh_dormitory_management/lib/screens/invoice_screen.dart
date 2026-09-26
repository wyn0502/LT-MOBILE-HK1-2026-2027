import 'package:flutter/material.dart';

class InvoiceScreen extends StatelessWidget {
  const InvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hóa đơn & Thanh toán'),
        backgroundColor: const Color(0xFF2563EB),
      ),
      body: const Center(
        child: Text(
          'Tab 3: Danh sách hóa đơn & VietQR',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}