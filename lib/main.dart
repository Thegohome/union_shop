import 'package:flutter/material.dart';
import 'package:union_shop/views/product_page.dart';
import 'package:union_shop/views/home_screen.dart';
import 'package:union_shop/views/about_screen.dart';
import 'package:union_shop/views/login_screen.dart';
import 'package:union_shop/views/app_styles.dart';

void main() {
  runApp(const UnionShopApp());
}

class UnionShopApp extends StatelessWidget {
  const UnionShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Union Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: portsmouthPurple),
      ),
      home: const HomeScreen(),
      // By default, the app starts at the '/' route, which is the HomeScreen
      initialRoute: '/',
      // When navigating to '/product', build and return the ProductPage
      // In your browser, try this link: http://localhost:49856/#/product
      routes: {
        '/product': (context) => const ProductPage(),
        '/about': (context) => const AboutScreen(),
        '/login': (context) => const LoginScreen(),
      },
    );
  }
}
