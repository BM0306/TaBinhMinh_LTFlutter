import 'DienThoai.dart';
import 'HoaDon.dart';

class CuaHang {
  String _tenCuaHang;
  String _diaChi;
  List<DienThoai> _danhSachDienThoai = [];
  List<HoaDon> _danhSachHoaDon = [];

  CuaHang(this._tenCuaHang, this._diaChi);

  // Phương thức quản lý điện thoại
  void themDienThoai(DienThoai dt) => _danhSachDienThoai.add(dt);

  void capNhatDienThoai(String ma, DienThoai dtCapNhat) {
    for (var dt in _danhSachDienThoai) {
      if (dt.maDienThoai == ma) {
        dt = dtCapNhat;
        return;
      }
    }
    print('Không tìm thấy điện thoại với mã $ma.');
  }

  void ngungKinhDoanh(String ma) {
    for (var dt in _danhSachDienThoai) {
      if (dt.maDienThoai == ma) {
        dt.trangThai = false;
        return;
      }
    }
    print('Không tìm thấy điện thoại với mã $ma.');
  }

  // Phương thức quản lý hóa đơn
  void taoHoaDon(HoaDon hd) {
    _danhSachHoaDon.add(hd);
    print('Hóa đơn mới đã được tạo.');
  }

  void hienThiDanhSachHoaDon() {
    for (var hd in _danhSachHoaDon) {
      hd.hienThiThongTin();
    }
  }

  // Phương thức thống kê
  double tongDoanhThu(DateTime tuNgay, DateTime denNgay) {
    double tong = 0;
    for (var hd in _danhSachHoaDon) {
      if (hd.ngayBan.isAfter(tuNgay) && hd.ngayBan.isBefore(denNgay)) {
        tong += hd.tinhTongTien();
      }
    }
    return tong;
  }
}