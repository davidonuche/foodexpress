import 'package:flutter/material.dart';
import 'package:foodexpress/view/order.dart';

class Dishes extends StatelessWidget {
  final List<MenuItem> menuItems = [
    MenuItem(
      name: 'Ivory Bite',
      title: 'Country kitchen',
      image: 'asset/imgs/jollof_rice.png',
      price: 'Delivery: \$1,500',
    ),
    MenuItem(
      name: 'Captin Cook',
      title: 'Mr biggs',
      image: 'asset/imgs/peppersoup.png',
      price: 'Delivery: \$2,000',
    ),
    MenuItem(
      name: 'Ivory Bite',
      title: 'Country kitchen',
      image: 'asset/imgs/jollof_rice.png',
      price: 'Delivery: \$1,500',
    ),
    MenuItem(
      name: 'Captin Cook',
      title: 'Mr biggs',
      image: 'asset/imgs/peppersoup.png',
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
                    child: MenuItemCard(
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
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Order(),
            ),
          );
        },
        child: Container(
          width: 259,
          height: 169,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Image.asset(
                  menuItem.image,
                  fit: BoxFit.cover,
                ),
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
                    Text(
                      menuItem.title,
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          menuItem.price,
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
