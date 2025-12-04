import 'package:flutter/material.dart';
import 'package:union_shop/views/app_styles.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/product');
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(Icons.image_not_supported, color: Colors.grey),
                  ),
                );
              },
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Text(
                title,
                style: const TextStyle(fontSize: 14, color: Colors.black),
                maxLines: 2,
              ),
              const SizedBox(height: 4),
              Text(
                price,
                style: const TextStyle(fontSize: 13, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        color: Colors.grey[50],
        padding: const EdgeInsets.all(24),
        child: const Wrap(
          children: [
            SizedBox(
                width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Opening Hours', style: footerHeading),
                    SizedBox(height: 16),
                    Text('❄️ Winter Break Closure Dates ❄️',
                        style: footerOpeningHoursText),
                    SizedBox(height: 8),
                    Text('Closing 4pm 19/12/2025',
                        style: footerOpeningHoursText),
                    SizedBox(height: 8),
                    Text('Reopening 10am 05/01/2026',
                        style: footerOpeningHoursText),
                    SizedBox(height: 8),
                    Text('Last post date: 12pm on 18/12/2025',
                        style: footerOpeningHoursText),
                    SizedBox(height: 8),
                    Text('------------------------',
                        style: footerOpeningHoursText),
                    SizedBox(height: 8),
                    Text('(Term Time)', style: footerOpeningHoursText),
                    SizedBox(height: 8),
                    Text('Monday - Friday 10am - 4pm',
                        style: footerOpeningHoursText),
                    SizedBox(height: 8),
                    Text('(Outside of Term Time / Consolidation Weeks)',
                        style: footerOpeningHoursText),
                    SizedBox(height: 8),
                    Text('Monday - Friday 10am - 3pm',
                        style: footerOpeningHoursText),
                    SizedBox(height: 8),
                    Text('Purchase online 24/7', style: footerOpeningHoursText),
                  ],
                ))
          ],
        ));
  }
}
