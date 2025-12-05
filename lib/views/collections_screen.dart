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
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            AppHeader(),
            // Page Title
            Padding(
              padding: EdgeInsets.symmetric(vertical: 48.0),
              child: Text(
                'Collections',
                style: heroTitle,
              ),
            ),
            // Footer
            AppFooter(),
          ],
        ),
      ),
    );
  }
}
