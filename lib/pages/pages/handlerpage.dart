import 'package:ecommerceapp/config/responsive.dart';
import 'package:ecommerceapp/pages/login/controller/networkcontroller.dart';
import 'package:ecommerceapp/pages/pages/servererrorpage.dart';
import 'package:ecommerceapp/pages/view/landing/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';



class HandlerPage extends StatelessWidget {
  const HandlerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final NetworkController netcon = Get.put(NetworkController());
    final ismob = Responsive.isMobile(context);
    return Obx(() {
      return netcon.iservererror.value
          ? ServerErrorPage()
          : netcon.isLoading.value
          ? Center(
            child: SizedBox(
              height: ismob ? 50 : 70,
              child: Lottie.asset('assets/images/loading.json'),
            ),
          )
          : HomeScreen();
    });
  }
}
