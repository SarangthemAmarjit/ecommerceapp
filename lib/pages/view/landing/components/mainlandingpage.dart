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

class MainLandingpage extends StatefulWidget {
  const MainLandingpage({super.key});

  @override
  State<MainLandingpage> createState() => _MainLandingpageState();
}

class _MainLandingpageState extends State<MainLandingpage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController searchController = TextEditingController();

  bool showCategoryDropdown = false;

  void toggleCategoryDropdown() {
    setState(() {
      showCategoryDropdown = !showCategoryDropdown;
    });
  }

  Widget getPage(String title) {
    final isDesktop = MediaQuery.of(context).size.width >= 992;
    switch (title) {
      case 'landing':
        return const DesktopLandingPage();
      case 'productlist':
        return
        // isDesktop
        //     ? const ProductListViewDesk()
        //     :
        const ProductListView();

      case 'productdetails':
        return const ProductDetailsView();

      case 'Deals':
        return const Dealpage();
      case 'What\'s New':
        return const Whatsnewpage();
      case 'Delivery':
        return const Deliverypage();
      //   return const MainPage();
      // case 'About Us':
      //   return AboutusPage();

      // case 'Impact & Recognition':
      //   return GovernanceImpactPage();
      // case 'Core Responsibilities':
      //   return CoreResponsibilitiesPage();
      // case 'Organisation Structure':
      //   return OrganisationalStructurePage();
      // case 'CMIS Components & Modules':
      //   return ComponentsModulesTablePage();
      // case 'Download':
      //   return Downloadpage();
      // case 'Contact Us':
      //   return ContactUsPage();
      // case 'RTI':
      //   return Rtipage();
      // case 'search':
      //   return SearchResultPage();
      // case 'Notices':
      //   return MainNotificationsPage();
      // case 'Employee Data':
      //   return EmployeeDatapage();
      // case 'Sanctioned Post Details':
      //   return SanctionedPostDetailsPage();
      // case 'Payroll Generation':
      //   return Payrollgeneration();
      // case 'NPS':
      //   return NpsPage();
      // case 'gallery':
      //   return GallerySection();
      default:
        return const DesktopLandingPage();
    }
  }

  Widget _buildNavItem(String title, {bool hasDropdown = false}) {
    LandingController lancon = Get.find<LandingController>();

    return GetBuilder<LandingController>(
      builder: (_) {
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
      },
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

  @override
  Widget build(BuildContext context) {
    final LandingController landcon = Get.find<LandingController>();
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: scaffoldKey,
      // backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 80,

        titleSpacing: 0,
        title: Container(
          height: 75,
          padding: const EdgeInsets.only(left: 150, right: 20),
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
                  log('clicking landing');
                  landcon.setcurrentpage('landing');
                },
                child: Row(
                  children: [
                    SizedBox(
                      width: 40,
                      height: 40,

                      child: Image.asset(height: 30, 'assets/images/logo.webp'),
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
              const SizedBox(width: 60),
              // Navigation Menu
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
                width: 300,
                height: 45,
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
                      onTap: () {
                        // admincon.performSearch(
                        //   landcon.searchcont.text.trim(),
                        // );
                      },

                      child: Icon(Icons.search),
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 30),
              // Account

              // Cart
              _buildIconButton(Icons.shopping_cart_outlined, 'Cart'),
              const SizedBox(width: 20),
              OutlinedButton(
                onPressed: () {
                  // log('login');
                  // Get.toNamed(AppRoutes.login);
                },
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

                  // TopNavWithModalMenu(),
                  Expanded(
                    child: SingleChildScrollView(
                      controller: landcon.scrollController,
                      child: landcon.currentPage == 'landing'
                          ? getPage(landcon.currentPage)
                          : Column(
                              children: [
                                getPage(landcon.currentPage),
                                // FooterSection(),
                              ],
                            ),
                    ),
                  ),
                ],
              ),
              if (showCategoryDropdown) _buildCategoryDropdown(),
            ],
          );
        },
      ),
    );
  }
}
