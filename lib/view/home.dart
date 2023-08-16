import 'dart:math';

import 'package:flutter/material.dart';
import 'package:foodexpress/service/cart_model.dart';
import 'package:foodexpress/service/cart_service.dart';
import 'package:foodexpress/view/agege.dart';
import 'package:foodexpress/view/akara.dart';
import 'package:foodexpress/view/asaro.dart';
import 'package:foodexpress/view/asun.dart';
import 'package:foodexpress/view/cart_screen.dart';
import 'package:foodexpress/view/country_kitchen.dart';
import 'package:foodexpress/view/dishes.dart';
import 'package:foodexpress/view/jollof_rice.dart';
import 'package:foodexpress/view/pepper_soup.dart';
import 'package:foodexpress/view/promo.dart';
import 'package:foodexpress/view/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_screen.dart';

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
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
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
                ),
                SizedBox(
                  width: 10,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CartScreen(),
                      ),
                    );
                  },
                  icon: Stack(
                    children: [
                      Icon(
                        Icons.add_shopping_cart,
                        size: 26,
                        color: Colors.black,
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                          //child: Text(
                          // '${cartProvider.cartItems.length}',
                          // style: TextStyle(
                          //   color: Colors.white,
                          //   fontSize: 12,
                          //   fontWeight: FontWeight.bold,
                          // ),
                          //),
                        ),
                      ),
                    ],
                  ),
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
                      child: _buildMedicationCard(
                          context, 'Jollof rice', 'asset/imgs/jollof_rice.png'),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PepperSoup(
                              foodName: 'Peppersoup',
                              price: 300,
                              imagePath: 'asset/imgs/asset/imgs/peppersoup.png',
                            ),
                          ),
                        );
                      },
                      child: _buildMedicationCard(
                          context, 'Peppersoup', 'asset/imgs/peppersoup.png'),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Akara(
                              foodName: 'Akara',
                              price: 100,
                              imagePath: 'asset/imgs/akara.jpg',
                            ),
                          ),
                        );
                      },
                      child: _buildMedicationCard(
                          context, 'Akara', 'asset/imgs/akara.jpg'),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Agege(
                              foodName: 'Agege',
                              price: 50,
                              imagePath: 'asset/imgs/Agege.jpeg',
                            ),
                          ),
                        );
                      },
                      child: _buildMedicationCard(
                          context, 'Agege', 'asset/imgs/Agege.jpeg'),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Asun(
                              foodName: 'Asun',
                              price: 500,
                              imagePath: 'asset/imgs/asun.jpg',
                            ),
                          ),
                        );
                      },
                      child: _buildMedicationCard(
                          context, 'Asun', 'asset/imgs/asun.jpg'),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Asaro(
                              foodName: 'Asaro',
                              price: 200,
                              imagePath: 'asset/imgs/asaro.jpg',
                            ),
                          ),
                        );
                      },
                      child: _buildMedicationCard(
                          context, 'Asaro', 'asset/imgs/asaro.jpg'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Promo(),
                ),
              );
            },
            child: Container(
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
          ElevatedButton(
            onPressed: () {
              Random random = Random();
              CartModel movie = CartModel(
                id: random.nextInt(10000),
                name: name,
                imageUrl: imageUrl,
                price: 300,
              );
              context.read<CartService>().addcart(movie, context);
            },
            child: Text('Add to Cart'),
          ),
        ],
      ),
    );
  }
}
