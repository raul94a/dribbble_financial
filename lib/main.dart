import 'package:dribbble_financial/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MaterialApp(
          theme: theme,
          debugShowCheckedModeBanner: false,
          home: const Dashboard());
    });
  }
}
 const Color selectedColor = Color.fromARGB(255, 221, 208, 243);
final theme = ThemeData.light(
  useMaterial3: true,
).copyWith(
    navigationBarTheme: const NavigationBarThemeData(
      backgroundColor: Color.fromARGB(255, 26, 26, 26),
      elevation: 0.0,
      indicatorColor: selectedColor
     
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 0.0,
        selectedItemColor: Colors.white,
        unselectedItemColor: Color.fromARGB(255, 241, 239, 239),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Color.fromARGB(255, 26, 26, 26)),
    textTheme: const TextTheme(
      bodySmall:
          TextStyle(fontFamily: 'Euclid A', color: Colors.black, fontSize: 12),
      bodyMedium:
          TextStyle(fontFamily: 'Euclid A', color: Colors.black, fontSize: 14),
      bodyLarge:
          TextStyle(fontFamily: 'Euclid A', color: Colors.black, fontSize: 16),
      titleLarge: TextStyle(
          fontFamily: 'Euclid A',
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold),
      titleMedium: TextStyle(
          fontFamily: 'Euclid A',
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold),
      titleSmall: TextStyle(
          fontFamily: 'Euclid A',
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.bold),
    ));
