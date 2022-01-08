import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/page/cart_page.dart';
import 'package:state_management/providers/cart_provider.dart';
import 'package:state_management/widget/badge.dart';
import '../widget/product_grid.dart';

class ProductsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: [
          Consumer<CartProvider>(
            builder: (context, value, ch) {
              return Badge(
                child: ch,
                value: value.jumlah.toString(),
              );
            },
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  CartPage.routeName,
                  // arguments: productData.id,
                );
              },
              icon: Icon(Icons.shopping_cart),
            ),
          ),
        ],
      ),
      body: ProductGrid(),
    );
  }
}
