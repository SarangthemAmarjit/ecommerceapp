import 'package:ecommerceapp/routes/app_bindings.dart';
import 'package:ecommerceapp/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(const ShopcartApp());
}

class ShopcartApp extends StatelessWidget {
  const ShopcartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Shopcart',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'KulimPark', useMaterial3: false),
      initialBinding: AppBindings(),
      getPages: AppPages.pages,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedPage = 'Home';
  final TextEditingController searchController = TextEditingController();
  bool showCategoryDropdown = false;

  void navigateTo(String page) {
    setState(() {
      selectedPage = page;
      showCategoryDropdown = false;
    });
  }

  void toggleCategoryDropdown() {
    setState(() {
      showCategoryDropdown = !showCategoryDropdown;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
                onTap: () => navigateTo('Home'),
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
              _buildNavItem('Category', hasDropdown: true),
              const SizedBox(width: 30),
              _buildNavItem('Deals'),
              const SizedBox(width: 30),
              _buildNavItem('What\'s New'),
              const SizedBox(width: 30),
              _buildNavItem('Delivery'),
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
      body: Stack(
        children: [
          Column(
            children: [
              // Navigation Bar

              // Main Content
              Expanded(child: _buildContent()),
            ],
          ),
          // Category Dropdown
          if (showCategoryDropdown) _buildCategoryDropdown(),
        ],
      ),
    );
  }

  Widget _buildNavItem(String title, {bool hasDropdown = false}) {
    final isSelected = selectedPage == title;
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
            navigateTo(title);
          }
        },
      ),
    );
  }

  Widget _buildIconButton(IconData icon, String label) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => navigateTo(label),
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

  Widget _buildContent() {
    if (selectedPage == 'Home' || selectedPage == 'Category') {
      return _buildHomeContent();
    } else {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.info_outline, size: 80, color: Colors.grey.shade400),
            const SizedBox(height: 20),
            Text(
              '$selectedPage Page',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade700,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'This page is under construction',
              style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
            ),
          ],
        ),
      );
    }
  }

  Widget _buildHomeContent() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,

          image: AssetImage('assets/images/banner.webp'),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 150, top: 175),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Shopping And\nDepartment Store.',
              style: TextStyle(
                fontSize: 65,
                letterSpacing: 3,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 61, 41),
                height: 1.2,
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 500,
              child: Text(
                'Shopping is a bit of a relaxing hobby for me, which\nis sometimes troubling for the bank balance.',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey.shade800,
                  height: 1.6,
                ),
              ),
            ),
            const SizedBox(height: 40),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  // Learn More action
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Learn More clicked!'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(15),
                  ),

                  elevation: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 18,
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 0, 61, 41),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Text(
                      'Learn More',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
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
              top: 75,
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
            selectedPage = name;
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

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}

class AnimatedNavItem extends StatefulWidget {
  final String title;
  final bool isSelected;
  final bool hasDropdown;
  final bool showCategoryDropdown;
  final VoidCallback onTap;

  const AnimatedNavItem({
    super.key,
    required this.title,
    required this.isSelected,
    required this.hasDropdown,
    required this.showCategoryDropdown,
    required this.onTap,
  });

  @override
  State<AnimatedNavItem> createState() => _AnimatedNavItemState();
}

class _AnimatedNavItemState extends State<AnimatedNavItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final bool isCategoryActive =
        widget.title == 'Category' && widget.showCategoryDropdown;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          alignment: Alignment.bottomCenter,
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.only(top: 4, bottom: 6),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isCategoryActive
                    ? Colors.blue.shade600
                    : widget.isSelected
                    ? Color.fromARGB(255, 0, 61, 41)
                    : isHovered
                    ? Color.fromARGB(255, 0, 61, 41)
                    : Colors.transparent,
                width: 3,
              ),
            ),
          ),
          child: Row(
            children: [
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: widget.isSelected || isHovered
                      ? FontWeight.w600
                      : FontWeight.w500,
                  color: isCategoryActive
                      ? Colors.blue.shade600
                      : widget.isSelected
                      ? Colors.green.shade900
                      : isHovered
                      ? Color.fromARGB(255, 0, 61, 41)
                      : Colors.grey.shade800,
                ),
                child: Text(widget.title),
              ),
              if (widget.hasDropdown) ...[
                const SizedBox(width: 4),
                Icon(
                  widget.showCategoryDropdown
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  size: 20,
                  color: isCategoryActive
                      ? Colors.blue.shade600
                      : isHovered
                      ? Color.fromARGB(255, 0, 61, 41)
                      : Colors.grey.shade800,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
