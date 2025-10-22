import 'dart:developer';

import 'package:ecommerceapp/pages/login/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Homemiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final logcon = Get.find<LoginController>();

    if (!logcon.istokenexist && !logcon.istokenvalid) {
      if (logcon.username != null) {
        return const RouteSettings(name: '/admindashboard');
      } else {
        return null;
      }
    } else {
      log('here home');
      return const RouteSettings(name: '/admindashboard');
    }
  }
}
