import 'dart:math' as math;

import 'package:ecommerceapp/pages/view/landing/components/footer.dart';
import 'package:ecommerceapp/pages/view/landing/controller/landing_controller.dart';
import 'package:ecommerceapp/pages/view/landing/landing2.dart';
import 'package:ecommerceapp/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class DesktopLandingPage extends StatelessWidget {
  const DesktopLandingPage({super.key});

  Widget buildHeroContent(BuildContext context) {
    final lancon = Get.put(LandingController());
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    // Breakpoints
    final isMobile = width < 600;
    final isTablet = width >= 600 && width < 1024;
    final isDesktop = width >= 1024;

    // Responsive measurements
    final leftPadding = isDesktop
        ? math.max(64.0, width * 0.12)
        : isTablet
        ? math.max(48.0, width * 0.08)
        : 20.0;
    final topPadding = isDesktop
        ? math.max(80.0, height * 0.23)
        : isTablet
        ? math.max(40.0, height * 0.23)
        : 100.0;

    final titleFontSize = (width * 0.055).clamp(20.0, 65.0).toDouble();
    final subtitleFontSize = (width * 0.018).clamp(12.0, 18.0).toDouble();

    final subtitleMaxWidth = math.min(500.0, width * (isMobile ? 0.9 : 0.45));
    final heroHeight = isMobile
        ? height * 0.6
        : math.min(height - 88, height * 0.9);

    final buttonHorizontalPadding = isMobile ? 24.0 : 50.0;
    final buttonVerticalPadding = isMobile ? 12.0 : 18.0;
    final buttonRadius = isMobile ? 10.0 : 15.0;
    final buttonFontSize = (width * 0.016).clamp(12.0, 16.0).toDouble();

    return Consumer<ECommerceMockProductsNotifier>(
      builder: (context, productNotifier, child) {
        return Container(
          width: double.infinity,
          height: heroHeight,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/banner.webp'),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              left: leftPadding,
              top: topPadding,
              right: isMobile ? 20 : 40,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  'Shopping And\nDepartment Store.',
                  style: TextStyle(
                    fontSize: titleFontSize,
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 0, 61, 41),
                    height: 1.1,
                  ),
                ),

                SizedBox(height: isMobile ? 16 : 30),

                // Subtitle / description
                SizedBox(
                  width: subtitleMaxWidth,
                  child: Text(
                    'Shopping is a bit of a relaxing hobby for me, which\nis sometimes troubling for the bank balance.',
                    style: TextStyle(
                      fontSize: subtitleFontSize,
                      color: Colors.grey.shade800,
                      height: 1.6,
                    ),
                  ),
                ),

                SizedBox(height: isMobile ? 20 : 40),

                // CTA Button
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      productNotifier.setSelectedCategory('All Category');
                      lancon.setcurrentpage('productlist');
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(buttonRadius),
                      ),
                      elevation: 8,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: buttonHorizontalPadding,
                          vertical: buttonVerticalPadding,
                        ),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 0, 61, 41),
                          borderRadius: BorderRadius.circular(buttonRadius),
                        ),
                        child: Text(
                          'Get Started',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: buttonFontSize,
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
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isNarrow = width < 1200;

    return Column(
      children: [
        // Hero Section
        SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              buildHeroContent(context),

              // Main content constrained for wide screens
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: Column(
                  children: [
                    HomePage22(),
                    // additional sections...
                  ],
                ),
              ),

              MainFooter(),
            ],
          ),
        ),
      ],
    );
  }
}
