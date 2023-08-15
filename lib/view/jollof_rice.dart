import 'package:flutter/material.dart';
import 'package:foodexpress/view/cart_screen.dart';

class JollofRice extends StatefulWidget {
  final String foodName;
  final String imagePath;
  final double price;

  JollofRice(
      {required this.foodName, required this.imagePath, required this.price});

  @override
  _JollofRiceState createState() => _JollofRiceState();
}

class _JollofRiceState extends State<JollofRice> {
  int itemCount = 0;

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
              child: Image.asset(
                'asset/imgs/jollof_rice.png',
                fit: BoxFit.cover,
              ),
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
            Row(
              children: [
                Text(
                  '#${widget.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
              ],
            ),
            SizedBox(height: 290),
            _buildAddToCartRow(),
          ],
        ),
      ),
    );
  }

  Widget _buildAddToCartRow() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
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
                  setState(() {
                    itemCount--;
                  });
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
                setState(() {
                  itemCount++;
                });
              },
            ),
          ),
          Spacer(),
          ElevatedButton(
            onPressed: () {
              //  Navigator.push(
              //   context,
                //MaterialPageRoute(
                 // builder: (context) => CartScreen(),
                //),
              //);
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
      ),
    );
  }
}
