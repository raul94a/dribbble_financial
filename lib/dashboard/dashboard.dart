// ignore_for_file: prefer_const_constructors

import 'package:dribbble_financial/resume/resume_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int selectedIndex = 2;
  void onTapNavigationBar(int index) => setState(() {
        selectedIndex = index;
      });
  final body = <Widget>[];
  @override
  void initState() {
    super.initState();
    final sizedBox = SizedBox();
    body.addAll([sizedBox, sizedBox, ResumeScreen(), sizedBox]);
  }
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark),
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            selectedIndex: selectedIndex,
            onTapNavigationBar: onTapNavigationBar),
        body: body[selectedIndex]
      ),
    );
  }
}


class BottomNavigationBar extends StatelessWidget {
  const BottomNavigationBar(
      {super.key,
      required this.selectedIndex,
      required this.onTapNavigationBar});
  final int selectedIndex;
  final Function(int) onTapNavigationBar;
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: onTapNavigationBar,
      selectedIndex: selectedIndex,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      destinations: [
        NavigationDestination(icon: Icon(Icons.home_outlined), label: ''),
        NavigationDestination(icon: Icon(Icons.cases_outlined), label: ''),
        NavigationDestination(
            icon: Icon(Icons.insert_chart_outlined), label: ''),
        NavigationDestination(icon: Icon(Icons.settings_outlined), label: ''),
        NavigationDestination(
            enabled: false,
            icon: ClipOval(
              child: CircleAvatar(
                child: Image.network(
                    'https://randomuser.me/api/portraits/women/54.jpg'),
              ),
            ),
            label: ''),
      ],
      backgroundColor: Colors.black,
    );
  }
}
// BottomNavigationBar(
//           elevation: 10,
//           backgroundColor:Theme.of(context).bottomNavigationBarTheme.backgroundColor ,
//           items: [
//           BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
//           BottomNavigationBarItem(icon: Icon(Icons.cases_outlined), label: ''),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.insert_chart_outlined), label: ''),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.settings_outlined), label: ''),
//           BottomNavigationBarItem(
//               icon: ClipOval(
                
//                 child: CircleAvatar(
//                   child: Image.network(
//                       'https://randomuser.me/api/portraits/women/54.jpg'),
//                 ),
//               ),
//               label: ''),
//         ])