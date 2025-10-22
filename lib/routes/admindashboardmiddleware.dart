import 'dart:developer';

import 'package:ecommerceapp/pages/login/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class Admindashboardmiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final logcon = Get.find<LoginController>();

    if (!logcon.istokenexist && !logcon.istokenvalid) {
      log('!logcon.istokenexist && !logcon.istokenvalid)');
      if (logcon.username != null) {
        return null;
      } else {
        return const RouteSettings(name: '/login');
      }
    } else {
      return null;
    }

    // allow
  }
}
