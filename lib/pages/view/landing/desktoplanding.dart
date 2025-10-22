import 'package:ecommerceapp/pages/view/landing/controller/landing_controller.dart';
import 'package:ecommerceapp/pages/view/landing/landing2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DesktopLandingPage extends StatelessWidget {
  const DesktopLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    // Responsive paddings
    double horizontalPadding() {
      if (width < 600) return 12;
      if (width < 900) return 24;
      if (width < 1200) return 40;
      return 160;
    }

    // Responsive grid columns for services
    int serviceGridCount() {
      if (width < 600) return 1;
      if (width < 900) return 2;
      return 3;
    }

    Widget buildHeroContent() {
      final LandingController lancon = Get.put(LandingController());
      return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height - 88,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,

            image: AssetImage('assets/images/banner.webp'),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 150, top: 165),
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

    // Responsive hero height
    double heroHeight() {
      if (width < 600) return 220;
      if (width < 900) return 320;
      return 480;
    }

    double sectionTitleSize() {
      if (width < 600) return 18;
      if (width < 900) return 20;
      return 27;
    }

    double ctaTitleSize() {
      if (width < 600) return 22;
      if (width < 900) return 28;
      return 36;
    }

    return Column(
      children: [
        // Header

        // Hero Section
        SizedBox(
          width: double.infinity,

          child: Column(
            children: [
              buildHeroContent(),

              // Aboutus(isfromlanding: true),
              // Our Services Section
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: Column(
                  children: [
                    HomePage22(),
                    // ServicesSection(
                    //   width: width,
                    //   headerfontsize: sectionTitleSize(),
                    //   gridcount: serviceGridCount(),
                    // ),

                    // About Us Section

                    // Our Mission Section

                    // Our Projects Section

                    // CTA Section
                  ],
                ),
              ),

              // FooterSection(),
            ],
          ),
        ),
      ],
    );
  }
}
