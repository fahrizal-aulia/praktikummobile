import 'package:flutter/material.dart';
import 'package:praktikummobile/product_page.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Product>? cartItems =
        ModalRoute.of(context)!.settings.arguments as List<Product>?;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Page'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: cartItems == null || cartItems.isEmpty
          ? Center(child: Text('Your cart is empty.'))
          : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(cartItems[index].name),
                  subtitle:
                      Text('\Rp${cartItems[index].price.toStringAsFixed(3)}'),
                );
              },
            ),
    );
  }
}
