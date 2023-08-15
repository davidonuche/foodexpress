import 'package:flutter/material.dart';
import 'package:foodexpress/view/jollof_rice.dart';
import 'package:foodexpress/view/pepper_soup.dart';

class CountryKitchen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Country Kitchen',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 200,
              child: Image.asset(
                'asset/imgs/country_k.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Country Kitchen Ile-Ife',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text('Min order # 3,000'),
                Spacer(
                  flex: 8,
                ),
                Text('Delivery fee # 1,500'),
                Spacer(),
              ],
            ),
            SizedBox(height: 16),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => JollofRice(
                          foodName: 'Jollof rice',
                          price: 300,
                          imagePath: 'asset/imgs/jollof_rice.png',
                        ),
                      ),
                    );
                  },
                  child: _buildFoodItem(
                      'Jollof rice', '#3,200', 'asset/imgs/jellof.png'),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => JollofRice(
                          foodName: 'Jollof rice',
                          price: 300,
                          imagePath: 'asset/imgs/jollof_rice.png',
                        ),
                      ),
                    );
                  },
                  child: _buildFoodItem(
                      'Fried chicken', '#2,500', 'asset/imgs/amala.png'),
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => JollofRice(
                            foodName: 'Jollof rice',
                            price: 300,
                            imagePath: 'asset/imgs/jollof_rice.png',
                          ),
                        ),
                      );
                    },
                    child: _buildFoodItem(
                        'Plantain', '#1,000', 'asset/imgs/spag.png')),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => JollofRice(
                          foodName: 'Jollof rice',
                          price: 300,
                          imagePath: 'asset/imgs/jollof_rice.png',
                        ),
                      ),
                    );
                  },
                  child: _buildFoodItem(
                      'Pounded yam', '#2,800', 'asset/imgs/jellof.png'),
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => JollofRice(
                            foodName: 'Jollof rice',
                            price: 300,
                            imagePath: 'asset/imgs/jollof_rice.png',
                          ),
                        ),
                      );
                    },
                    child: _buildFoodItem(
                        'Efo riro', '#2,700', 'asset/imgs/amala.png')),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PepperSoup(
                            foodName: 'Pepper Soup',
                            price: 300,
                            imagePath: 'asset/imgs/peppersoup.png',
                          ),
                        ),
                      );
                    },
                    child: _buildFoodItem(
                        'Pepper soup', '#2,000', 'asset/imgs/spag.png')),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFoodItem(String foodName, String price, String imageAssetPath) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Container(
            width: 99,
            height: 77,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imageAssetPath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                foodName,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(price),
            ],
          ),
        ],
      ),
    );
  }
}
