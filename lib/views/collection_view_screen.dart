import 'package:flutter/material.dart';
import 'package:union_shop/views/common_widgets.dart';
import 'package:union_shop/views/app_styles.dart';
import 'package:union_shop/repositories/product_repository.dart';
import 'package:union_shop/models/product.dart';

class CollectionViewScreen extends StatefulWidget {
  final String collectionId;
  final String collectionName;

  const CollectionViewScreen({
    super.key,
    required this.collectionId,
    required this.collectionName,
  });

  @override
  State<CollectionViewScreen> createState() => _CollectionViewScreenState();
}

class _CollectionViewScreenState extends State<CollectionViewScreen> {
  late Future<List<Product>> _productsFuture;

  @override
  void initState() {
    super.initState();
    // Fetch all products for now (will filter by collection later)
    _productsFuture = ProductRepository().getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            const AppHeader(),
            // Collection header section
            Container(
              color: Colors.white,
              padding:
                  const EdgeInsets.symmetric(vertical: 48.0, horizontal: 40.0),
              child: Column(
                children: [
                  Text(
                    widget.collectionName.toUpperCase(),
                    style: pageTitle,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Discover our amazing selection of ${widget.collectionName.toLowerCase()}",
                    style: heroSubtitle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            // Filter and sort section
            Container(
              color: Colors.white,
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 40.0),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "14 products",
                    style: pageText,
                  ),
                  SizedBox(width: 16),
                  // Placeholder for filter and sort (not implementing for now)
                ],
              ),
            ),
            // Products grid with FutureBuilder
            FutureBuilder<List<Product>>(
              future: _productsFuture,
              builder: (context, snapshot) {
                // Handle loading state
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 48.0),
                    child: CircularProgressIndicator(),
                  );
                }

                // Handle error or empty state
                if (snapshot.hasError ||
                    !snapshot.hasData ||
                    snapshot.data!.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 48.0),
                    child: Text(
                      'No products found',
                      style: heroSubtitle,
                    ),
                  );
                }

                final products = snapshot.data!;
                return Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40.0, vertical: 48.0),
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount:
                        MediaQuery.of(context).size.width > 600 ? 3 : 1,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 48,
                    childAspectRatio: 0.7,
                    children: products
                        .map((product) => ProductCard(productId: product.id))
                        .toList(),
                  ),
                );
              },
            ),
            // Footer
            const AppFooter(),
          ],
        ),
      ),
    );
  }
}
