import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/page/cart_page.dart';
import 'package:state_management/providers/cart_provider.dart';
import 'package:state_management/providers/products_provider.dart';

import 'page/product_detail_screen.dart';
import 'page/products_overview_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductsProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.amber,
          fontFamily: 'Lato',
        ),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartPage.routeName: (ctx) => CartPage(),
        },
      ),
    );
  }
}
