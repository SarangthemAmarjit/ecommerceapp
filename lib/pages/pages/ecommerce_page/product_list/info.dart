import 'package:ecommerceapp/pages/view/landing/controller/landing_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class InfoBar extends StatelessWidget {
  final void Function()? ontapclosebutton;
  const InfoBar({super.key, this.ontapclosebutton});

  @override
  Widget build(BuildContext context) {
    final mqSize = MediaQuery.of(context).size;

    final highlights = [
      {'icon': LucideIcons.truck, 'text': 'Free Delivery on orders above ₹499'},
      {'icon': LucideIcons.rotateCcw, 'text': 'Easy Returns within 7 days'},
      {'icon': LucideIcons.shieldCheck, 'text': '100% Secure Payment'},
      {'icon': LucideIcons.headphones, 'text': '24/7 Customer Support'},
    ];
    LandingController lancon = Get.put(LandingController());

    return Container(
      color: const Color.fromARGB(255, 234, 245, 235),
      width: mqSize.width,
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// Highlights section (center-aligned)
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  width: mqSize.width - 80,

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: highlights.map((item) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Row(
                          children: [
                            Icon(
                              item['icon'] as IconData,
                              size: 20,
                              color: Colors.green[800],
                            ),
                            const SizedBox(width: 8),
                            Text(
                              item['text'] as String,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),

          /// Close button (right side)
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: const Icon(Icons.close, size: 22, color: Colors.black54),

              onPressed: ontapclosebutton,
            ),
          ),
        ],
      ),
    );
  }
}
