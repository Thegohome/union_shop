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

class OpeningHourTextLine extends StatelessWidget {
  final String text;
  final double bottomPadding;

  const OpeningHourTextLine(
    this.text, {
    this.bottomPadding = 8,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: Text(text, style: footerOpeningHoursText),
    );
  }
}

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  void _navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void _placeholderCallback() {
    // Placeholder for buttons that don't have functionality yet
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.white,
      child: Column(
        children: [
          // Top banner
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8),
            color: const Color(0xFF4d2963),
            child: const Text(
              'BIG SALE! OUR ESSENTIAL RANGE HAS DROPPED IN PRICE! OVER 20% OFF! COME GRAB YOURS WHILE STOCK LASTS!',
              textAlign: TextAlign.center,
              style: bannerHeading,
            ),
          ),
          // Main header
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      _navigateToHome(context);
                    },
                    child: Image.network(
                      'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
                      height: 18,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[300],
                          width: 18,
                          height: 18,
                          child: const Center(
                            child: Icon(Icons.image_not_supported,
                                color: Colors.grey),
                          ),
                        );
                      },
                    ),
                  ),
                  const Spacer(),
                  // Menu items - constrained to prevent overflow
                  Expanded(
                    flex: 2,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          NavMenuItem(
                            text: 'Home',
                            onPressed: _placeholderCallback,
                          ),
                          const SizedBox(width: 24),
                          NavMenuItem(
                            text: 'Shop',
                            onPressed: _placeholderCallback,
                            icon: Icons.expand_more,
                          ),
                          const SizedBox(width: 24),
                          NavMenuItem(
                            text: 'The Print Shack',
                            onPressed: _placeholderCallback,
                            icon: Icons.expand_more,
                          ),
                          const SizedBox(width: 24),
                          NavMenuItem(
                            text: 'SALE!',
                            onPressed: _placeholderCallback,
                          ),
                          const SizedBox(width: 24),
                          NavMenuItem(
                            text: 'About',
                            onPressed: _placeholderCallback,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        HeaderIconButton(
                          icon: Icons.search,
                          onPressed: _placeholderCallback,
                        ),
                        HeaderIconButton(
                          icon: Icons.person_outline,
                          onPressed: _placeholderCallback,
                        ),
                        HeaderIconButton(
                          icon: Icons.shopping_bag_outlined,
                          onPressed: _placeholderCallback,
                        ),
                        HeaderIconButton(
                          icon: Icons.menu,
                          onPressed: _placeholderCallback,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NavMenuItem extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData? icon;
  final double iconPadding;

  const NavMenuItem({
    required this.text,
    required this.onPressed,
    this.icon,
    this.iconPadding = 8,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(text, style: navbarMenuItem),
          if (icon != null) ...[
            SizedBox(width: iconPadding),
            Icon(
              icon,
              size: 18,
              color: Colors.black,
            ),
          ],
        ],
      ),
    );
  }
}

class HeaderIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const HeaderIconButton({
    required this.icon,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        icon,
        size: 18,
        color: Colors.grey,
      ),
      padding: const EdgeInsets.all(8),
      constraints: const BoxConstraints(
        minWidth: 32,
        minHeight: 32,
      ),
      onPressed: onPressed,
    );
  }
}

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  void _placeholderCallback() {
    // Placeholder for buttons that don't have functionality yet
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        color: Colors.grey[50],
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Center(
              child: Wrap(children: [
                const SizedBox(
                    width: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Opening Hours', style: footerHeading),
                        SizedBox(height: 16),
                        OpeningHourTextLine('❄️ Winter Break Closure Dates ❄️'),
                        OpeningHourTextLine('Closing 4pm 19/12/2025'),
                        OpeningHourTextLine('Reopening 10am 05/01/2026'),
                        OpeningHourTextLine(
                            'Last post date: 12pm on 18/12/2025'),
                        OpeningHourTextLine('------------------------'),
                        OpeningHourTextLine('(Term Time)'),
                        OpeningHourTextLine('Monday - Friday 10am - 4pm'),
                        OpeningHourTextLine(
                            '(Outside of Term Time / Consolidation Weeks)'),
                        OpeningHourTextLine('Monday - Friday 10am - 3pm'),
                        OpeningHourTextLine('Purchase online 24/7'),
                      ],
                    )),
                const SizedBox(
                    width: 300,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Help and Information', style: footerHeading),
                          SizedBox(height: 16),
                          Text('Search', style: footerTextButtonText),
                          SizedBox(height: 8),
                          Text('Terms & Conditions of Sale Policy',
                              style: footerTextButtonText),
                        ])),
                SizedBox(
                    width: 300,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Latest Offers', style: footerHeading),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              SizedBox(
                                width: 175,
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                      hintText: 'Email Address'),
                                ),
                              ),
                              ElevatedButton(
                                  onPressed: _placeholderCallback,
                                  child: const Text('SUBSCRIBE'))
                            ],
                          )
                        ]))
              ]),
            ),
            const Divider(height: 5, thickness: 1, color: Colors.black)
          ],
        ));
  }
}
