
import 'package:ecommerceapp/pages/login/controller/login_controller.dart';
import 'package:ecommerceapp/pages/login/controller/networkcontroller.dart';
import 'package:ecommerceapp/pages/login/login_screen.dart';
import 'package:ecommerceapp/pages/pages/handlerpage.dart';
import 'package:ecommerceapp/pages/view/landing/controller/landing_controller.dart';
import 'package:ecommerceapp/pages/view/landing/home_screen.dart';
import 'package:ecommerceapp/routes/homemiddleware.dart';
import 'package:ecommerceapp/routes/loginmiddleware.dart';
import 'package:get/get.dart';


import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.handler,
      page: () => const HandlerPage(),
      middlewares: [Homemiddleware()],
      // page: () => const DirectorateMISPage(),
      binding: BindingsBuilder(() => Get.lazyPut(() => NetworkController())),
    ),


    GetPage(
      name: AppRoutes.home,
      page: () =>  HomeScreen(),
      // page: () => const DirectorateMISPage(),
      middlewares: [Homemiddleware()],
      binding: BindingsBuilder(() => Get.lazyPut(() => LandingController())),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () =>  AdminLoginScreen(),
      middlewares: [Loginmiddleware()],
      binding: BindingsBuilder(() => Get.lazyPut(() => LoginController())),
    ),

    // GetPage(
    //   name: AppRoutes.admindashboard,
    //   page: () => const AdminMainPage(),
    //   middlewares: [Admindashboardmiddleware()],
    //   binding: BindingsBuilder(() => Get.lazyPut(() => AdminController())),
    // ),
  ];
}
