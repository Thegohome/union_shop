import 'package:flutter/material.dart';
import 'package:union_shop/views/product_page.dart';
import 'package:union_shop/views/home_screen.dart';
import 'package:union_shop/views/about_screen.dart';
import 'package:union_shop/views/login_screen.dart';
import 'package:union_shop/views/print_about_screen.dart';
import 'package:union_shop/views/collections_screen.dart';
import 'package:union_shop/views/collection_view_screen.dart';
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
        '/personalisation': (context) => const PrintAboutScreen(),
        '/collections': (context) => const CollectionsScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name?.startsWith('/collection-view/') ?? false) {
          final uri = Uri.parse(settings.name!);
          final collectionId = uri.queryParameters['id'];
          final collectionName = uri.queryParameters['name'];

          if (collectionId != null && collectionName != null) {
            return MaterialPageRoute(
              builder: (context) => CollectionViewScreen(
                collectionId: collectionId,
                collectionName: collectionName,
              ),
            );
          }
        }
        return null;
      },
    );
  }
}
