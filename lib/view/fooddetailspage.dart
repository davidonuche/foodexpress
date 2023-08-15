import 'package:flutter/material.dart';

class FoodDetailsPage extends StatefulWidget {
  final String foodName;
  final String imagePath;

  FoodDetailsPage({required this.foodName, required this.imagePath});

  @override
  _FoodDetailsPageState createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  int itemCount = 0;

  List<String> cartItems = [];

  void _addToCart() {
    if (itemCount > 0) {
      cartItems.add(widget.foodName);
      // You can add additional logic here, such as updating a total price
      // or notifying the user that the item was added to the cart.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.foodName),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
             // child: Image.asset(
                //'asset/imgs/jollof_rice.png',
                //fit: BoxFit.fill,
              //),
            ),
            SizedBox(height: 16),
            Text(
              widget.foodName,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            // Add price or other details here
            SizedBox(height: 290), // Space for cart items
            _buildAddToCartRow(),
          ],
        ),
      ),
    );
  }

  Widget _buildAddToCartRow() {
    return Container(
      padding: EdgeInsets.only(right: 24, left: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: _addToCart,
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              minimumSize: Size(157, 40),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '#4,500', // Add your price here
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Add to cart',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      itemCount++;
                    });
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
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    if (itemCount > 0) {
                      setState(() {
                        itemCount--;
                      });
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
