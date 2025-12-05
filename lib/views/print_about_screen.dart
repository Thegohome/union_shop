import 'package:flutter/material.dart';
import 'package:union_shop/views/common_widgets.dart';
import 'package:union_shop/views/app_styles.dart';

class PrintAboutScreen extends StatelessWidget {
  const PrintAboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppHeader(),
            const SizedBox(height: 40),
            const Text(
              'The Union Print Shack',
              style: pageTitle,
            ),
            const SizedBox(height: 32),
            Container(
              key: const Key('aboutTextBlock'),
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/printshacklogo.png',
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return const ErrorContainer();
                      },
                    ),
                  ),
                  const Text(
                    'Make It Yours at The Union Print Shack',
                    style: boldPageText,
                  ),
                  const Text(
                    'Want to add a personal touch? We\'ve got you covered with heat-pressed customisation on all our clothing. Swing by the shop - our team\'s always happy to help you pick the right gear and answer any questions.\n',
                    style: pageText,
                  ),
                  const Text(
                    'Uni Gear or Your Gear - We\'ll Personalise It',
                    style: boldPageText,
                  ),
                  const Text(
                    'Whether you\'re repping your university or putting your own spin on a hoodie you already own, we\'ve got you covered. We can personalise official uni-branded clothing and your own items - just bring them in and let\'s get creative!\n',
                    style: pageText,
                  ),
                  const Text(
                    'Simple Pricing, No Surprises',
                    style: boldPageText,
                  ),
                  const Text(
                    'Customising your gear won\'t break the bank - just £3 for one line of text or a small chest logo, and £5 for two lines or a large back logo. Turnaround time is up to three working days, and we\'ll let you know as soon as it\'s ready to collect.\n',
                    style: pageText,
                  ),
                  const Text(
                    'Personalisation Terms & Conditions',
                    style: boldPageText,
                  ),
                  const Text(
                    'We will print your clothing exactly as you have provided it to us, whether online or in person. We are not responsible for any spelling errors. Please ensure your chosen text is clearly displayed in either capitals or lowercase. Refunds are not provided for any personalised items.\n',
                    style: pageText,
                  ),
                  const Text(
                    'Ready to Make It Yours?',
                    style: boldPageText,
                  ),
                  const Text(
                    'Pop in or get in touch today - let\'s create something uniquely you with our personalisation service - The Union Print Shack!',
                    style: pageText,
                  ),
                ],
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
