import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

bool get isLandscape => Device.orientation == Orientation.portrait;

extension ThemeEXT on BuildContext {
  TextTheme get theme => Theme.of(this).textTheme;
}