import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // this thing written through github changes features
        centerTitle: true,
        title: Text('Shopping'),
      ),
      body: Center(
        child: Text(
          'Your cart is empty',
          textAlign: TextAlign.center,
          textScaleFactor: 2,
        ),
      ),
    );
  }
}
