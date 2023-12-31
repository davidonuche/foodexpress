import 'dart:math';

import 'package:flutter/material.dart';
import 'package:foodexpress/service/cart_model.dart';
import 'package:foodexpress/service/cart_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MaterialApp(home: Dishes()));
}

class Dishes extends StatelessWidget {
  int itemCount = 0;
  List<String> cartItems = [];
  final List<MenuItem> menuItems = [
    MenuItem(
      name: 'Akara',
      title: 'Ivory Bite',
      image: 'asset/imgs/akara.jpg',
      price: 'Delivery: \#1,500',
    ),
    MenuItem(
      name: 'Agege',
      title: 'Captin Cook',
      image: 'asset/imgs/Agege.jpeg',
      price: 'Delivery: \#2,000',
    ),
    MenuItem(
      name: 'Asun',
      title: 'Shop Rite',
      image: 'asset/imgs/asun.jpg',
      price: 'Delivery: \#2,000',
    ),
    MenuItem(
      name: 'Asaro',
      title: 'Indeego',
      image: 'asset/imgs/asaro.jpg',
      price: 'Delivery: \#1,500',
    ),
    MenuItem(
      name: 'Rice',
      title: 'Resort',
      image: 'asset/imgs/rice.jpg',
      price: 'Delivery: \#2,000',
    ),
    MenuItem(
      name: 'Banga Soup',
      title: 'Mr Biggs',
      image: 'asset/imgs/banga_soup.jpg',
      price: 'Delivery: \#1,500',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Dishes',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
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
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: ListView.builder(
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: MenuItemRow(
                      menuItem: menuItems[index],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MenuItem {
  final String image;
  final String name;
  final String title;
  final String price;

  MenuItem({
    required this.image,
    required this.name,
    required this.title,
    required this.price,
  });
}

class MenuItemRow extends StatelessWidget {
  final MenuItem menuItem;

  MenuItemRow({required this.menuItem});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DishDetailsPage(menuItem: menuItem),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(menuItem.image),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0),
                ),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    menuItem.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    menuItem.title,
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    menuItem.price,
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DishDetailsPage extends StatelessWidget {
  final MenuItem menuItem;

  DishDetailsPage({required this.menuItem});

  @override
  Widget build(BuildContext context) {
    int itemCount = 0;
    return Scaffold(
      appBar: AppBar(
        title: Text(menuItem.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              menuItem.image,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(
              menuItem.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              menuItem.title,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 8),
            Text(
              menuItem.price,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 250,
            ),
            _buildAddToCartButton(
              context,
              menuItem,
              itemCount,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddToCartButton(
      BuildContext context, MenuItem menuItem, int itemCount) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
            icon: Icon(Icons.remove),
            onPressed: () {
              if (itemCount > 0) {
                itemCount--;
              }
            },
          ),
        ),
        SizedBox(width: 20),
        Text(
          itemCount.toString(),
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(width: 20),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              itemCount++;
            },
          ),
        ),
        Spacer(),
        ElevatedButton(
          onPressed: () {
            print('object');
            Random random = Random();
            CartModel movie = CartModel(
              id: random.nextInt(10000),
              name: menuItem.name,
              imageUrl: menuItem.image,
              price: double.parse('1000'),
            );
            print(movie);
            context.read<CartService>().addcart(movie, context);
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Text(
            'Add to Cart',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
