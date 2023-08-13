import 'package:flutter/material.dart';
import 'package:foodexpress/auth/sign_up_screen.dart';
import 'package:foodexpress/common_widgets/bottom_nav.dart';
import 'package:foodexpress/view/home.dart';

class VendorLastScreen extends StatefulWidget {
  const VendorLastScreen({Key? key}) : super(key: key);

  @override
  _VendorLastScreenState createState() => _VendorLastScreenState();
}

class _VendorLastScreenState extends State<VendorLastScreen> {
  final TextEditingController operatingHoursController =
      TextEditingController();
  final TextEditingController onlineMenuController = TextEditingController();
  final TextEditingController photosController = TextEditingController();
  final TextEditingController specialOffersController = TextEditingController();
  final TextEditingController additionalInfoController =
      TextEditingController();

  @override
  void dispose() {
    operatingHoursController.dispose();
    onlineMenuController.dispose();
    photosController.dispose();
    specialOffersController.dispose();
    additionalInfoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            buildTextField("Operating hours*",
                hintText: "What are your regular operating hours",
                controller: operatingHoursController),
            SizedBox(height: 20),
            buildTextField("Online Menu and Pricing*",
                hintText: "Provide an online menu with pricing information",
                controller: onlineMenuController),
            SizedBox(height: 20),
            buildTextField("Photos*",
                hintText: "Provide photos of your food items",
                controller: photosController),
            SizedBox(height: 20),
            buildTextField("Special Offers or Discounts*",
                hintText:
                    "Are you offering any special promotions or discounts",
                controller: specialOffersController),
            SizedBox(height: 20),
            buildTextField("Additional Information*",
                hintText:
                    "Is there any other information you would like to provide about your food business",
                controller: additionalInfoController,
                maxLines: 5),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Get the values from text fields
                  String operatingHours = operatingHoursController.text;
                  String onlineMenu = onlineMenuController.text;
                  String photos = photosController.text;
                  String specialOffers = specialOffersController.text;
                  String additionalInfo = additionalInfoController.text;

                  // Show a pop-up with the details
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Form Data"),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("Operating Hours: $operatingHours"),
                            Text("Online Menu and Pricing: $onlineMenu"),
                            Text("Photos: $photos"),
                            Text("Special Offers or Discounts: $specialOffers"),
                            Text("Additional Information: $additionalInfo"),
                          ],
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("OK"),
                          ),
                        ],
                      );
                    },
                  );

                  // After 30 seconds, navigate to the home screen
                  Future.delayed(Duration(milliseconds: 2000), () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignUpScreen()));
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  onPrimary: Colors.black,
                  textStyle: TextStyle(fontSize: 18),
                  minimumSize: Size(350, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Submit Form",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label,
      {required String hintText,
      required TextEditingController controller,
      int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey),
          ),
          child: TextField(
            controller: controller,
            maxLines: maxLines,
            decoration: InputDecoration(
              hintText: hintText,
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
