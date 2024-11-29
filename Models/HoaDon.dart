import 'DienThoai.dart';

class HoaDon {
  // Thuộc tính private
  String _maHoaDon;
  DateTime _ngayBan;
  DienThoai _dienThoai;
  int _soLuongMua;
  double _giaBanThucTe;
  String _tenKhachHang;
  String _soDienThoaiKhach;

  // Constructor đầy đủ tham số
  HoaDon(
    this._maHoaDon,
    this._ngayBan,
    this._dienThoai,
    this._soLuongMua,
    this._giaBanThucTe,
    this._tenKhachHang,
    this._soDienThoaiKhach,
  ) {
    maHoaDon = _maHoaDon;
    ngayBan = _ngayBan;
    soLuongMua = _soLuongMua;
    giaBanThucTe = _giaBanThucTe;
    tenKhachHang = _tenKhachHang;
    soDienThoaiKhach = _soDienThoaiKhach;
  }

  // Getter và Setter với validation
  String get maHoaDon => _maHoaDon;
  set maHoaDon(String value) {
    if (value.isEmpty || !RegExp(r'^HD-\d{3}$').hasMatch(value)) {
      throw ArgumentError('Mã hóa đơn phải có định dạng "HD-XXX".');
    }
    _maHoaDon = value;
  }

  DateTime get ngayBan => _ngayBan;
  set ngayBan(DateTime value) {
    if (value.isAfter(DateTime.now())) {
      throw ArgumentError('Ngày bán không được sau ngày hiện tại.');
    }
    _ngayBan = value;
  }

  int get soLuongMua => _soLuongMua;
  set soLuongMua(int value) {
    if (value <= 0 || value > _dienThoai.soLuongTonKho) {
      throw ArgumentError(
          'Số lượng mua phải lớn hơn 0 và không vượt quá tồn kho (${_dienThoai.soLuongTonKho}).');
    }
    _soLuongMua = value;
    _dienThoai.soLuongTonKho -= value; // Cập nhật tồn kho
  }

  double get giaBanThucTe => _giaBanThucTe;
  set giaBanThucTe(double value) {
    if (value <= 0) {
      throw ArgumentError('Giá bán thực tế phải lớn hơn 0.');
    }
    _giaBanThucTe = value;
  }

  String get tenKhachHang => _tenKhachHang;
  set tenKhachHang(String value) {
    if (value.isEmpty) {
      throw ArgumentError('Tên khách hàng không được để trống.');
    }
    _tenKhachHang = value;
  }

  String get soDienThoaiKhach => _soDienThoaiKhach;
  set soDienThoaiKhach(String value) {
    if (!RegExp(r'^\d{10}$').hasMatch(value)) {
      throw ArgumentError('Số điện thoại khách phải là 10 chữ số.');
    }
    _soDienThoaiKhach = value;
  }

  // Phương thức tính tổng tiền
  double tinhTongTien() => _giaBanThucTe * _soLuongMua;

  // Phương thức tính lợi nhuận thực tế
  double tinhLoiNhuanThucTe() => (_giaBanThucTe - _dienThoai.giaNhap) * _soLuongMua;

  // Phương thức hiển thị thông tin hóa đơn
  void hienThiThongTin() {
    print(
        'Mã hóa đơn: $_maHoaDon, Ngày bán: $_ngayBan, Khách hàng: $_tenKhachHang, Số ĐT: $_soDienThoaiKhach, Tổng tiền: ${tinhTongTien()}, Lợi nhuận: ${tinhLoiNhuanThucTe()}');
  }
}