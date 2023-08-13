import 'package:flutter/material.dart';

class Order extends StatefulWidget {
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  int itemCount = 0;
  List<String> cartItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Country Kitchen Restaurant',
              style: TextStyle(color: Colors.black),
            ),
            GestureDetector(
              onTap: () {
                _showCartDialog();
              },
              child: Row(
                children: [
                  Icon(
                    Icons.shopping_cart,
                    color: Colors.black,
                  ),
                  SizedBox(width: 4),
                  Text(cartItems.length.toString(),
                      style: TextStyle(color: Colors.black)),
                ],
              ),
            ),
          ],
        ),
        leading: IconButton(
          icon: Icon(
            Icons.cancel,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 200,
              child: Image.asset(
                'asset/imgs/chicken.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'jollof rice',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text('#3,000'),
                Spacer(
                  flex: 8,
                ),
                Text('Delivery: # 1,500'),
                Spacer(),
              ],
            ),
            SizedBox(height: 290), // Space for cart items
            _buildAddToCartRow(), // Add to Cart feature
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
            onPressed: () {
              if (itemCount > 0) {
                cartItems.add('jollof rice');
                setState(() {
                  itemCount = 0;
                });
              }
            },
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
                  '#4,500',
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

  void _showCartDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Cart Items'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (String item in cartItems) Text(item),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}