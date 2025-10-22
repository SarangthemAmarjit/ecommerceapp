import 'package:ecommerceapp/routes/app_bindings.dart';
import 'package:ecommerceapp/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ShopcartApp());
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
