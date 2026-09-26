import 'package:flutter/material.dart';
import '../models/room.dart'; // Import đối tượng Room đã có sẵn trong dự án

class RoomScreen extends StatefulWidget {
  const RoomScreen({super.key});

  @override
  State<RoomScreen> createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  // Khởi tạo dữ liệu mẫu
  final Room testRoom = Room(
    buildingId: "Tòa A",
    name: "101",
    capacity: 4,
    currentOccupancy: 3,
    roomType: "Tiêu chuẩn",
    fixedPrice: 1500000,
  );

  void _addStudent() {
    setState(() {
      if (!testRoom.addOccupant()) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Thất bại: Phòng đã đạt tối đa sức chứa!')),
        );
      }
    });
  }

  void _removeStudent() {
    setState(() {
      if (!testRoom.removeOccupant()) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Thất bại: Phòng hiện đang trống!')),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quản lý Phòng KTX')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          child: ListTile(
            leading: const Icon(Icons.meeting_room, size: 40, color: Colors.blue),
            title: Text('Phòng: ${testRoom.name} - ${testRoom.buildingId}', style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('Loại: ${testRoom.roomType}\nSĩ số: ${testRoom.currentOccupancy}/${testRoom.capacity}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(icon: const Icon(Icons.remove_circle, color: Colors.red), onPressed: _removeStudent),
                IconButton(icon: const Icon(Icons.add_circle, color: Colors.green), onPressed: _addStudent),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
