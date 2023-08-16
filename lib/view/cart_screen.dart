import 'package:flutter/material.dart';
import 'package:foodexpress/service/cart_service.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Consumer<CartService>(
        builder: (context, data, _) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: data.carts.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(data.carts[index].name),
                      subtitle: Text(
                          'Price: \$${data.carts[index].price.toStringAsFixed(2)}'),
                    );
                  },
                ),
              ),
              Divider(),
              ListTile(
                title: Text(
                    'Total: \$${calculateTotal(data.carts).toStringAsFixed(2)}'),
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
          );
        },
      ),
    );
  }

  double calculateTotal(items) {
    double total = 0;
    for (var item in items) {
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
