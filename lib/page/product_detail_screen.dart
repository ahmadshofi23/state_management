import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/providers/cart_provider.dart';
import 'package:state_management/widget/badge.dart';
import '../providers/products_provider.dart';
import 'cart_page.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId =
        ModalRoute.of(context)?.settings.arguments as String; // is the id!
    final product = Provider.of<ProductsProvider>(context).findById(productId);
    final CartData = Provider.of<CartProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
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
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 250,
            child: Image.network(
              "${product.imageUrl}",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 30),
          Text(
            "${product.title}",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 30),
          Text(
            "\$${product.price}",
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          SizedBox(height: 30),
          Text(
            "${product.description}",
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          SizedBox(height: 30),
          OutlinedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Berhasil Di Tambahkan"),
                duration: Duration(milliseconds: 500),
              ));
              CartData.addCart(product.id, product.title, product.price);
            },
            child: Text(
              'Add to Chart',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
