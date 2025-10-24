import 'dart:developer';

import 'package:ecommerceapp/pages/pages/ecommerce_page/product_details/product_details_view.dart';
import 'package:ecommerceapp/pages/pages/ecommerce_page/product_list/product_list_view.dart';
import 'package:ecommerceapp/pages/view/landing/components/DealPage.dart';
import 'package:ecommerceapp/pages/view/landing/components/Whatsnewpage.dart';
import 'package:ecommerceapp/pages/view/landing/components/deliverypage.dart';
import 'package:ecommerceapp/pages/view/landing/controller/landing_controller.dart';
import 'package:ecommerceapp/pages/view/landing/desktoplanding.dart';
import 'package:ecommerceapp/pages/view/landing/widget/navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainMobileLandingpage extends StatefulWidget {
  const MainMobileLandingpage({super.key});

  @override
  State<MainMobileLandingpage> createState() => _MainMobileLandingpageState();
}

class _MainMobileLandingpageState extends State<MainMobileLandingpage> {
  final TextEditingController searchController = TextEditingController();

  bool showCategoryDropdown = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void toggleCategoryDropdown() {
    setState(() {
      showCategoryDropdown = !showCategoryDropdown;
    });
  }

  Widget getPage(String title) {
    switch (title) {
      case 'landing':
        return const DesktopLandingPage();

      case 'productlist':
        return const ProductListView();

      case 'productdetails':
        return const ProductDetailsView();
      case 'Deals':
        return const Dealpage();
      case 'What\'s New':
        return const Whatsnewpage();
      case 'Delivery':
        return const Deliverypage();
      default:
        return const DesktopLandingPage();
    }
  }

