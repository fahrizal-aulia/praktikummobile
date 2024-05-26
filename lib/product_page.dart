import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartModel extends ChangeNotifier {
  final List<String> _items = [];

  List<String> get items => _items;

  void add(String item) {
    _items.add(item);
    notifyListeners();
  }
}

class CartButton extends StatelessWidget {
  final String product;

  CartButton({required this.product});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.add_shopping_cart),
      onPressed: () {
        Provider.of<CartModel>(context, listen: false).add(product);
        final snackBar = SnackBar(content: Text('$product added to cart!'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    );
  }
}

class ProductPage extends StatelessWidget {
  final List<String> products = [
    "Product 1",
    "Product 2",
    "Product 3",
    "Product 4"
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
            title: Text(products[index]),
            trailing: CartButton(product: products[index]),
          );
        },
      ),
    );
  }
}
