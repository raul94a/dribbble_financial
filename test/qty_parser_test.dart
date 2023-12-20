import 'package:flutter_test/flutter_test.dart';

int getDots(int qty) {
  var length = qty.toString().length;
  int dots = length ~/ 3;
  dots = length ~/ 3;
  if (length % 3 == 0) {
    --dots;
  }
  return dots;
}

String parseQty(int qty) {
  
  final qtyStr = qty.toString();

  final length = qtyStr.length;
  final start = length - 1;
  const end = 0;
  var control = 1;
  var newStr = '';
  for (var i = start; i >= end; i--) {
    final char = qtyStr[i];
    newStr = char + newStr;
    if (control % 3 == 0 && i > 0) {
      newStr = '.$newStr';
    }
    control++;
  }
  return newStr;
}

void main() {
  test('Test for parsing numbers with dots', () {
    var qty = 10;
    final parsedQty = parseQty(qty);
    print(parsedQty);
  });
}
