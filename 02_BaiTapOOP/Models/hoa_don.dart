import 'dart:core';
import 'dien_thoai.dart';
class HoaDon {
  String _maHoaDon;
  DateTime _ngayBan;
  DienThoai _dienThoai;
  int _soLuongMua;
  double _giaBanThucTe;
  String _tenKhachHang;
  String _soDienThoaiKhach;

  // Constructor 
  HoaDon(this._maHoaDon, this._ngayBan, this._dienThoai, this._soLuongMua,
      this._giaBanThucTe, this._tenKhachHang, this._soDienThoaiKhach) {
    if (!_maHoaDon.startsWith("HD-") || _maHoaDon.isEmpty) {
      throw Exception("Mã hóa đơn phải bắt đầu bằng 'HD-' và không được rỗng");
    }
    if (_ngayBan.isAfter(DateTime.now())) {
      throw Exception("Ngày bán không được sau ngày hiện tại");
    }
    if (_soLuongMua <= 0 || _soLuongMua > _dienThoai.soLuongTonKho) {
      throw Exception("Số lượng mua phải lớn hơn 0 và không vượt quá tồn kho");
    }
    if (_giaBanThucTe <= 0) {
      throw Exception("Giá bán thực tế phải lớn hơn 0");
    }
    if (_tenKhachHang.isEmpty || !_soDienThoaiKhach.startsWith("0")) {
      throw Exception("Tên khách hàng không được rỗng và số điện thoại phải đúng định dạng");
    }
  }

  // Getters
  String get maHoaDon => _maHoaDon;
  DateTime get ngayBan => _ngayBan;
  DienThoai get dienThoai => _dienThoai;
  int get soLuongMua => _soLuongMua;
  double get giaBanThucTe => _giaBanThucTe;
  String get tenKhachHang => _tenKhachHang;
  String get soDienThoaiKhach => _soDienThoaiKhach;


  double tinhTongTien() => _giaBanThucTe * _soLuongMua;


  double tinhLoiNhuanThucTe() => (_giaBanThucTe - _dienThoai.giaNhap) * _soLuongMua;

  
  void hienThiThongTin() {
    print(
        "Mã hóa đơn: $_maHoaDon, Ngày bán: $_ngayBan, Tên khách: $_tenKhachHang, Số lượng: $_soLuongMua, Tổng tiền: ${tinhTongTien()}");
  }
}
