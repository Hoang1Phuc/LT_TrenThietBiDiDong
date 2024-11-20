import '../models/dien_thoai.dart';
import '../models/hoa_don.dart';
import '../models/cua_hang.dart';


void main() {
  // 1. Tao va quan ly thong tin dien thoai
  print("===== Quản lý thông tin điện thoại =====");

  // khoi tao
  DienThoai dt1 = DienThoai("DT-001", "iPhone 14", "Apple", 800.0, 1000.0, 10, true);
  DienThoai dt2 = DienThoai("DT-002", "Galaxy S23", "Samsung", 700.0, 900.0, 5, true);

  // tao doi tuong cua hang
  CuaHang cuaHang = CuaHang("Cửa Hàng Điện Thoại A", "123 Đường ABC");

  // Them dien thoai moi
  cuaHang.themDienThoai(dt1);
  cuaHang.themDienThoai(dt2);

  // hien thi danh sach dien thoai
  print("\nDanh sách điện thoại ban đầu:");
  cuaHang.hienThiDanhSachDienThoai();

  // cap nhat dien thoai
  print("\nCập nhật thông tin điện thoại:");
  cuaHang.capNhatDienThoai("DT-001", 1100.0); // Cập nhật giá bán của dt1
  cuaHang.hienThiDanhSachDienThoai();

  // Kiem tra validation
  try {
    DienThoai dtInvalid = DienThoai("", "Invalid Phone", "Invalid Brand", -500.0, 400.0, -5, true);
  } catch (e) {
    print("\nValidation Error: $e");
  }

  // 2. tao va quan ly hoa don
  print("\n===== Quản lý hóa đơn =====");

  // Tao hoa don hop le
  HoaDon hoaDon1 = HoaDon("HD-001", DateTime.now(), dt1, 2, 1100.0, "Nguyễn Văn B", "0901234567");
  cuaHang.themHoaDon(hoaDon1);

  //  Tao hoa don voi cac rang buoc kiem tra ton kho va validation
  try {
    HoaDon hoaDonInvalid = HoaDon("HD-002", DateTime.now().add(Duration(days: 1)), dt2, 6, 850.0, "Trần Văn C", "1234");
  } catch (e) {
    print("\nValidation Error: $e");
  }

  // Hien thi danh sach hoa don
  print("\nDanh sách hóa đơn sau khi tạo:");
  cuaHang.hienThiDanhSachHoaDon();

  // Tinh toan tien va loi nhuan
  double doanhThu = hoaDon1.tinhTongTien();
  double loiNhuan = hoaDon1.tinhLoiNhuanThucTe();
  print("\nDoanh thu hóa đơn 1: \$${doanhThu}");
  print("Lợi nhuận hóa đơn 1: \$${loiNhuan}");

  // 3.  Thong ke bao bao
  print("\n=====************** Thống kê báo cáo **************=====");

  // Thong ke doanh thu va loi nhuan theo thoi gian
  double doanhThuThang = cuaHang.tinhTongDoanhThu(DateTime.now().subtract(Duration(days: 30)), DateTime.now());
  double loiNhuanThang = cuaHang.tinhTongLoiNhuan(DateTime.now().subtract(Duration(days: 30)), DateTime.now());
  print("\nDoanh thu tháng này: \$${doanhThuThang}");
  print("Lợi nhuận tháng này: \$${loiNhuanThang}");

  // Thong ke top dien thoai ban chay
  print("\nTop điện thoại bán chạy:");
  cuaHang.thongKeTopDienThoaiBanChay();

  // Bao cao ton kho
  print("\nBáo cáo tồn kho:");
  cuaHang.thongKeTonKho();
print("\n=====**************KET**************=====");
}
