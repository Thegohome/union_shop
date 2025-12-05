import 'package:flutter/material.dart';
import 'package:union_shop/views/common_widgets.dart';
import 'package:union_shop/views/app_styles.dart';
import 'package:union_shop/repositories/collection_repository.dart';
import 'package:union_shop/models/collection.dart';

class CollectionsScreen extends StatefulWidget {
  const CollectionsScreen({super.key});

  @override
  State<CollectionsScreen> createState() => _CollectionsScreenState();
}

class _CollectionsScreenState extends State<CollectionsScreen> {
  late Future<List<Collection>> _collectionsFuture;

  @override
  void initState() {
    super.initState();
    _collectionsFuture = CollectionRepository().getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            const AppHeader(),
            // Page Title
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 48.0),
              child: Text(
                'Collections',
                style: heroTitle,
              ),
            ),
            // Collections Grid with FutureBuilder
            FutureBuilder<List<Collection>>(
              future: _collectionsFuture,
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
                      'No collections found',
                      style: heroSubtitle,
                    ),
                  );
                }

                final collections = snapshot.data!;
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
                    childAspectRatio: 1.0,
                    children: collections
                        .map(
                          (collection) => CollectionCard(
                            collectionName: collection.name,
                            imagePath: collection.image ??
                                'assets/images/placeholder.png',
                          ),
                        )
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
