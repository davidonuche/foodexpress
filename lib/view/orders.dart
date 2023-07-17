import 'package:flutter/material.dart';
import 'package:foodexpress/utils/colors.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(height: 16.0),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text("You have no orders"),
            ],
          ),
        ),
        SizedBox(height: 250),
        Center(
          child: SizedBox(
            width: 350,
            height: 50.0,
            child: ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => OnboardingScreen()),
                // );
              },
              style: ElevatedButton.styleFrom(
                onPrimary: AppColor.black,
                primary: AppColor.success,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: Text(
                'Check restaurants',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
