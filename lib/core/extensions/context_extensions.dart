import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  TextTheme get theme => Theme.of(this).textTheme;
  Size get size => MediaQuery.of(this).size;
}
