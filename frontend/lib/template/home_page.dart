import 'package:flutter/material.dart';
import 'package:frontend/main/donate.dart';
import 'package:frontend/pages/chatbot.dart';
import 'package:frontend/pages/feature.dart';
import 'package:frontend/pages/home.dart';
import 'package:frontend/pages/map.dart';
import 'profile_page.dart';
import '../notification_service.dart'; // Import notification service

class HomePage extends StatefulWidget {
  final String email;
  final NotificationService notificationService; // Add this line

  HomePage({required this.email, required this.notificationService}); // Update constructor

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      HomeCorner(),
      WebPage(url: 'https://maps.app.goo.gl/NjDtq5Be4NBCLpi9A'),
      DonatePage(),
      Feature(),
      ProfilePage(email: widget.email, notificationService: widget.notificationService), // Pass email and notificationService here
    ];

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Alert 360")),
        backgroundColor: Colors.black,
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map, color: Colors.white),
            label: "Map",
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: 75,
              width: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Icon(
                Icons.chat,
                color: Colors.black,
              ),
            ),
            label: "Support",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_page, color: Colors.white),
            label: "Status",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.white),
            label: "Profile",
          ),
        ],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.black,
      ),
    );
  }
}
