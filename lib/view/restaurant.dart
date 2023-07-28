import 'package:flutter/material.dart';

class Restaurant extends StatelessWidget {
  final List<MenuItem> menuItems = [
    MenuItem(
      name: 'Ivory Bite',
      image: 'asset/imgs/ivory_bite.jpeg',
    ),
    MenuItem(
      name: 'Captin Cook',
      image: 'asset/imgs/captin_cook.jpeg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Restaurants',
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
  final String image;
  final String name;

  MenuItem({
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
