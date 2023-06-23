import 'package:flutter/material.dart';
import 'package:module_7_assignment/main.dart';

class CartPage extends StatelessWidget {
  final List<Product> products;

  CartPage({required this.products});

  int getTotalQuantity() {
    int totalQuantity = 0;
    for (var product in products) {
      totalQuantity += product.counter;
    }
    return totalQuantity;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Center(
        child: Text('Total Products: ${getTotalQuantity()}'),
      ),
    );
  }
}













