import 'package:flutter/material.dart';
import 'package:society_management_projecct/Screen/community_screen.dart';
import 'package:society_management_projecct/Screen/dashboard_screen.dart';
import 'package:society_management_projecct/Screen/service_screen.dart';
import 'package:society_management_projecct/Screen/update_screen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int Index = 0;
  List Pages = [
    DashboardScreen(),
    UpdateScreen(),
    ServiceScreen(),
    CommunityScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Pages[Index],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: Index,
          onTap: (value) {
            Index = value;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
                backgroundColor: Colors.blue,
                icon: Icon(Icons.home),
                label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.update),
              label: 'Updates',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.build),
              label: 'Services',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Community',
            ),
          ]),
    );
  }
}
