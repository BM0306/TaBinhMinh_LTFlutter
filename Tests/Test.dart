import '../Models/CuaHang.dart';
import '../Models/DienThoai.dart';
import '../Models/HoaDon.dart';

void main() {
  // Tạo đối tượng CuaHang
  CuaHang ch= CuaHang('Cửa Hàng Điện Thoại ABC', '123 Đường A, TP HCM');

  // 1. Tạo và quản lý thông tin điện thoại
  testQuanLyDienThoai(ch);

  // 2. Tạo và quản lý hóa đơn
  //testQuanLyHoaDon(ch);

  // 3. Thống kê báo cáo
  //testThongKeBaoCao(ch);
}

void testQuanLyDienThoai(CuaHang cuaHang) {
  print('=== TEST QUẢN LÝ ĐIỆN THOẠI ===');

  // Thêm điện thoại mới
  try {
    DienThoai dt1 = DienThoai('DT-001', 'iPhone 14', 'Apple', 20000, 25000, 10, true);
    DienThoai dt2 = DienThoai('DT-002', 'Galaxy S22', 'Samsung', 18000, 22000, 15, true);
    cuaHang.themDienThoai(dt1);
    cuaHang.themDienThoai(dt2);
    print('Thêm điện thoại mới thành công.');
  } catch (e) {
    print('Lỗi khi thêm điện thoại: $e');
  }

  // Cập nhật thông tin
  try {
    DienThoai dtCapNhat = DienThoai('DT-001', 'iPhone 14 Pro', 'Apple', 20000, 28000, 8, true);
    cuaHang.capNhatDienThoai('DT-001', dtCapNhat);
    print('Cập nhật thông tin điện thoại thành công.');
  } catch (e) {
    print('Lỗi khi cập nhật điện thoại: $e');
  }

  // Kiểm tra validation
  try {
    DienThoai dtSai = DienThoai('XXX', '', 'Apple', 0, -1000, -5, true);
    cuaHang.themDienThoai(dtSai);
  } catch (e) {
    print('Validation hoạt động đúng: $e');
  }
}
/*
void testQuanLyHoaDon(CuaHang cuaHang) {
  print('=== TEST QUẢN LÝ HÓA ĐƠN ===');

  // Tạo hóa đơn hợp lệ
  try {
    HoaDon hd1 = HoaDon(
      'HD-001',
      DateTime.now(),
      cuaHang._danhSachDienThoai[0],
      2,
      25000,
      'Nguyễn Văn A',
      '0901234567',
    );
    cuaHang.taoHoaDon(hd1);
    print('Tạo hóa đơn hợp lệ thành công.');
  } catch (e) {
    print('Lỗi khi tạo hóa đơn: $e');
  }

  // Kiểm tra ràng buộc tồn kho
  try {
    HoaDon hd2 = HoaDon(
      'HD-002',
      DateTime.now(),
      cuaHang._danhSachDienThoai[0],
      20, // Số lượng mua vượt tồn kho
      25000,
      'Nguyễn Văn B',
      '0907654321',
    );
    cuaHang.taoHoaDon(hd2);
  } catch (e) {
    print('Ràng buộc tồn kho hoạt động đúng: $e');
  }

  // Tính toán tiền và lợi nhuận
  print('Tính toán tiền và lợi nhuận cho hóa đơn:');
  for (var hoaDon in CuaHang._danhSachHoaDon) {
    print('Tổng tiền: ${hoaDon.tinhTongTien()}, Lợi nhuận: ${hoaDon.tinhLoiNhuanThucTe()}');
  }
}

void testThongKeBaoCao(CuaHang cuaHang) {
  print('=== TEST THỐNG KÊ BÁO CÁO ===');

  // Doanh thu theo thời gian
  try {
    DateTime tuNgay = DateTime.now().subtract(Duration(days: 30));
    DateTime denNgay = DateTime.now();
    double doanhThu = cuaHang.tongDoanhThu(tuNgay, denNgay);
    print('Doanh thu từ $tuNgay đến $denNgay: $doanhThu');
  } catch (e) {
    print('Lỗi khi thống kê doanh thu: $e');
  }

  // Top bán chạy
  print('Thống kê top điện thoại bán chạy:');
  Map<String, int> thongKeBanChay = {};
  for (var hoaDon in cuaHang._danhSachHoaDon) {
    String tenDt = hoaDon._dienThoai.tenDienThoai;
//    thongKeBanChay[tenDt] = (thongKeBanChay[tenDt] ?? 0) + hoaDon._soLuongMua;
  }
  thongKeBanChay.entries
      .toList()
      .sort((a, b) => b.value.compareTo(a.value));
  for (var entry in thongKeBanChay.entries) {
    print('${entry.key}: ${entry.value} sản phẩm');
  }

  // Báo cáo tồn kho
  print('Báo cáo tồn kho:');
  for (var dienThoai in cuaHang._danhSachDienThoai) {
    print('${dienThoai.tenDienThoai}: ${dienThoai.soLuongTonKho} sản phẩm');
  }
*/
