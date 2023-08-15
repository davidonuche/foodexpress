import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  final List<CartItem> cartItems;

  CartScreen(
    Key? key,
    this.cartItems, {
    required String foodName,
    required String imagePath,
    required int itemCount,
    required double price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(cartItems[index].name),
                  subtitle: Text(
                      'Price: \$${cartItems[index].price.toStringAsFixed(2)}'),
                );
              },
            ),
          ),
          Divider(),
          ListTile(
            title: Text('Total: \$${calculateTotal().toStringAsFixed(2)}'),
            trailing: ElevatedButton(
              onPressed: () {
                // Navigate to payment screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentScreen()),
                );
              },
              child: Text('Proceed to Pay'),
            ),
          ),
        ],
      ),
    );
  }

  double calculateTotal() {
    double total = 0;
    for (var item in cartItems) {
      total += item.price;
    }
    return total;
  }
}

class CartItem {
  final String name;
  final double price;

  CartItem({required this.name, required this.price});
}

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Select Payment Method'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement payment logic (e.g., integrate with payment gateway)
              },
              child: Text('Pay with Card'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Implement payment logic (e.g., integrate with payment gateway)
              },
              child: Text('Pay with PayPal'),
            ),
            // Add more payment options as needed
          ],
        ),
      ),
    );
  }
}
