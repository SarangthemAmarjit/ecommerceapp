import 'dart:developer';



import 'package:ecommerceapp/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class LandingController extends GetxController {
  TextEditingController searchcont = TextEditingController();
  String _helpcurrentpage = 'Employee Data';
  bool _issearching = false;
  bool get isSearching => _issearching;
  String get helpcurrentpage => _helpcurrentpage;
  String _currentpage = 'landing';
  String _currentmenu = 'home';
  String get currentmenu => _currentmenu;
  String? pendingScrollTarget;
  int _selectedmenuindex = 0;

  int _selectedadminpageindex = 0;
  String _admincurrentpage = 'dashboard';
  int get selectedmenuindex => _selectedmenuindex;
  String get currentPage => _currentpage;
  String get admincurrentpage => _admincurrentpage;
  int get selectedadminpageindex => _selectedadminpageindex;
  int _activeIndex = 0;
  int get activeindex => _activeIndex;
  int selectedItemIndex = -1;

  // Scroll logic
  final scrollController = ScrollController();

  @override
  void onInit() {
    // Get.find<AdminController>().getalldatas();
    super.onInit();
  }

  void toggleSelectedIndex(int index) {
    selectedItemIndex = selectedItemIndex == index ? -1 : index;
    update(); // triggers widget rebuild
  }

  setcarouselpageindex(int index) {
    _activeIndex = index;
    update();
  }

  setsearch({required bool issearch}) {
    _issearching = issearch;
    update();
  }

  void setcurrenthelppage(BuildContext context, page) {
    _helpcurrentpage = page;
    update();

    log(_helpcurrentpage.toString());

    // Get.toNamed(AppRoutes.howcanihelp);
  }

  // if (scrollTo != null) {
  //   pendingScrollTarget = page;
  //   checkPendingScroll(getsectionKeys());
  // }
  // update(); // triggers rebuild
  // if (index == 0) {
  //   resetScroll();
  // } else {
  //   scrollToSection(page, getsectionKeys());

  // }

  // void setcurrentpage(String page, int index) async {
  //   if (_currentmenu == "Important Link") {
  //     if (await canLaunchUrl(Uri.parse(getlinkUrl(page)!))) {
  //       await launchUrl(
  //         Uri.parse(getlinkUrl(page)!),
  //         mode: LaunchMode.externalApplication,
  //       );
  //     }
  //   } else if (_currentmenu == "Grievance Redressal") {
  //     downloadloacalPdf(pdfurl: getpdfUrl(page)!);
  //   } else {
  //     _currentpage = page;
  //     update();
  //     resetScroll();
  //   }


  // }

    void setcurrentpage(String page) async {
    // _istermpage = false;
    _currentpage = page;
    update();
    resetScroll();
  }

  String? getlinkUrl(String title) {
    switch (title) {
      case 'CMIS':
        return 'https://cmis.man.nic.in/sevaarth/home1/sevaarthhome.php';
      case 'NPS':
        return 'https://cra-nsdl.com/CRA/';
      case 'Employee Corner':
        return 'https://cmis.man.nic.in/sevaarth/home1/sevaarthhome.php';

      default:
        return null;
    }
  }

  String? getpdfUrl(String title) {
    switch (title) {
      case 'Centralised Public Grievance Redress and Monitoring System (CPGRAMS)':
        return 'files/Nodal_Officer_CPGRAMS_MIS.pdf';
      case 'Internal Complaints Committee (ICC)':
        return 'files/Order_for_constitution_of_ICC.pdf';

      default:
        return null;
    }
  }

  setmenuindex(int menuindex, String title, List<String>? items) {
    if (_selectedmenuindex != menuindex) {
      log("not equal");
      log("index : $menuindex");
      if (items == null) {
        resetScroll();
      }
    } else {
      log("equal");
      resetScroll();
    }
    _currentmenu = title;
    _selectedmenuindex = menuindex;
    update();
    log(_selectedmenuindex.toString());
  }

  void resetScroll() {
    if (scrollController.hasClients) {
      log('dsdas');
      scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 1),
        curve: Curves.easeOut,
      );
    }
  }

  void setadmincurrentpage(String page, int ind) {
    // Your _logic here
    _admincurrentpage = page;
    _selectedadminpageindex = ind;
    update(); // Notify listeners about the change
  }

  // void cleartokken() async {
  //   SharedPreferences s = await SharedPreferences.getInstance();
  //   s.clear();
  //   Get.find<LoginController>().resetall();
  //   // Get.find<LoginController>().getUserToken();
  //   Get.offAllNamed('/');
  // }




}
