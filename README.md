# Báo cáo Thực hành: Ứng dụng Quản lý Ký túc xá

## I. Thiết kế Giao diện & Luồng công việc (Yêu cầu 1 & 2)

**1. Quyết định cấu trúc màn hình & Bottom Navigation Bar**
Dựa trên đặc tả hệ thống và thực thể, nhóm quyết định ứng dụng sẽ bao gồm **3 màn hình chính** được điều hướng qua thanh điều hướng đáy (Bottom Navigation Bar):
* **Trang chủ (Home):** Hiển thị bảng tin và thông báo.
* **Phòng KTX (Rooms):** Quản lý danh sách, sức chứa và thêm/bớt sinh viên.
* **Sinh viên (Students):** Quản lý hồ sơ và trạng thái tài khoản.

**2. Wireframe và Flow of work (Figma)**
* 3 màn hình được thiết kế wireframe và liên kết dạng vòng. Người dùng thao tác nhấn (On tap) vào các tab ở thanh điều hướng đáy để luân chuyển qua lại giữa các màn hình.
  <img width="1141" height="771" alt="image" src="https://github.com/user-attachments/assets/371cc1a2-652f-4381-8206-4358649dc028" />

* **Ảnh minh chứng Wireframe:**
  ![Wireframe Figma]<img width="1364" height="926" alt="Untitled (3)" src="https://github.com/user-attachments/assets/22f1799c-68b2-4293-9baf-3f1c19a3c9d5" />


---

## II. Triển khai Mã nguồn & Minh chứng (Yêu cầu 3 & 4)

**1. Phân công phát triển màn hình**
* **Đặng Tài:** Xây dựng khung `BottomNavigationBar` (`main_navigator.dart`) và màn hình Quản lý Phòng KTX (`room_screen.dart`).
* **Quỳnh:** Xây dựng màn hình Quản lý Sinh viên.

**2. Minh chứng nộp bài (Links & Screenshots)**
* **Ảnh chụp màn hình ứng dụng (App Screenshots):**
  * `[Chèn ảnh chụp màn hình chạy code thực tế khi bấm vào tab Trang chủ]`
  * `[Chèn ảnh chụp màn hình chạy code thực tế khi bấm vào tab Phòng KTX]`
  * `[Chèn ảnh chụp màn hình chạy code thực tế khi bấm vào tab Sinh viên]`
* **Đường dẫn Mã nguồn (Source Code):**
  * Code Khung điều hướng: `lib/screens/main_navigator.dart`
  * Code Màn hình Phòng: `lib/screens/room_screen.dart`
* **Lịch sử Git Commit:** 
  * `[Chèn link URL commit phần giao diện trên GitHub của nhóm]`

---

## III. Đặc tả Lõi Hệ thống (Cấu trúc Đối tượng)

### 1. Giới thiệu tổng quan đối tượng `User`
Trong hệ thống quản lý ký túc xá, đối tượng **`User`** đóng vai trò hạt nhân, đại diện cho người dùng đăng nhập vào ứng dụng di động gồm 2 phân quyền chính:
* **Sinh viên (`student`):** Đăng ký tài khoản, xem/cập nhật hồ sơ cá nhân, nộp hồ sơ xin phòng ký túc xá và theo dõi trạng thái duyệt phòng.
* **Quản trị viên (`admin`):** Quản lý hồ sơ toàn bộ sinh viên, tiếp nhận và tiến hành xét duyệt (`approve`) hoặc từ chối (`reject`) yêu cầu thuê phòng.

Đối tượng `User` được chuẩn hóa bằng ngôn ngữ **Dart**, kế thừa và đồng bộ các ràng buộc dữ liệu từ dịch vụ Backend.

### 2. Sơ đồ thiết kế hệ thống (UML Diagrams)

**Sơ đồ lớp (Class Diagram)**
Mối quan hệ giữa thực thể `User` và phòng ký túc xá `Room`:

```text
+-------------------------------------------------------------+
|                            User                             |
+-------------------------------------------------------------+
| + id: INT                                                   |
| + username: STRING                                          |
| - password: STRING                                          |
| + email: STRING                                             |
| + role: UserRole {student, admin}                           |
| + fullName: STRING                                          |
| + mssv: STRING                                              |
| + phone: STRING                                             |
| + className: STRING                                         |
| + hometown: STRING                                          |
| + cccd: STRING                                              |
| + gender: STRING                                            |
| + roomId: INT                                               |
| + roomStatus: RoomStatus {none, pending, approved, rejected}|
| + pendingRoomId: INT                                        |
| + pendingRoomName: STRING                                   |
+-------------------------------------------------------------+
| + fromJson(json: MAP): User                                 |
| + toJson(): MAP                                             |
| + isAdmin(): BOOLEAN                                        |
| + hasActiveRoom(): BOOLEAN                                  |
+-------------------------------------------------------------+
                            | 0..*
                            |
                     stays in / pending
                            |
                            v 0..1
+-------------------------------------------------------------+
|                            Room                             |
+-------------------------------------------------------------+
| + id: INT                                                   |
| + roomName: STRING                                          |
| + capacity: INT                                             |
| + currentOccupancy: INT                                     |
+-------------------------------------------------------------+
