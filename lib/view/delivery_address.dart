import 'package:flutter/material.dart';
import 'package:foodexpress/common_widgets/bottom_nav.dart';
import 'package:geolocator/geolocator.dart';

class DeliveryAddress extends StatefulWidget {
  @override
  _DeliveryAddressState createState() => _DeliveryAddressState();
}

class _DeliveryAddressState extends State<DeliveryAddress> {
  String currentLocation = '';
  List<String> locations = [
    'Location 1',
    'Location 2',
    'Location 3',
    // Add more locations here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Center(
              child: Text(
                'Delivery Address',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 15),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: IconButton(
                  onPressed: () {
                    getCurrentLocation();
                  },
                  icon: Icon(Icons.search),
                ),
                filled: true,
                fillColor: Colors.grey,
                hintText: 'Enter a new address',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
              onFieldSubmitted: (String value) {
                searchLocation(value);
              },
            ),
            SizedBox(height: 16),
            Text(
              currentLocation,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Expanded(
              child: Container(
                height: 200,
                child: ListView.builder(
                  itemCount: locations.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(locations[index]),
                      onTap: () {
                        setState(() {
                          currentLocation = locations[index];
                        });
                      },
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (currentLocation.isNotEmpty) {
                  String selectedLocation = currentLocation;
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BottomNav(),
                    ),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('Please select a valid location.'),
                        actions: [
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('Proceed'),
            ),
          ],
        ),
      ),
    );
  }

  void getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        currentLocation =
            'Lat: ${position.latitude}, Long: ${position.longitude}';
      });
    } catch (e) {
      print('Error: $e');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Failed to get location.'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  void searchLocation(String value) {
    // Perform search action using the searchQuery value
    print('Search: $value');
    // Implement your location search logic here, such as calling an API
    // and updating the currentLocation variable based on the search results.
    // Example: currentLocation = searchResults.firstWhere((result) => result == value, orElse: () => '');
  }
}
