import 'package:flutter/material.dart';
import 'package:foodexpress/view/country_kitchen.dart';
import 'package:foodexpress/view/dishes.dart';
import 'package:foodexpress/view/restaurant.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.search),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Restaurant, groceries, dishes',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                  onFieldSubmitted: (String value) {
                    // Perform search action here
                    print('Search: $value');
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          Row(
            children: [
              SizedBox(width: 16.0),
              Text(
                'Restaurants',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 200),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Restaurant(),
                      ),
                    );
                  },
                  child: Text(
                    "View more",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 24,
              left: 24,
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CountryKitchen(),
                  ),
                );
              },
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: Colors.grey,
                    width: 4,
                  ),
                  image: DecorationImage(
                    image: AssetImage("asset/imgs/country_k.png"),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 16.0),
          Row(
            children: [
              SizedBox(width: 16.0),
              Text(
                'Dishes',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 200),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Dishes(),
                      ),
                    );
                  },
                  child: Text(
                    "View more",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ))
            ],
          ),
          Expanded(
            child: Stack(
              children: [
                GridView.count(
                  crossAxisCount: 2,
                  padding: EdgeInsets.all(16.0),
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  children: [
                    _buildMedicationCard(
                        context, 'Jollof rice', 'asset/imgs/jollof_rice.png'),
                    _buildMedicationCard(
                        context, 'Peppersoup', 'asset/imgs/peppersoup.png'),
                    _buildMedicationCard(
                        context, 'Akara', 'asset/imgs/akara.jpg'),
                    _buildMedicationCard(
                        context, 'Agege', 'asset/imgs/Agege.jpeg'),
                    _buildMedicationCard(
                        context, 'Asun', 'asset/imgs/asun.jpg'),
                    _buildMedicationCard(
                        context, 'Asaro', 'asset/imgs/asaro.jpg'),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 247, 235, 131),
              image: DecorationImage(
                image: AssetImage("asset/imgs/promo.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMedicationCard(
      BuildContext context, String name, String imageUrl) {
    return Card(
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              imageUrl,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: Text(name,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                )),
          ),
        ],
      ),
    );
  }
}
