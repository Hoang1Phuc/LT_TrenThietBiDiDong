import 'dien_thoai.dart';
import 'hoa_don.dart';

class CuaHang {
  String _tenCuaHang;
  String _diaChi;
  List<DienThoai> _danhSachDienThoai = [];
  List<HoaDon> _danhSachHoaDon = [];

  // Constructor
  CuaHang(this._tenCuaHang, this._diaChi);

  // them dt
  void themDienThoai(DienThoai dienThoai) {
    _danhSachDienThoai.add(dienThoai);
    print("Đã thêm điện thoại: ${dienThoai.tenDienThoai}");
  }

  // cap nhat dien thoai
  void capNhatDienThoai(String maDienThoai, double giaBanMoi) {
    for (var dienThoai in _danhSachDienThoai) {
      if (dienThoai.maDienThoai == maDienThoai) {
        dienThoai.giaBan = giaBanMoi;
        print("Đã cập nhật giá bán mới: $giaBanMoi cho điện thoại ${dienThoai.tenDienThoai}");
      }
    }
  }

  //phuong thuc ngung kinh doanh dien thoai
  void ngungKinhDoanhDienThoai(String maDienThoai) {
    for (var dienThoai in _danhSachDienThoai) {
      if (dienThoai.maDienThoai == maDienThoai) {
        dienThoai.trangThai = false;
        print("Điện thoại ${dienThoai.tenDienThoai} đã ngừng kinh doanh");
      }
    }
  }

  // phuong thuc tim kiem dien thoai
  void timKiemDienThoai({String? maDienThoai, String? tenDienThoai, String? hangSanXuat}) {
    var ketQua = _danhSachDienThoai.where((dienThoai) {
      return (maDienThoai != null && dienThoai.maDienThoai.contains(maDienThoai)) ||
             (tenDienThoai != null && dienThoai.tenDienThoai.contains(tenDienThoai)) ||
             (hangSanXuat != null && dienThoai.hangSanXuat.contains(hangSanXuat));
    }).toList();
    
    if (ketQua.isEmpty) {
      print("Không tìm thấy điện thoại");
    } else {
      for (var dienThoai in ketQua) {
        dienThoai.hienThiThongTin();
      }
    }
  }

  //phuong thuc hien thi danh sach dien thoai
  void hienThiDanhSachDienThoai() {
    print("Danh sách điện thoại trong cửa hàng:");
    for (var dienThoai in _danhSachDienThoai) {
      dienThoai.hienThiThongTin();
    }
  }

  // phuong thuc tao hoa don
  void themHoaDon(HoaDon hoaDon) {
    _danhSachHoaDon.add(hoaDon);
    //phuong thuc cap nhat ton kho cua dien thoai sau khi ban 
    hoaDon.dienThoai.soLuongTonKho -= hoaDon.soLuongMua;
    print("Đã tạo hóa đơn: ${hoaDon.maHoaDon} cho khách hàng: ${hoaDon.tenKhachHang}");
  }

  //phuong thuc tim kiem hoa don
  void timKiemHoaDon({String? maHoaDon, DateTime? ngayBan, String? tenKhachHang}) {
    var ketQua = _danhSachHoaDon.where((hoaDon) {
      return (maHoaDon != null && hoaDon.maHoaDon.contains(maHoaDon)) ||
             (ngayBan != null && hoaDon.ngayBan == ngayBan) ||
             (tenKhachHang != null && hoaDon.tenKhachHang.contains(tenKhachHang));
    }).toList();
    
    if (ketQua.isEmpty) {
      print("Không tìm thấy hóa đơn");
    } else {
      for (var hoaDon in ketQua) {
        hoaDon.hienThiThongTin();
      }
    }
  }

  //phuong thuc hien thi danh sach hoa don
  void hienThiDanhSachHoaDon() {
    print("Danh sách hóa đơn:");
    for (var hoaDon in _danhSachHoaDon) {
      hoaDon.hienThiThongTin();
    }
  }

  //phuong thuc tinh tong doanh thu trong khoang thoi gian
  double tinhTongDoanhThu(DateTime tuNgay, DateTime denNgay) {
    double doanhThu = 0;
    for (var hoaDon in _danhSachHoaDon) {
      if (hoaDon.ngayBan.isAfter(tuNgay) && hoaDon.ngayBan.isBefore(denNgay)) {
        doanhThu += hoaDon.tinhTongTien();
      }
    }
    return doanhThu;
  }

  //phuong thuc tinh tong loi nhuan theo khoang thoi
  double tinhTongLoiNhuan(DateTime tuNgay, DateTime denNgay) {
    double loiNhuan = 0;
    for (var hoaDon in _danhSachHoaDon) {
      if (hoaDon.ngayBan.isAfter(tuNgay) && hoaDon.ngayBan.isBefore(denNgay)) {
        loiNhuan += hoaDon.tinhLoiNhuanThucTe();
      }
    }
    return loiNhuan;
  }

  //phuong thuc thong ke top dien thoai ban chay
  void thongKeTopDienThoaiBanChay() {
    Map<String, int> soLuongBanDuoc = {};
    for (var hoaDon in _danhSachHoaDon) {
      if (soLuongBanDuoc.containsKey(hoaDon.dienThoai.tenDienThoai)) {
        soLuongBanDuoc[hoaDon.dienThoai.tenDienThoai] =
            soLuongBanDuoc[hoaDon.dienThoai.tenDienThoai]! + hoaDon.soLuongMua;
      } else {
        soLuongBanDuoc[hoaDon.dienThoai.tenDienThoai] = hoaDon.soLuongMua;
      }
    }

    //phuong thuc sap xep theo so luong ban duoc
    var topBanChay = soLuongBanDuoc.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

  //  print("Top điện thoại bán chạy:");
    for (var entry in topBanChay) {
      print("Điện thoại: ${entry.key}, Số lượng bán: ${entry.value}");
    }
  }

  // Phương thức bao cao ton kho
  void thongKeTonKho() {
   // print("Báo cáo tồn kho:");
    for (var dienThoai in _danhSachDienThoai) {
      print("${dienThoai.tenDienThoai}: ${dienThoai.soLuongTonKho} sản phẩm còn lại");
    }
  }

  //phuong thuc hien thi thong tin cua hang
  void hienThiThongTinCuaHang() {
    print("Cửa hàng: $_tenCuaHang, Địa chỉ: $_diaChi");
    hienThiDanhSachDienThoai();
  }
}
