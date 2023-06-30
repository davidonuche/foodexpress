import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodexpress/utils/colors.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "asset/svgs/main_logo.svg",
              width: 200,
              height: 300,
            ), // Replace with your own image path

            SizedBox(height: 190),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                onPrimary: AppColor.black,
                primary: AppColor.white,
              ),
              onPressed: () {
                // Handle customer button press
                // You can navigate to the customer-related screen here
              },
              child: Text('Customer sign in'),
            ),

            SizedBox(height: 12),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                onPrimary: AppColor.black,
                primary: AppColor.white,
              ),
              onPressed: () {
                // Handle seller button press
                // You can navigate to the seller-related screen here
              },
              child: Text('Sellers sign in'),
            ),
          ],
        ),
      ),
    );
  }
}
