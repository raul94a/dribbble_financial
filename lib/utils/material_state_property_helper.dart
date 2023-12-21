import 'package:flutter/material.dart';

MaterialStateProperty<T> getProperty<T>(T obj) {
  return MaterialStateProperty.resolveWith((states) => obj);
}
