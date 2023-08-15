import 'package:flutter/material.dart';

class Restaurant extends StatelessWidget {
  final List<MenuItem> menuItems = [
    MenuItem(
        name: 'Ivory Bite',
        title: 'ile-ife Nigeria',
        image: 'asset/imgs/country_kitchen.jpeg',
        price: 'Delivery: \$1,500',
        detail:
            'Ivory Bite Buttered Bread Bromate Free By IvoryBites Bakery and Confectionery. ₦350.00'),
    MenuItem(
        name: 'Captin Cook',
        title: 'ile-ife Nigeria',
        image: 'asset/imgs/captin_cook.jpeg',
        price: 'Delivery: \$2,000',
        detail:
            'Captain James Cook FRS was a British explorer, cartographer and naval officer famous for his three voyages between 1768 and 1779 in the Pacific Ocean and to New Zealand and Australia in particular. '),
    MenuItem(
        name: 'Shop Rite',
        title: 'ile-ife Nigeria',
        image: 'asset/imgs/shoprite.png',
        price: 'Delivery: \$1,000',
        detail:
            'ShopRite is an American retailers cooperative of supermarkets with stores in six states: Connecticut, Delaware, Maryland, New Jersey, New York and Pennsylvania'),
    MenuItem(
        name: 'Indeego',
        title: 'ile-ife Nigeria',
        image: 'asset/imgs/indeego.png',
        price: 'Delivery: \$2,000',
        detail:
            'We Provide you Hospitality, Promote Leisure & High-end Comfort using Good Food, Exotic Drinks at our Conducive and Engaging Space thats Aesthetically Pleasing!'),
    MenuItem(
        name: 'Resort',
        title: 'ile-ife Nigeria',
        image: 'asset/imgs/resort.png',
        price: 'Delivery: \$1,000',
        detail:
            'The Ife Grand Resort & Leisure is the hospitality-care center, where visiting foreign tourists and our indigenous clients can enjoy the luxury of large and well-appointed Rooms, professional services, and enjoy a seamless mélange of western culture and African tradition, a culinary statement we always make with our delicious meals and drinks "Our African Village” replicates African Village realities with a number of Rafia, wooden huts, with thatched roof, each of them named after past Oonis of Ife.'),
    MenuItem(
        name: 'Mr Biggs',
        title: 'ile-ife Nigeria',
        image: 'asset/imgs/mr_biggs.png',
        price: 'Delivery: \$2,000',
        detail:
            'Mr Biggs is one of Nigeria fast food restaurants. Owned by Nigerian conglomerate United African Company of Nigeria PLC, there are currently around 170 locations in Nigeria, including the countrys first drive-through restaurant, with another four locations in Ghana.'),
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
  final String detail;

  MenuItem({
    required this.image,
    required this.name,
    required this.title,
    required this.price,
    required this.detail,
  });
}

class MenuItemRow extends StatelessWidget {
  final MenuItem menuItem;

  MenuItemRow({required this.menuItem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (content) => Container(
              height: 50,
              width: 50,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(right: 24, left: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(menuItem.image),
                    SizedBox(height: 16),
                    Text(
                      menuItem.name,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                    ),
                    SizedBox(height: 16),
                    Text(
                      menuItem.title,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                    ),
                    SizedBox(height: 16),
                    Text(
                      menuItem.price,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                    ),
                    SizedBox(height: 16),
                    Text(
                      menuItem.detail,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
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
              offset: Offset(0, 3), // changes position of shadow
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
