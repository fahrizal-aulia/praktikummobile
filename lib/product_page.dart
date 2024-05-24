import 'package:flutter/material.dart';

class Product {
  final String name;
  final double price;

  Product({required this.name, required this.price});
}

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<Product> cartItems = [];

  final List<Product> products = [
    Product(name: 'Mi Ayam', price: 12.000),
    Product(name: 'Bakso', price: 10.000),
    Product(name: 'Mi Ayam + Bakso', price: 20.000),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Page'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index].name),
            subtitle: Text('\Rp${products[index].price.toStringAsFixed(3)}'),
            trailing: ElevatedButton(
              onPressed: () {
                setState(() {
                  cartItems.add(products[index]);
                });
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('${products[index].name} added to cart')));
              },
              child: Text('Add to Cart'),
            ),
          );
        },
      ),
      floatingActionButton: cartItems.isNotEmpty
          ? FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, '/cart', arguments: cartItems);
              },
              child: Icon(Icons.shopping_cart),
            )
          : null,
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProductPage(),
  ));
}
