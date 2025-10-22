import 'package:ecommerceapp/config/responsive.dart';
import 'package:ecommerceapp/pages/login/desktop_login.dart';
import 'package:ecommerceapp/pages/login/mobile_login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class AdminLoginScreen extends StatelessWidget {
  const AdminLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (Responsive.isMobile(context)) {
          // Mobile layout
          return const Adminloginmobile();
        } else {
          // Desktop layout
          return const Adminlogindesktop();
        }
        // You can add more conditions for tablet or use your Responsive widget here
      },
    );
  }
}
