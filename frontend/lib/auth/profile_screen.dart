import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class ProfileScreen extends StatelessWidget {
  Future<Map<String, dynamic>> _getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString('user');
    return jsonDecode(userJson!);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getUserData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasData) {
          var user = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(user['profile_photo'] ?? ''),
                ),
                SizedBox(height: 16),
                Text('Name: ${user['name']}', style: TextStyle(color: Colors.white)),
                Text('Email: ${user['email']}', style: TextStyle(color: Colors.white)),
                Text('Phone: ${user['phone']}', style: TextStyle(color: Colors.white)),
                ElevatedButton(
                  onPressed: () async {
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    prefs.clear();
                    Navigator.of(context).pushReplacementNamed('/login');
                  },
                  child: Text('Logout'),
                ),
              ],
            ),
          );
        }

        return Center(child: Text('Error loading profile', style: TextStyle(color: Colors.white)));
      },
    );
  }
}
