import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:foodexpress/auth/signup_screen.dart';
import 'package:foodexpress/view/vendor_first_screen.dart';
import 'login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List<String> title = [
    "Tap a button,\nget your meal",
    "Get quality meal\npicked with care ",
    "Eat with confidence,from your favorite restaurant",
  ];
  List<String> subtitle = [
    "Get your meal delivered or ready for  pickup-\nand spend time on what matters.",
    "Pick the highest quality meal.\nThat’s our 100% quality promise",
    "We care about your health that’s why we\nmake sure you get the best meal.",
  ];
  List<String> image = [
    "asset/imgs/1ob.png",
    "asset/imgs/2ob.png",
    "asset/imgs/3ob.png",
  ];
  int _currentPageIndex = 0;

  Widget _buildOnboardingScreen(int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          image[index],
          width: 300,
          height: 300,
        ),
        SizedBox(height: 10),
        Text(
          title[index],
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        Text(
          subtitle[index],
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildPageIndicator() {
    List<Widget> indicators = [];

    for (int i = 0; i < image.length; i++) {
      indicators.add(
        Container(
          width: 10,
          height: 10,
          margin: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentPageIndex == i ? Colors.green : Colors.black,
          ),
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: _currentPageIndex > 0
              ? () {
                  setState(() {
                    _currentPageIndex--;
                  });
                }
              : null,
        ),
        Row(children: indicators),
        IconButton(
          icon: Icon(Icons.arrow_forward),
          onPressed: _currentPageIndex < image.length - 1
              ? () {
                  setState(() {
                    _currentPageIndex++;
                  });
                }
              : () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => LoginScreen()),
                  // );
                },
        ),
      ],
    );
  }

  Widget _buildButtonBar() {
    return Column(
      children: [
        ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.grey),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
              ),
              onPressed: () {
                // Handle Sign Up button press
              },
              child: Text(
                "Log in",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignupScreen()),
                );
              },
              child: Text(
                "Sign Up",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10), // Add spacing between buttons and text
        Center(
          child: Text.rich(
            TextSpan(
              text: "Not looking for meal? ",
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
              ),
              children: [
                TextSpan(
                  text: "Become a vendor",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VendorFirstScreen()),
                      );
                    },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildOnboardingScreen(_currentPageIndex),
            SizedBox(height: 50),
            _buildPageIndicator(),
            Spacer(),
            _buildButtonBar(),
          ],
        ),
      ),
    );
  }
}
