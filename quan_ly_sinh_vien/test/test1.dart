import '../models/sinh_vien.dart';
import '../models/lop_hoc.dart';

// Test
void main() {
  var sv = SinhVien('Nguyen Van A', 20, 'SV001', 8.5);
  print('Test getter: ${sv.hoTen}');
  sv.hoTen = 'Nguyen Van B';
  print('Sau khi set: ${sv.hoTen}');
  print('Xep loai: ${sv.xepLoai()}');


  var lop = LopHoc('21DTHD5');
  lop.themSinhVien(SinhVien('Nguyen Van A', 20, 'SV001', 8.5));
  lop.themSinhVien(SinhVien('Nguyen Van B', 21, 'SV002', 6.5));
  lop.themSinhVien(SinhVien('Nguyen Van C', 22, 'SV003', 5.5));
  lop.themSinhVien(SinhVien('Nguyen Van F', 23, 'SV004', 4));
  lop.hienThiDanhSach();
  

}