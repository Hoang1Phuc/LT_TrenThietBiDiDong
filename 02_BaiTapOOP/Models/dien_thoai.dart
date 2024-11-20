class DienThoai {
  // Thuộc tính private
  String _maDienThoai;
  String _tenDienThoai;
  String _hangSanXuat;
  double _giaNhap;
  double _giaBan;
  int _soLuongTonKho;
  bool _trangThai;

  // Constructor 
  DienThoai(this._maDienThoai, this._tenDienThoai, this._hangSanXuat,
      this._giaNhap, this._giaBan, this._soLuongTonKho, this._trangThai) {
    
    if (!_maDienThoai.startsWith("DT-") || _maDienThoai.isEmpty) {
      throw Exception("Mã điện thoại phải bắt đầu bằng 'DT-' và không được rỗng");
    }
   
    if (_tenDienThoai.isEmpty || _hangSanXuat.isEmpty) {
      throw Exception("Tên điện thoại và hãng sản xuất không được rỗng");
    }

    if (_giaNhap <= 0 || _giaBan <= _giaNhap) {
      throw Exception("Giá nhập phải lớn hơn 0 và giá bán phải lớn hơn giá nhập");
    }
  
    if (_soLuongTonKho < 0) {
      throw Exception("Số lượng tồn kho không được nhỏ hơn 0");
    }
  }

  // Getters
  String get maDienThoai => _maDienThoai;
  String get tenDienThoai => _tenDienThoai;
  String get hangSanXuat => _hangSanXuat;
  double get giaNhap => _giaNhap;
  double get giaBan => _giaBan;
  int get soLuongTonKho => _soLuongTonKho;
  bool get trangThai => _trangThai;

  // Setters với kiem tra hop
  set maDienThoai(String value) {
    if (value.startsWith("DT-") && value.isNotEmpty) {
      _maDienThoai = value;
    } else {
      throw Exception("Mã điện thoại phải bắt đầu bằng 'DT-' và không được rỗng");
    }
  }

  set tenDienThoai(String value) {
    if (value.isNotEmpty) {
      _tenDienThoai = value;
    } else {
      throw Exception("Tên điện thoại không được rỗng");
    }
  }

  set hangSanXuat(String value) {
    if (value.isNotEmpty) {
      _hangSanXuat = value;
    } else {
      throw Exception("Hãng sản xuất không được rỗng");
    }
  }

  set giaNhap(double value) {
    if (value > 0) {
      _giaNhap = value;
    } else {
      throw Exception("Giá nhập phải lớn hơn 0");
    }
  }

  set giaBan(double value) {
    if (value > _giaNhap) {
      _giaBan = value;
    } else {
      throw Exception("Giá bán phải lớn hơn giá nhập");
    }
  }

  set soLuongTonKho(int value) {
    if (value >= 0) {
      _soLuongTonKho = value;
    } else {
      throw Exception("Số lượng tồn kho không được nhỏ hơn 0");
    }
  }

  set trangThai(bool value) => _trangThai = value;

  // Phuong thuc tinh loi nhuan du kien
  double tinhLoiNhuan() => (_giaBan - _giaNhap) * _soLuongTonKho;

  
  void hienThiThongTin() {
    print(
        "Mã: $_maDienThoai, Tên: $_tenDienThoai, Hãng: $_hangSanXuat, Giá nhập: $_giaNhap, Giá bán: $_giaBan, Tồn kho: $_soLuongTonKho, Trạng thái: ${_trangThai ? "Còn kinh doanh" : "Ngừng kinh doanh"}");
  }

  // phuong thuc kiem tra co the ban khong
  bool coTheBan() => _soLuongTonKho > 0 && _trangThai;
}