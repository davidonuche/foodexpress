import 'package:flutter/material.dart';

class CustomerSignInScreen extends StatefulWidget {
  @override
  _CustomerSignInScreenState createState() => _CustomerSignInScreenState();
}

class _CustomerSignInScreenState extends State<CustomerSignInScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Sign In'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                // Handle sign-in button press
                String email = _emailController.text;
                String password = _passwordController.text;
                // Perform sign-in validation or authentication here
              },
              child: Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
