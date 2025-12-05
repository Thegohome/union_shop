import 'package:flutter/material.dart';
import 'package:union_shop/views/app_styles.dart';
import 'package:union_shop/repositories/product_repository.dart';
import 'package:union_shop/models/product.dart';

/// ErrorContainer widget for displaying image load errors
/// Shows a grey container with an image not supported icon
class ErrorContainer extends StatelessWidget {
  const ErrorContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: const Center(
        child: Icon(
          Icons.image_not_supported,
          color: Colors.grey,
        ),
      ),
    );
  }
}

class ProductCard extends StatefulWidget {
  final String productId;

  const ProductCard({
    super.key,
    required this.productId,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  late Future<Product?> _productFuture;

  @override
  void initState() {
    super.initState();
    _productFuture = ProductRepository().getById(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Product?>(
      future: _productFuture,
      builder: (context, snapshot) {
        // Handle loading state
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        // Handle error or null state
        if (snapshot.hasError || snapshot.data == null) {
          return const ErrorContainer();
        }

        // Build UI with product data
        final product = snapshot.data!;
        final firstImage = product.images.isNotEmpty ? product.images[0] : '';

        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/product');
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Image.asset(
                  firstImage,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const ErrorContainer();
                  },
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text(
                    product.name,
                    style: const TextStyle(fontSize: 14, color: Colors.black),
                    maxLines: 2,
                  ),
                  const SizedBox(height: 4),
                  // Conditional price display based on sale status
                  if (product.isSale)
                    Row(
                      children: [
                        Text(
                          '£${product.price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '£${product.salePrice!.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 13,
                            color: portsmouthPurple,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  else
                    Text(
                      '£${product.price.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                ],
              ),
            ],
          ),
        );
      },
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

class HelpInfoButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double bottomPadding;

  const HelpInfoButton(
    this.text, {
    required this.onPressed,
    this.bottomPadding = 8,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: TextButton(
        onPressed: onPressed,
        child: Text(text, style: footerTextButtonText),
      ),
    );
  }
}

class AppHeader extends StatefulWidget {
  const AppHeader({super.key});

  @override
  State<AppHeader> createState() => _AppHeaderState();
}

class _AppHeaderState extends State<AppHeader> {
  bool _isMenuOpen = false;

  void _navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void _placeholderCallback() {
    // Placeholder for buttons that don't have functionality yet
  }

  void _toggleMenu() {
    setState(() {
      _isMenuOpen = !_isMenuOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const headerHeight = 70.0;

    // Threshold: when width is less than this, show menu toggle
    const menuToggleThreshold = 900.0;
    final showMenuToggle = screenWidth < menuToggleThreshold;

    return Container(
      color: Colors.white,
      child: Column(
        children: [
          // Top banner - fixed height
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            color: portsmouthPurple,
            child: const Center(
              child: Text(
                'BIG SALE! OUR ESSENTIAL RANGE HAS DROPPED IN PRICE! OVER 20% OFF! COME GRAB YOURS WHILE STOCK LASTS!',
                textAlign: TextAlign.center,
                style: bannerHeading,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          // Main header - fixed height
          SizedBox(
            height: headerHeight,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  // Logo
                  GestureDetector(
                    onTap: () {
                      _navigateToHome(context);
                    },
                    child: Image.asset(
                      'assets/images/unionlogo.png',
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return const ErrorContainer();
                      },
                    ),
                  ),
                  // Navigation menu - centered and hidden on mobile
                  Expanded(
                    child: Center(
                      child: !showMenuToggle
                          ? Row(
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
                            )
                          : const SizedBox.shrink(),
                    ),
                  ),
                  // Action icons - always visible
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
                  // Menu toggle button - only shown when space is limited
                  if (showMenuToggle)
                    HeaderIconButton(
                      icon: Icons.menu,
                      onPressed: _toggleMenu,
                    ),
                ],
              ),
            ),
          ),
          // Dropdown menu - shown when toggle is active
          if (showMenuToggle && _isMenuOpen)
            Container(
              width: double.infinity,
              color: Colors.grey[50],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: NavMenuItem(
                      text: 'Home',
                      onPressed: _placeholderCallback,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: NavMenuItem(
                      text: 'Shop',
                      onPressed: _placeholderCallback,
                      icon: Icons.expand_more,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: NavMenuItem(
                      text: 'The Print Shack',
                      onPressed: _placeholderCallback,
                      icon: Icons.expand_more,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: NavMenuItem(
                      text: 'SALE!',
                      onPressed: _placeholderCallback,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: NavMenuItem(
                      text: 'About',
                      onPressed: _placeholderCallback,
                    ),
                  ),
                ],
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
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobileView = screenWidth < 750;

    return Container(
      width: double.infinity,
      color: Colors.grey[50],
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Center(
            child: isMobileView
                ? Column(
                    children: [
                      _buildOpeningHoursSection(),
                      const SizedBox(height: 24),
                      _buildHelpSection(),
                      const SizedBox(height: 24),
                      _buildLatestOffersSection(isMobileView),
                    ],
                  )
                : Wrap(
                    spacing: 24,
                    children: [
                      _buildOpeningHoursSection(),
                      _buildHelpSection(),
                      _buildLatestOffersSection(isMobileView),
                    ],
                  ),
          ),
          const Divider(height: 24, thickness: 1, color: Colors.black)
        ],
      ),
    );
  }

  Widget _buildOpeningHoursSection() {
    return const SizedBox(
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Opening Hours', style: footerHeading),
          SizedBox(height: 16),
          OpeningHourTextLine('❄️ Winter Break Closure Dates ❄️'),
          OpeningHourTextLine('Closing 4pm 19/12/2025'),
          OpeningHourTextLine('Reopening 10am 05/01/2026'),
          OpeningHourTextLine('Last post date: 12pm on 18/12/2025'),
          OpeningHourTextLine('------------------------'),
          OpeningHourTextLine('(Term Time)'),
          OpeningHourTextLine('Monday - Friday 10am - 4pm'),
          OpeningHourTextLine('(Outside of Term Time / Consolidation Weeks)'),
          OpeningHourTextLine('Monday - Friday 10am - 3pm'),
          OpeningHourTextLine('Purchase online 24/7'),
        ],
      ),
    );
  }

  Widget _buildHelpSection() {
    return SizedBox(
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Help and Information', style: footerHeading),
          const SizedBox(height: 16),
          HelpInfoButton(
            'Search',
            onPressed: _placeholderCallback,
          ),
          HelpInfoButton(
            'Terms & Conditions of Sale Policy',
            onPressed: _placeholderCallback,
          ),
        ],
      ),
    );
  }

  Widget _buildLatestOffersSection(bool isMobileView) {
    return SizedBox(
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Latest Offers', style: footerHeading),
          const SizedBox(height: 16),
          isMobileView
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      decoration:
                          const InputDecoration(hintText: 'Email Address'),
                    ),
                    const SizedBox(height: 12),
                    Center(
                      child: ElevatedButton(
                        onPressed: _placeholderCallback,
                        child: const Text('SUBSCRIBE'),
                      ),
                    )
                  ],
                )
              : Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration:
                            const InputDecoration(hintText: 'Email Address'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton(
                      onPressed: _placeholderCallback,
                      child: const Text('SUBSCRIBE'),
                    )
                  ],
                ),
        ],
      ),
    );
  }
}
