import 'package:flutter/material.dart';

class Feature extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Text(
          'Welcome to the !',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
