import 'package:flutter/material.dart';
import 'home_page.dart';

class LoginRegisterPage extends StatefulWidget {
  @override
  _LoginRegisterPageState createState() => _LoginRegisterPageState();
}

class _LoginRegisterPageState extends State<LoginRegisterPage> {
  bool isLogin = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  void toggleForm() {
    setState(() {
      isLogin = !isLogin;
    });
  }

  void login() {
    String email = _emailController.text;
    String password = _passwordController.text;

    if ((email == 'aksmlibts@gmail.com' || email == 'aksdsce@gmail.com') && password == '12345') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage(email: email)),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Flask server disconnected'),
        backgroundColor: Colors.red,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isLogin ? 'Login' : 'Register'),
        actions: [
          TextButton(
            onPressed: toggleForm,
            child: Text(
              isLogin ? 'Register' : 'Login',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.white, // Dark background for login
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Center(
              child: Image.asset(
                'assets/logo.jpeg', // Make sure this path is correct
                width: 350,
                height: 350,
              ),
            ),
            SizedBox(height: 20),
            if (!isLogin)
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name', labelStyle: TextStyle(color: Colors.black)),
                style: TextStyle(color: Colors.black),
              ),
            if (!isLogin)
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: 'Phone Number', labelStyle: TextStyle(color: Colors.black)),
                style: TextStyle(color: Colors.black),
              ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email', labelStyle: TextStyle(color: Colors.black)),
              style: TextStyle(color: Colors.black),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password', labelStyle: TextStyle(color: Colors.black)),
              obscureText: true,
              style: TextStyle(color: Colors.black),
            ),
            if (!isLogin)
              TextField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(labelText: 'Confirm Password', labelStyle: TextStyle(color: Colors.black)),
                obscureText: true,
                style: TextStyle(color: Colors.black),
              ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: isLogin ? login : () {},
              child: Text(isLogin ? 'Login' : 'Register'),
            ),
          ],
        ),
      ),
    );
  }
}
