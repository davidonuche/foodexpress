import 'package:flutter/material.dart';
import 'package:foodexpress/view/vendor_details.dart';

class VendorFirstScreen extends StatefulWidget {
  const VendorFirstScreen({Key? key}) : super(key: key);

  @override
  _VendorFirstScreenState createState() => _VendorFirstScreenState();
}

class _VendorFirstScreenState extends State<VendorFirstScreen> {
  String? selectedLocation;
  String? selectedBusinessType;

  final List<String> locations = [
    'Ife-central',
    'mayfair',
    'OUI',
    // Add more locations as needed
  ];
  final List<String> businessTypes = [
    'Restaurant',
    'Bar',
    'Bakery',
    // Add more business types as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Begin a partnership with us now and watch your business flourish",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 5),
            Text(
              "Get your business listed online by filling out the form below with your details",
              style: TextStyle(fontSize: 17),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 30),
            buildDropDown("Your Location", locations, selectedLocation),
            SizedBox(height: 20),
            buildDropDown(
                "Type of Business", businessTypes, selectedBusinessType),
            SizedBox(height: 20),
            buildTextField("Email"),
          ],
        ),
      ),
    );
  }

  Widget buildDropDown(String label, List<String> items, String? selectedItem) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 10),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              value: selectedItem,
              items: items.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  if (label == "Your Location") {
                    selectedLocation = newValue;
                  } else if (label == "Type of Business") {
                    selectedBusinessType = newValue;
                  }
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget buildTextField(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          textAlign: TextAlign.start,
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
              hintText: "Enter $label",
              border: InputBorder.none,
            ),
          ),
        ),
        SizedBox(height: 150),
        Center(
          child: SizedBox(
            width: 350,
            height: 50.0,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VendorDetails()),
                );
              },
              style: ElevatedButton.styleFrom(
                onPrimary: Colors.black,
                primary: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: Text(
                'Continue',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
