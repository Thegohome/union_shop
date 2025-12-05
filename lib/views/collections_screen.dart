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

                return Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40.0, vertical: 48.0),
                  child: const Text('Collections grid will be built here'),
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
