import 'package:flutter/material.dart';



extension ThemeEXT on BuildContext {
  TextTheme get theme => Theme.of(this).textTheme;
}