  Widget _buildNavItem(String title, {bool hasDropdown = false}) {
    LandingController lancon = Get.put(LandingController());
    final isSelected = lancon.currentPage == title;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: AnimatedNavItem(
        title: title,
        isSelected: isSelected,
        hasDropdown: hasDropdown,
        showCategoryDropdown: showCategoryDropdown,
        onTap: () {
          if (hasDropdown && title == 'Category') {
            toggleCategoryDropdown();
          } else {
            lancon.setcurrentpage(title);
          }
        },
      ),
    );
  }

  Widget _buildCategoryDropdown() {
    final categories = [
      {
        'icon': Icons.chair_outlined,
        'name': 'Furniture',
        'items': '240 Item Available',
        'color': Colors.grey.shade700,
      },
      {
        'icon': Icons.shopping_bag_outlined,
        'name': 'Hand Bag',
        'items': '240 Item Available',
        'color': Colors.pink.shade300,
      },
      {
        'icon': Icons.sports_soccer_outlined,
        'name': 'Shoe',
        'items': '240 Item Available',
        'color': Colors.orange.shade200,
      },
      {
        'icon': Icons.headphones_outlined,
        'name': 'Headphone',
        'items': '240 Item Available',
        'color': Colors.grey.shade700,
      },
      {
        'icon': Icons.laptop_outlined,
        'name': 'Laptop',
        'items': '240 Item Available',
        'color': Colors.pink.shade100,
      },
      {
        'icon': Icons.book_outlined,
        'name': 'Book',
        'items': '240 Item Available',
        'color': Colors.orange.shade300,
      },
    ];
    final double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        setState(() {
          showCategoryDropdown = false;
        });
      },
      child: Container(
        color: Colors.transparent,
        child: Stack(
          children: [
            Positioned(
              top: width >= 800 && width < 1100 ? 40 : -15,
              left: 0,
              right: 0,
              child: Center(
                child: GestureDetector(
                  onTap: () {}, // Prevent closing when clicking on dropdown
                  child: Container(
                    width: 800,
                    margin: const EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Popular Categories',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 25),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 15,
                                mainAxisSpacing: 15,
                                childAspectRatio: 2.8,
                              ),
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            final category = categories[index];
                            return _buildCategoryItem(
                              category['icon'] as IconData,
                              category['name'] as String,
                              category['items'] as String,
                              category['color'] as Color,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem(
    IconData icon,
    String name,
    String items,
    Color iconColor,
  ) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          setState(() {
            showCategoryDropdown = false;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, size: 32, color: iconColor),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      items,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconButton(IconData icon, String label) {
    LandingController lancon = Get.put(LandingController());
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => lancon.setcurrentpage(label),
        child: Row(
          children: [
            Icon(icon, size: 24, color: Colors.grey.shade800),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade800,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerContent() {
    final categories = [
      {'icon': Icons.chair_outlined, 'name': 'Furniture'},
      {'icon': Icons.shopping_bag_outlined, 'name': 'Hand Bag'},
      {'icon': Icons.sports_soccer_outlined, 'name': 'Shoe'},
      {'icon': Icons.headphones_outlined, 'name': 'Headphone'},
      {'icon': Icons.laptop_outlined, 'name': 'Laptop'},
      {'icon': Icons.book_outlined, 'name': 'Book'},
    ];

    LandingController lancon = Get.put(LandingController());

    return ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: const BoxDecoration(color: Colors.white),
          child: Row(
            children: [
              SizedBox(
                width: 48,
                height: 48,
                child: Image.asset('assets/images/logo.webp', height: 30),
              ),
              const SizedBox(width: 12),
              const Text(
                'Shopcart',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        ExpansionTile(
          leading: const Icon(Icons.category_outlined),
          title: const Text('Category'),
          children: categories
              .map(
                (c) => ListTile(
                  leading: Icon(c['icon'] as IconData),
                  title: Text(c['name'] as String),
                  onTap: () {
                    // Implement specific category navigation if needed
                    lancon.setcurrentpage('Category');
                    Navigator.of(context).pop();
                  },
                ),
              )
              .toList(),
        ),
        ListTile(
          leading: const Icon(Icons.local_offer_outlined),
          title: const Text('Deals'),
          onTap: () {
            lancon.setcurrentpage('Deals');
            Navigator.of(context).pop();
          },
        ),
        ListTile(
          leading: const Icon(Icons.new_releases_outlined),
          title: const Text('What\'s New'),
          onTap: () {
            lancon.setcurrentpage('What\'s New');
            Navigator.of(context).pop();
          },
        ),
        ListTile(
          leading: const Icon(Icons.delivery_dining_outlined),
          title: const Text('Delivery'),
          onTap: () {
            lancon.setcurrentpage('Delivery');
            Navigator.of(context).pop();
          },
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.shopping_cart_outlined),
          title: const Text('Cart'),
          onTap: () {
            lancon.setcurrentpage('Cart');
            Navigator.of(context).pop();
          },
        ),
        ListTile(
          leading: const Icon(Icons.login),
          title: const Text('Login'),
          onTap: () {
            // Navigate to login
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final LandingController landcon = Get.put(LandingController());
    final double width = MediaQuery.of(context).size.width;
    return GetBuilder<LandingController>(
      builder: (_) {
        return Scaffold(
          key: _scaffoldKey,
          drawer: width < 1100 ? Drawer(child: _buildDrawerContent()) : null,
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            toolbarHeight: 80,
            titleSpacing: 0,
            leading: width < 1100
                ? IconButton(
                    icon: const Icon(Icons.menu, color: Colors.black87),
                    onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                  )
                : null,
            title: Container(
              height: 75,
              padding: EdgeInsets.only(
                left: width < 1100 ? 16 : 150,
                right: 20,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Logo
                  InkWell(
                    onTap: () {
                      log('clicking landingdsds');
                      landcon.setcurrentpage('landing');
                    },
                    child: Row(
                      children: [
                        SizedBox(
                          width: 40,
                          height: 40,
                          child: Image.asset(
                            height: 30,
                            'assets/images/logo.webp',
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'Shopcart',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 61, 41),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  // Navigation Menu for wide screens
                  if (width >= 1100)
                    Row(
                      children: [
                        _buildNavItem('Category', hasDropdown: true),
                        const SizedBox(width: 30),
                        _buildNavItem('Deals'),
                        const SizedBox(width: 30),
                        _buildNavItem('What\'s New'),
                        const SizedBox(width: 30),
                        _buildNavItem('Delivery'),
                      ],
                    ),
                  const Spacer(),
                  // Search Bar
                  Container(
                    width: width < 600 ? 160 : 300,
                    height: 35,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: 'Search Product',
                        hintStyle: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 14,
                        ),
                        suffixIcon: InkWell(
                          onTap: () {},
                          child: const Icon(Icons.search),
                        ),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  // Cart
                  if (width >= 600)
                    _buildIconButton(Icons.shopping_cart_outlined, 'Cart'),
                  const SizedBox(width: 12),
                  if (width >= 800)
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        side: const BorderSide(color: Colors.blue),
                      ),
                      child: const Text(
                        "Login",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                ],
              ),
            ),
          ),
          body: GetBuilder<LandingController>(
            builder: (_) {
              return Stack(
                children: [
                  Column(
                    children: [
                      if (width >= 800 && width < 1100)
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildNavItem('Category', hasDropdown: true),
                              const SizedBox(width: 30),
                              _buildNavItem('Deals'),
                              const SizedBox(width: 30),
                              _buildNavItem('What\'s New'),
                              const SizedBox(width: 30),
                              _buildNavItem('Delivery'),
                            ],
                          ),
                        ),
                      Expanded(
                        child: SingleChildScrollView(
                          controller: landcon.scrollController,
                          child: landcon.currentPage == 'landing'
                              ? getPage(landcon.currentPage)
                              : Column(
                                  children: [getPage(landcon.currentPage)],
                                ),
                        ),
                      ),
                    ],
                  ),
                  if (showCategoryDropdown && width >= 1100)
                    _buildCategoryDropdown(),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
