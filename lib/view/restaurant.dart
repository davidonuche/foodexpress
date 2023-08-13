import 'package:flutter/material.dart';

class Restaurant extends StatelessWidget {
  final List<MenuItem> menuItems = [
    MenuItem(
      name: 'Ivory Bite',
      title: 'ile-ife Nigeria',
      image: 'asset/imgs/country_kitchen.jpeg',
      price: 'Delivery: \$1,500',
    ),
    MenuItem(
      name: 'Captin Cook',
      title: 'ile-ife Nigeria',
      image: 'asset/imgs/captin_cook.jpeg',
      price: 'Delivery: \$2,000',
    ),
    MenuItem(
      name: 'Shop Rite',
      title: 'ile-ife Nigeria',
      image: 'asset/imgs/shoprite.png',
      price: 'Delivery: \$1,000',
    ),
    MenuItem(
      name: 'Indeego',
      title: 'ile-ife Nigeria',
      image: 'asset/imgs/indeego.png',
      price: 'Delivery: \$2,000',
    ),
    MenuItem(
      name: 'Resort',
      title: 'ile-ife Nigeria',
      image: 'asset/imgs/resort.png',
      price: 'Delivery: \$1,000',
    ),
    MenuItem(
      name: 'Mr Biggs',
      title: 'ile-ife Nigeria',
      image: 'asset/imgs/mr_biggs.png',
      price: 'Delivery: \$2,000',
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
          'Restaurants',
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
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          print('Card clicked');
        },
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
