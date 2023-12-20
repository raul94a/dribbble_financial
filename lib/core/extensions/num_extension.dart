extension DottedQty on int {
  String toStringDotted() {
    final qtyStr = toString();
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
}
