import 'package:flutter/material.dart';

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
                  onPressed: () {},
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
                    _buildMedicationCard(context, 'Country Kitchen',
                        'asset/imgs/country_kitchen.png'),
                    _buildMedicationCard(
                        context, 'Mr biggs', 'asset/imgs/mr_biggs.png'),
                    _buildMedicationCard(
                        context, 'Jollof rice', 'asset/imgs/jollof_rice.png'),
                    _buildMedicationCard(
                        context, 'Peppersoup', 'asset/imgs/peppersoup.png'),
                  ],
                ),
              ],
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
