import 'package:flutter/material.dart';
import 'package:foodexpress/view/vendor_last_screen.dart';

class VendorDetails extends StatelessWidget {
  const VendorDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Vendor Details",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Please furnish your essential details in this section to finalize the registration process",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 30),
            buildTextField("Business name*"),
            SizedBox(height: 20),
            buildContactInfo(),
            SizedBox(height: 20),
            buildTextField("Business address*",
                hintText: 'Physical location of your food business'),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Menu*",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Container(
                  height: 100,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText:
                          "Provide a brief description of your menu items",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            buildTextField("Business License*",
                hintText: 'Please provide your license number'),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => VendorLastScreen()),
                  );
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
                  "Continue",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContactInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Contact Information*",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        buildTextField("", hintText: 'Full name'),
        SizedBox(height: 10),
        buildTextField("", hintText: 'Email address'),
        SizedBox(height: 10),
        buildTextField("", hintText: 'Phone number'),
      ],
    );
  }

  Widget buildTextField(String label, {String hintText = ''}) {
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
