import 'dart:io';
import 'dart:math';

void main() {
  // Khai báo a là nullable
  double? a;

  do {
    stdout.write("Nhập a (a ≠ 0): ");
    String? inputA = stdin.readLineSync();
    if (inputA != null) {
      try {
        a = double.parse(inputA);
        if (a == 0) {
          print("Hệ số a phải khác 0. Vui lòng nhập lại.");
        }
      } catch (e) {
        print("Vui lòng nhập một số thực hợp lệ.");
      }
    }
  } while (a == 0); // Điều kiện để nhập lại nếu a = 0

  // Nhập hệ số b
  double b;
  while (true) {
    stdout.write("Nhập b: ");
    String? inputB = stdin.readLineSync();
    if (inputB != null) {
      try {
        b = double.parse(inputB);
        break;
      } catch (e) {
        print("Vui lòng nhập một số thực hợp lệ.");
      }
    }
  }

  // Nhập hệ số c
  double c;
  while (true) {
    stdout.write("Nhập c: ");
    String? inputC = stdin.readLineSync();
    if (inputC != null) {
      try {
        c = double.parse(inputC);
        break;
      } catch (e) {
        print("Vui lòng nhập một số thực hợp lệ.");
      }
    }
  }

  // Giải phương trình bậc 2
  double delta = b * b - 4 * a! * c; // a! để đảm bảo a không null

  if (delta < 0) {
    print("Phương trình vô nghiệm.");
  } else if (delta == 0) {
    double x = -b / (2 * a!);
    print("Phương trình có nghiệm kép: x = $x");
  } else {
    double x1 = (-b + sqrt(delta)) / (2 * a!);
    double x2 = (-b - sqrt(delta)) / (2 * a!);
    print("Phương trình có hai nghiệm phân biệt: x1 = $x1, x2 = $x2");
  }
}
