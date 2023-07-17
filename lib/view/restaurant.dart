import 'package:flutter/material.dart';

class Restaurant extends StatelessWidget {
  final List<MenuItem> menuItems = [
    MenuItem(
      name: 'Jollof rice',
      price: 500,
      image: 'asset/imgs/chicken.png',
    ),
    MenuItem(
      name: 'Peppersoup',
      price: 500,
      image: 'asset/imgs/peppersoup.png',
    ),
//     Add more menu items
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Country Kitchen dishes',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: ListView.builder(
          itemCount: menuItems.length,
          itemBuilder: (context, index) {
            return MenuItemCard(
              menuItem: menuItems[index],
            );
          },
        ),
      ),
    );
  }
}

class MenuItem {
  final double price;
  final String image;
  final String name;

  MenuItem({
    required this.price,
    required this.image,
    required this.name,
  });
}

class MenuItemCard extends StatelessWidget {
  final MenuItem menuItem;

  MenuItemCard({required this.menuItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            menuItem.image,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
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
                SizedBox(height: 4.0),
                Text(
                  '\Delivery: #${menuItem.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
