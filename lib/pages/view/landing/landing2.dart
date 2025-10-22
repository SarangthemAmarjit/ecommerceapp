

import 'package:flutter/material.dart';

class HomePage22 extends StatelessWidget {
  const HomePage22({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          
          // Shop Our Top Categories
          _buildSectionHeader('Shop Our Top Categories'),
          const SizedBox(height: 20),
          SizedBox(
            height: 160,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              children: [
                _buildCategoryCard('Painting', const Color(0xFF4FA9AB), 'https://images.unsplash.com/photo-1579783902614-a3fb3927b6a5?w=300'),
                _buildCategoryCard('Laptop', const Color(0xFFFF9066), 'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=300'),
                _buildCategoryCard('Beauty', const Color(0xFF8B1538), 'https://images.unsplash.com/photo-1596462502278-27bfdc403348?w=300'),
                _buildCategoryCard('Bicycle', const Color(0xFF2DB224), 'https://images.unsplash.com/photo-1485965120184-e220f721d03e?w=300'),
                _buildCategoryCard('Luggage', const Color(0xFFFFCDD2), 'https://images.unsplash.com/photo-1565026057447-bc90a3dceb87?w=300'),
                _buildCategoryCard('Backpack', const Color(0xFFFFAB40), 'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=300'),
              ],
            ),
          ),
          
          const SizedBox(height: 50),
          
          // Today's Best Deals For You
          _buildSectionHeader('Today\'s Best Deals For You!'),
           SizedBox(height: 20),
          SizedBox(
            height: 320,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              children: [
                _buildProductCard(
                  'Life Preserver Ring',
                  14.99,
                  4.5,
                  237,
                  'https://images.unsplash.com/photo-1589519160732-57fc498494f8?w=400',
                ),
                _buildProductCard(
                  'Fujifilm Instax Mini',
                  99.99,
                  4.8,
                  492,
                  'https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f?w=400',
                ),
                _buildProductCard(
                  'Yellow Travel Bag',
                  24.99,
                  4.6,
                  328,
                  'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=400',
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 50),
          
          // Choose By Brand
          _buildSectionHeader('Choose By Brand'),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Wrap(
              spacing: 15,
              runSpacing: 15,
              children: [
                _buildBrandChip('Lenovo', const Color(0xFFE92C2C), Icons.laptop),
                _buildBrandChip('Philip', const Color(0xFF2DB224), Icons.lightbulb_outline),
                _buildBrandChip('House of Holland', const Color(0xFF8B1538), Icons.checkroom),
                _buildBrandChip('Polo House', Colors.black87, Icons.sports_soccer),
                _buildBrandChip('Marco Rizzoli', const Color(0xFF2DB224), Icons.watch),
                _buildBrandChip('Calvin Klein', const Color(0xFF1976D2), Icons.checkroom),
                _buildBrandChip('Burberry', const Color(0xFFE92C2C), Icons.shopping_bag),
                _buildBrandChip('Tommy', const Color(0xFFE92C2C), Icons.sports_golf),
              ],
            ),
          ),
          
          const SizedBox(height: 50),
          
          // Get Up To 70% Off
          _buildSectionHeader('Get Up To 70% Off'),
          const SizedBox(height: 20),
          SizedBox(
            height: 220,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              children: [
                _buildDealCard('\$100', 'Save', const Color(0xFFFFE0B2), 'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=400'),
                _buildDealCard('\$29', 'Discount', const Color(0xFFFFCDD2), 'https://images.unsplash.com/photo-1595526114035-0d45ed16cfbf?w=400'),
                _buildDealCard('\$67', 'Special', const Color(0xFFFFF9C4), 'https://images.unsplash.com/photo-1489987707025-afc232f7ea0f?w=400'),
                _buildDealCard('\$59', 'Limited', const Color(0xFFB2EBF2), 'https://images.unsplash.com/photo-1467043237213-65f2da53396f?w=400'),
              ],
            ),
          ),
          
          const SizedBox(height: 50),
          
          // Weekly Popular Products
          _buildSectionHeader('Weekly Popular Products'),
          const SizedBox(height: 20),
          SizedBox(
            height: 320,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              children: [
                _buildProductCard(
                  'Gaming Headset Pro',
                  39.99,
                  4.7,
                  156,
                  'https://images.unsplash.com/photo-1599669454699-248893623440?w=400',
                ),
                _buildProductCard(
                  'Yellow Travel Bag',
                  24.99,
                  4.6,
                  328,
                  'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=400',
                ),
                _buildProductCard(
                  'Galaxy Watch Active',
                  179.99,
                  4.9,
                  621,
                  'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=400',
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 50),
          
          // Cash Back Banner
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 40),
            height: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                image: NetworkImage('https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=1200'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  colors: [
                    Colors.yellow[700]!.withOpacity(0.9),
                    Colors.transparent,
                    Colors.teal[800]!.withOpacity(0.9),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(60),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Get 5% Cash\nBack On \$200',
                            style: TextStyle(
                              fontSize: 38,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              height: 1.2,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Shop Now for exclusive deals and\nget cash back on your purchases.',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 28),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: const Color(0xFF006D5B),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 36,
                                vertical: 16,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              elevation: 0,
                            ),
                            child: const Text(
                              'Shop Now',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 50),
          
          // Today's Best Deals For You (Second)
          _buildSectionHeader('Today\'s Best Deals For You!'),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                _buildSmallProductCard('Laptop Sleeve Briefcase', 14.99, 'https://images.unsplash.com/photo-1588872657578-7efd1f1555ed?w=300'),
                _buildSmallProductCard('On Ear Headphones', 29.99, 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=300'),
                _buildSmallProductCard('iPhone Leather Case', 19.99, 'https://images.unsplash.com/photo-1591337676887-a217a6970a8a?w=300'),
                _buildSmallProductCard('Thermal Water Bottle', 24.99, 'https://images.unsplash.com/photo-1602143407151-7111542de6e8?w=300'),
                _buildSmallProductCard('Leather Wallet Brown', 34.99, 'https://images.unsplash.com/photo-1627123424574-724758594e93?w=300'),
                _buildSmallProductCard('MacBook Air 13"', 899.99, 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=300'),
                _buildSmallProductCard('Life Preserver Ring', 14.99, 'https://images.unsplash.com/photo-1589519160732-57fc498494f8?w=300'),
                _buildSmallProductCard('iPad Air 5 Purple', 549.99, 'https://images.unsplash.com/photo-1544244015-0df4b3ffc6b0?w=300'),
              ],
            ),
          ),
          
          const SizedBox(height: 50),
          
          // Get 5% Cash Back Banner (Second)
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 40),
            padding: const EdgeInsets.all(60),
            height: 250,
            decoration: BoxDecoration(
              color: const Color(0xFFFFE0B2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Get 5% Cash Back',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF00B517),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 16,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'Shop Now',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Image.network(
                    'https://images.unsplash.com/photo-1607083206869-4c7672e72a8a?w=400',
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 50),
          
          // Best Selling Products
          _buildSectionHeader('Best Selling Products'),
          const SizedBox(height: 20),
          SizedBox(
            height: 320,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              children: [
                _buildProductCard(
                  'Fuji Instax Mini 11',
                  79.99,
                  4.8,
                  412,
                  'https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f?w=400',
                ),
                _buildProductCard(
                  'Wrist Watch Elegant',
                  129.99,
                  4.7,
                  289,
                  'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=400',
                ),
                _buildProductCard(
                  'LED Light Strip 5M',
                  19.99,
                  4.6,
                  537,
                  'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400',
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 50),
          
          // Trending Products For You
          _buildSectionHeader('Trending Products For You'),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              children: [
                Expanded(
                  child: _buildLargeBanner(
                    'Furniture Village',
                    'Exclusive Collection',
                    'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=600',
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: _buildLargeBanner(
                    'Fashion World',
                    'New Season Styles',
                    'https://images.unsplash.com/photo-1489987707025-afc232f7ea0f?w=600',
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 50),
          
          // Best Seller Shop
          _buildSectionHeader('Best Seller Shop'),
          const SizedBox(height: 20),
          SizedBox(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              children: [
                _buildShopCard('Wireless Bluetooth', 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=300', const Color(0xFFFFCDD2)),
                _buildShopCard('Smart Watch Series', 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=300', const Color(0xFFB71C1C)),
                _buildShopCard('Home Essentials', 'https://images.unsplash.com/photo-1484101403633-562f891dc89a?w=300', const Color(0xFFE0F2F1)),
                _buildShopCard('Office Supplies', 'https://images.unsplash.com/photo-1484480974693-6ca0a78fb36b?w=300', const Color(0xFFFFE0B2)),
              ],
            ),
          ),
          
          const SizedBox(height: 50),
          
          // Services To Help You Shop
          _buildSectionHeader('Services To Help You Shop'),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              children: [
                Expanded(
                  child: _buildServiceCard(
                    'Frequently Asked Questions',
                    'Get answers instantly',
                    const Color(0xFFFFEBEE),
                    'https://images.unsplash.com/photo-1516321497487-e288fb19713f?w=400',
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: _buildServiceCard(
                    'Online Payment',
                    'Secure transactions',
                    const Color(0xFFE8F5E9),
                    'https://images.unsplash.com/photo-1563013544-824ae1b704d3?w=400',
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: _buildServiceCard(
                    'Home Delivery',
                    'Fast & reliable',
                    const Color(0xFFFFF9C4),
                    'https://images.unsplash.com/photo-1566576912321-d58ddd7a6088?w=400',
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 60),
          
          // Footer
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
                            style: TextStyle(color: Colors.white70, fontSize: 14, height: 1.5),
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
                        Image.network('https://upload.wikimedia.org/wikipedia/commons/0/04/Visa.svg', height: 24, color: Colors.white54),
                        const SizedBox(width: 20),
                        Image.network('https://upload.wikimedia.org/wikipedia/commons/2/2a/Mastercard-logo.svg', height: 24, color: Colors.white54),
                        const SizedBox(width: 20),
                        const Icon(Icons.payment, color: Colors.white54, size: 24),
                        const SizedBox(width: 20),
                        const Icon(Icons.account_balance, color: Colors.white54, size: 24),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    
  }

  Widget _buildNavLink(String text, bool isActive) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        foregroundColor: isActive ? const Color(0xFF00B517) : Colors.black87,
        padding: EdgeInsets.zero,
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildCategoryCard(String title, Color color, String imageUrl) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network(
              imageUrl,
              height: 90,
              width: 90,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 90,
                  width: 90,
                  color: Colors.white.withOpacity(0.5),
                  child: const Icon(Icons.image, size: 40, color: Colors.white),
                );
              },
            ),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 13,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(String name, double price, double rating, int reviews, String imageUrl) {
    return Container(
      width: 240,
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                child: Image.network(
                  imageUrl,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 200,
                      color: Colors.grey[100],
                      child: const Center(
                        child: Icon(Icons.image, size: 60, color: Colors.grey),
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: const Icon(Icons.favorite_border, size: 18, color: Colors.black87),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      '\$price',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF00B517),
                      ),
                    ),
                    const Spacer(),
                    const Icon(Icons.star, size: 14, color: Color(0xFFFFA726)),
                    const SizedBox(width: 4),
                    Text(
                      '$rating',
                      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      ' ($reviews)',
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBrandChip(String name, Color color, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 14, color: Colors.white),
          ),
          const SizedBox(width: 10),
          Text(
            name,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDealCard(String price, String label, Color color, String imageUrl) {
    return Container(
      width: 220,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(bottom: Radius.circular(8)),
              child: Image.network(
                imageUrl,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.white.withOpacity(0.5),
                    child: const Icon(Icons.image, size: 60, color: Colors.grey),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSmallProductCard(String name, double price, String imageUrl) {
    return Container(
      width: 220,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                child: Image.network(
                  imageUrl,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 180,
                      color: Colors.grey[100],
                      child: const Center(
                        child: Icon(Icons.image, size: 50, color: Colors.grey),
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: const Icon(Icons.favorite_border, size: 16, color: Colors.black87),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    color: Colors.black87,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Text(
                  '\$price',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00B517),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLargeBanner(String title, String subtitle, String imageUrl) {
    return Container(
      height: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
            colors: [
              Colors.black.withOpacity(0.6),
              Colors.transparent,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black87,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Shop Now',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShopCard(String title, String imageUrl, Color color) {
    return Container(
      width: 280,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Shop Now',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
            child: Image.network(
              imageUrl,
              width: 120,
              height: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 120,
                  color: Colors.white.withOpacity(0.5),
                  child: const Icon(Icons.image, size: 40, color: Colors.grey),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard(String title, String subtitle, Color color, String imageUrl) {
    return Container(
      height: 220,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
              imageUrl,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.help_outline, size: 40, color: Colors.grey),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[700],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

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
        ...items.map((item) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Text(
            item,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
        )),
      ],
    );
  }}