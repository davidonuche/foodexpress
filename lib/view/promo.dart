import 'package:flutter/material.dart';

class Promo extends StatelessWidget {
  final List<String> promotions = [
    'Get 20% off on Jollof Rice!',
    'Buy one, get one free on Akara!',
    'Special discount on Asun this weekend!',
    'Combo offer: Jollof Rice + Chicken',
    'Early bird breakfast deal',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Promotions'),
      ),
      body: ListView.builder(
        itemCount: promotions.length,
        itemBuilder: (context, index) {
          return _buildPromoCard(promotions[index]);
        },
      ),
    );
  }

  Widget _buildPromoCard(String promoText) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        title: Text(
          promoText,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
