import 'package:flutter/material.dart';
import 'screens/TrangChu.dart';
import 'screens/Noidung.dart';
import 'screens/Lienhe.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // Sửa cú pháp super.key thành dạng cũ
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Thi Giữa Kỳ',
      theme: ThemeData(
        primaryColor: Colors.pink[100],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.pink[100],
          foregroundColor: Colors.black,
        ),
        // Thay colorScheme.fromSeed bằng primarySwatch cho tương thích bản cũ
        primarySwatch: Colors.pink, 
      ),
      home: const MainNavigator(),
    );
  }
}

class MainNavigator extends StatefulWidget {
  // Sửa cú pháp super.key
  const MainNavigator({Key? key}) : super(key: key);

  @override
  State<MainNavigator> createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const TrangChu(),
    const Noidung(),
    const Lienhe(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.pink[100], 
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Trang chủ'),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: 'Nội dung'),
          BottomNavigationBarItem(icon: Icon(Icons.contact_mail), label: 'Liên hệ'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.pink[900], 
        onTap: _onItemTapped,
      ),
    );
  }
}