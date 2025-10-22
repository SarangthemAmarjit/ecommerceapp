import 'package:ecommerceapp/pages/login/controller/login_controller.dart';
import 'package:ecommerceapp/pages/login/controller/networkcontroller.dart';
import 'package:ecommerceapp/pages/view/landing/controller/landing_controller.dart';
import 'package:get/get.dart';



class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkController());
    Get.put(LoginController());
    // Get.put(AdminController());
    Get.put(LandingController());
  }
}
