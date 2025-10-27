import 'dart:developer';

import 'package:ecommerceapp/core/helpers/fuctions/_get_image.dart';
import 'package:ecommerceapp/pages/pages/ecommerce_page/product_details/product_details_view.dart';
import 'package:ecommerceapp/pages/pages/ecommerce_page/product_list/product_list_view.dart';
import 'package:ecommerceapp/pages/view/landing/components/DealPage.dart';
import 'package:ecommerceapp/pages/view/landing/components/Whatsnewpage.dart';
import 'package:ecommerceapp/pages/view/landing/components/deliverypage.dart';
import 'package:ecommerceapp/pages/view/landing/controller/landing_controller.dart';
import 'package:ecommerceapp/pages/view/landing/desktoplanding.dart';
import 'package:ecommerceapp/pages/view/landing/widget/navbar.dart';
import 'package:ecommerceapp/providers/_ecommerce_product_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '/core/generated/l10n.dart' as l;

class MainLandingpage extends StatefulWidget {
  const MainLandingpage({super.key});

  @override
  State<MainLandingpage> createState() => _MainLandingpageState();
}

class _MainLandingpageState extends State<MainLandingpage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController searchController = TextEditingController();



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
            showCategoryDropdown: lancon.showCategoryDropdown,
            onTap: () {
              if (hasDropdown && title == 'Category') {
                lancon.toggleCategoryDropdown();
              } else {
                lancon.setcurrentpage(title);
              }
            },
          ),
        );
      },
    );
  }

  Widget _buildCategoryDropdown(LandingController lancon) {
    final categories = [
      {
        'icon':
            "assets/images/widget_images/dashboard_overview_icon/ecommerce_admin_icons/category_icons/all_category.svg",
        'name': l.S.current.allCategory,
        'items': '240 Item Available',
        'color': Colors.grey.shade700,
      },
      {
        'icon':
            "assets/images/widget_images/dashboard_overview_icon/ecommerce_admin_icons/category_icons/t_shirts.svg",
        'name': l.S.current.tShirts,

        'items': '240 Item Available',
        'color': Colors.pink.shade300,
      },
      {
        'icon':
            "assets/images/widget_images/dashboard_overview_icon/ecommerce_admin_icons/category_icons/shoes.svg",
        'name': l.S.current.shoes,

        'items': '240 Item Available',
        'color': Colors.orange.shade200,
      },
      {
        'icon':
            "assets/images/widget_images/dashboard_overview_icon/ecommerce_admin_icons/category_icons/woman_bag.svg",
        'name': l.S.current.womanBag,

        'items': '240 Item Available',
        'color': Colors.grey.shade700,
      },
      {
        'icon':
            "assets/images/widget_images/dashboard_overview_icon/ecommerce_admin_icons/category_icons/fresh_food.svg",
        'name': l.S.current.freshFood,

        'items': '240 Item Available',
        'color': Colors.pink.shade100,
      },
      {
        'icon':
            "assets/images/widget_images/dashboard_overview_icon/ecommerce_admin_icons/category_icons/computer.svg",
        'name': l.S.current.electronics,

        'items': '240 Item Available',
        'color': Colors.orange.shade300,
      },
    ];
    final double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        lancon.toggleCategoryDropdown();
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
                              category['icon'] as String,
                              category['name'] as String,
                              category['items'] as String,
                              category['color'] as Color,
                              lancon,
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
    String icon,
    String name,
    String items,
    Color iconColor,
    LandingController lancon,
  ) {
    return Consumer<ECommerceMockProductsNotifier>(
      builder: (context, ec, child) {
        return MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              lancon.toggleCategoryDropdown();
              ec.setSelectedCategory(name);
              lancon.setcurrentpage('productlist');
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
                      color:Colors.teal.shade50,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: AnimageWidget(imagePath: icon),
        
                    // Image.asset(icon, width: 32, height: 32),
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
              SizedBox(
                width: 300,
                height: 45,

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
              if (landcon.showCategoryDropdown) _buildCategoryDropdown(landcon),
            ],
          );
        },
      ),
    );
  }
}
