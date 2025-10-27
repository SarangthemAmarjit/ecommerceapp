import 'package:ecommerceapp/config/constants.dart';
import 'package:ecommerceapp/pages/view/landing/controller/landing_controller.dart';
import 'package:ecommerceapp/providers/_ecommerce_product_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class HomePage22 extends StatelessWidget {
  HomePage22({super.key});

  @override
  Widget build(BuildContext context) {
    LandingController lancon = Get.put(LandingController());
    return Consumer<ECommerceMockProductsNotifier>(
      builder: (context, productNotifier, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
        
            // Shop Our Top Categories
            _buildSectionHeader('Shop Our Top Categories'),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final maxWidth = constraints.maxWidth;
        
                  int crossAxisCount = 6;
                  if (maxWidth < 1400) crossAxisCount = 5;
                  if (maxWidth < 1100) crossAxisCount = 4;
                  if (maxWidth < 900) crossAxisCount = 3;
                  if (maxWidth < 600) crossAxisCount = 2;
                  if (maxWidth < 400) crossAxisCount = 1;
        
                  // calculate a sensible childAspectRatio so cards keep consistent height
                  final spacing = 16.0 * (crossAxisCount - 1);
                  final tileWidth = (maxWidth - spacing) / crossAxisCount;
                  const tileHeight = 210;
                  final childAspectRatio = tileWidth / tileHeight;
        
                  return GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: categories.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: childAspectRatio,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          productNotifier.setSelectedCategory(  categories[index]['title']);
                          lancon.setcurrentpage('productlist');
                        },
                        child: _buildCategoryCard(
                          title: categories[index]['title'],
                          color: categories[index]['color'],
                          imageUrl: categories[index]['image'],
                        ),
                      );
                    },
                  );
                },
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
                  image: NetworkImage(
                    'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=1200',
                  ),
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
                              style: TextStyle(fontSize: 14, color: Colors.white),
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
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final maxWidth = constraints.maxWidth;
        
                  int crossAxisCount = 4;
                  if (maxWidth < 1400) crossAxisCount = 4;
                  if (maxWidth < 1100) crossAxisCount = 3;
                  if (maxWidth < 900) crossAxisCount = 2;
                  if (maxWidth < 600) crossAxisCount = 1;
        
                  // calculate a sensible childAspectRatio so cards keep consistent height
                  final spacing = 16.0 * (crossAxisCount - 1);
                  final tileWidth = (maxWidth - spacing) / crossAxisCount;
                  const tileHeight = 360;
                  final childAspectRatio = tileWidth / tileHeight;
        
                  // ensure card doesn't exceed its internal preferred width (260)
                  double cardMaxWidth = tileWidth < 260 ? tileWidth : 260;
        
                  return GridView.builder(
                    itemCount: products.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: childAspectRatio,
                    ),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return Center(
                        child: SizedBox(
                          width: cardMaxWidth,
                          child: _buildSmallProductCard(
                            name: product['name'],
                            price: product['price'],
                            imageUrl: product['imageUrl'],
                            description: product['description'],
                            rating: product['rating'],
                            reviews: product['reviews'],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 50),
        
            // // Trending Products For You
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
        
            // // Services To Help You Shop
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
          ],
        );
      }
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
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildCategoryCard({
    required String title,
    required Color color,
    required String imageUrl,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(8),
      ),
      elevation: 10,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 154, 167, 163)),
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        imageUrl,

                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 90,
                            width: 90,
                            color: Colors.white.withOpacity(0.5),
                            child: const Icon(
                              Icons.image,
                              size: 40,
                              color: Colors.white,
                            ),
                          );
                        },
                      ),
                      // Dark overlay to give image a darker, semi-transparent look
                      Positioned.fill(
                        child: Container(color: Colors.black.withOpacity(0.2)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.white,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(
    String name,
    double price,
    double rating,
    int reviews,
    String imageUrl,
  ) {
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
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(8),
                ),
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
                  child: const Icon(
                    Icons.favorite_border,
                    size: 18,
                    color: Colors.black87,
                  ),
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
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
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
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
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

  Widget _buildDealCard(
    String price,
    String label,
    Color color,
    String imageUrl,
  ) {
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
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(8),
              ),
              child: Image.network(
                imageUrl,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.white.withOpacity(0.5),
                    child: const Icon(
                      Icons.image,
                      size: 60,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool isHovered = false;
  Widget _buildSmallProductCard({
    required String name,
    required double price,
    required String imageUrl,
    String description = '',
    double rating = 5.0,
    int reviews = 121,
  }) {
    return StatefulBuilder(
      builder: (context, setState) {
        return MouseRegion(
          onEnter: (_) => setState(() => isHovered = true),
          onExit: (_) => setState(() => isHovered = false),
          child: InkWell(
            onTap: () {},
            child: Container(
              width: 260,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: const Color.fromARGB(255, 202, 202, 202),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(8),
                        ),
                        child: AnimatedScale(
                          scale: isHovered ? 1.08 : 1.0,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          child: Image.network(
                            imageUrl,
                            height: 160,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                height: 160,
                                color: Colors.grey[100],
                                child: const Center(
                                  child: Icon(
                                    Icons.image,
                                    size: 50,
                                    color: Colors.grey,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Title + Price Row
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        name,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15,
                                          color: Colors.black87,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Text(
                                      '\$${price.toStringAsFixed(2)}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),

                                // Description
                                Text(
                                  description,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.black54,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),

                                const SizedBox(height: 8),

                                // Rating Row
                                Row(
                                  children: [
                                    Row(
                                      children: List.generate(
                                        5,
                                        (index) => const Icon(
                                          Icons.star,
                                          size: 16,
                                          color: Colors.green,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      '($reviews)',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          side: const BorderSide(color: Colors.black12),
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20,
                          ),
                        ),
                        child: const Text(
                          'Add to Cart',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
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
            colors: [Colors.black.withOpacity(0.6), Colors.transparent],
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
              style: const TextStyle(fontSize: 14, color: Colors.white70),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black87,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
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
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
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

  Widget _buildServiceCard(
    String title,
    String subtitle,
    Color color,
    String imageUrl,
  ) {
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
                  child: const Icon(
                    Icons.help_outline,
                    size: 40,
                    color: Colors.grey,
                  ),
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
            style: TextStyle(fontSize: 12, color: Colors.grey[700]),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
