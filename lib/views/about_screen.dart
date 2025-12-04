import 'package:flutter/material.dart';
import 'package:union_shop/views/common_widgets.dart';
import 'package:union_shop/views/app_styles.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppHeader(),
            const SizedBox(height: 40),
            const Text(
              'About Us',
              style: heroTitle,
            ),
            const SizedBox(height: 32),
            Container(
              key: const Key('aboutTextBlock'),
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: const Text(
                'About us\n'
                'Welcome to the Union Shop!\n\n'
                'We\'re dedicated to giving you the very best University branded products, with a range of clothing and merchandise available to shop all year round! We even offer an exclusive personalisation service!\n\n'
                'All online purchases are available for delivery or instore collection!\n\n'
                'We hope you enjoy our products as much as we enjoy offering them to you. If you have any questions or comments, please don\'t hesitate to contact us at hello@upsu.net.\n\n'
                'Happy shopping!\n\n'
                'The Union Shop & Reception Team',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  height: 1.6,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 40),
            const AppFooter(),
          ],
        ),
      ),
    );
  }
}
