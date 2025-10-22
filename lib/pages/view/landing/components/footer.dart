import 'package:flutter/material.dart';

class MainFooter extends StatelessWidget {
  const MainFooter({super.key});

  Widget _buildFooterColumn(String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 20),
        ...items.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              item,
              style: const TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return // Footer
    Container(
      color: const Color(0xFF1C1C1C),
      padding: const EdgeInsets.all(60),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.eco, color: Color(0xFF00B517), size: 28),
                        SizedBox(width: 8),
                        Text(
                          'Shopwise',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Customer Support:',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '+1-202-555-0104',
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      '4517 Washington Ave,\nManchester, Kentucky 39495',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'info@shopwise.com',
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: _buildFooterColumn('Top Category', [
                  'Computer & Laptop',
                  'Smartphone',
                  'Headphone',
                  'Camera & Photo',
                  'Video & Television',
                ]),
              ),
              Expanded(
                child: _buildFooterColumn('Quick Links', [
                  'Shop Product',
                  'Shopping Cart',
                  'Wishlist',
                  'Compare',
                  'Track Order',
                ]),
              ),
              Expanded(
                child: _buildFooterColumn('About Us', [
                  'Our Story',
                  'Careers',
                  'Privacy Policy',
                  'Terms & Condition',
                  'Contact Us',
                ]),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Download App',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white24),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(Icons.apple, color: Colors.white, size: 24),
                          SizedBox(width: 8),
                          Text(
                            'App Store',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white24),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(Icons.play_arrow, color: Colors.white, size: 24),
                          SizedBox(width: 8),
                          Text(
                            'Google Play',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
          const Divider(color: Colors.white24, height: 1),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '© 2025 Shopwise. All Rights Reserved.',
                style: TextStyle(color: Colors.white54, fontSize: 14),
              ),
              Row(
                children: [
                  // Image.network(
                  //   'https://upload.wikimedia.org/wikipedia/commons/0/04/Visa.svg',
                  //   height: 24,
                  //   color: Colors.white54,
                  // ),
                  const SizedBox(width: 20),
                  // Image.network(
                  //   'https://upload.wikimedia.org/wikipedia/commons/2/2a/Mastercard-logo.svg',
                  //   height: 24,
                  //   color: Colors.white54,
                  // ),
                  const SizedBox(width: 20),
                  const Icon(Icons.payment, color: Colors.white54, size: 24),
                  const SizedBox(width: 20),
                  const Icon(
                    Icons.account_balance,
                    color: Colors.white54,
                    size: 24,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
