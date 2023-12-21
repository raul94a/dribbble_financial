import 'package:flutter/material.dart';

class UserCircularAvatar extends StatelessWidget {
  const UserCircularAvatar({super.key, required this.url, this.radius = 20});
  final String url;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: CircleAvatar(
        radius: radius,
        child: Image.network(url),
      ),
    );
  }
}
