import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/providers/cart_provider.dart';

class CartPage extends StatelessWidget {
  static const routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<CartProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(10),
            child: Container(
              padding: EdgeInsets.all(20),
              child: Text('Total : \$${cartData.total}'),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cartData.items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("${cartData.items.values.toList()[index].title}"),
                  subtitle:
                      Text("${cartData.items.values.toList()[index].qty}"),
                  trailing: Container(
                    child: Text(
                        "\$${cartData.items.values.toList()[index].qty * cartData.items.values.toList()[index].price}"),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
