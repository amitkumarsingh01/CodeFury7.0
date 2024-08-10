import 'package:flutter/material.dart';
import 'package:frontend/pages/chatbot.dart';
import 'package:frontend/pages/feature.dart';
import 'package:frontend/pages/home.dart';
import 'package:frontend/pages/map.dart';
import 'profile_page.dart';


class HomePage extends StatefulWidget {
  final String email;

  HomePage({required this.email});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    HomeCorner(),
    MapPage(),
    Chatbot(),
    Feature(),
    ProfilePage(email: 'aksmlibts@gmail.com'), // Pass email here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Welcome to AKS World")),
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
            icon: Icon(Icons.chat, color: Colors.white),
            label: "Chatbot",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_page, color: Colors.white),
            label: "Contact",
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
