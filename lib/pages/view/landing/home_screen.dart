import 'package:ecommerceapp/layout/base_layout.dart';
import 'package:ecommerceapp/pages/pages/mobile/mainmobilehomepage.dart';
import 'package:ecommerceapp/pages/pages/mobile/mobilelandingpage.dart';
import 'package:ecommerceapp/pages/view/landing/components/mainlandingpage.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      mobile: MainMobileLandingpage(),
      tablet: MainMobileLandingpage(),
      desktop: MainLandingpage(),
    );
  }
}
