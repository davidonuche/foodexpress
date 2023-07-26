import 'package:flutter/material.dart';
import 'package:foodexpress/auth/onboarding_screen.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              buildProfileOption(
                icon: Icons.account_circle,
                title: 'Account',
                onTap: () {
                  // Navigate to the account page
                },
              ),
              buildProfileOption(
                icon: Icons.settings,
                title: 'Settings',
                onTap: () {
                  // Navigate to the settings page
                },
              ),
              buildProfileOption(
                icon: Icons.info,
                title: 'About',
                onTap: () {
                  // Navigate to the about page
                },
              ),
              buildProfileOption(
                icon: Icons.logout,
                title: 'Logout',
                onTap: () {
                   Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OnboardingScreen()),
                );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProfileOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Icon(
              icon,
              size: 24,
              color: Colors.green,
            ),
            SizedBox(width: 16),
            Text(
              title,
              style: TextStyle(fontSize: 18),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
