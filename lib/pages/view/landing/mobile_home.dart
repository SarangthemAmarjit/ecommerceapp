// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:misdeptapp/core/widgets/sidebar.dart';
// import 'package:misdeptapp/mobilemainlanding.dart';
// import 'package:misdeptapp/routes/app_routes.dart';
// import 'package:misdeptapp/views/landing/components/mobile_tablet/mobilefooter.dart';
// import 'package:misdeptapp/views/landing/controller/landing_controller.dart';
// import 'package:misdeptapp/views/login/Admin%20Panel/controller/admin_controller.dart';
// import 'package:misdeptapp/views/pages/about/aboutus.dart';
// import 'package:misdeptapp/views/pages/about/impactandrecognition.dart';
// import 'package:misdeptapp/views/pages/about/organisationstructure.dart';
// import 'package:misdeptapp/views/pages/contactus.dart';
// import 'package:misdeptapp/views/pages/downloadpage.dart';
// import 'package:misdeptapp/views/pages/gallerypage.dart';
// import 'package:misdeptapp/views/pages/mainnotificationpage.dart';
// import 'package:misdeptapp/views/pages/rtipage.dart';
// import 'package:misdeptapp/views/pages/searchresultpage.dart';
// import 'package:misdeptapp/views/pages/services/cmis.dart';
// import 'package:misdeptapp/views/pages/services/responsibities.dart';

// class Landingpagemobile extends StatelessWidget {
//   const Landingpagemobile({super.key});
//   Widget getPage(String key, LandingController landcon) {
//     switch (key) {
//       case 'landing':
//         return const MobileDirectorateMISPage();
//       //   return const MainPage();
//       case 'About Us':
//         return AboutusPage();

//       case 'Impact & Recognition':
//         return GovernanceImpactPage();
//       case 'Organisation Structure':
//         return OrganisationalStructurePage();
//       case 'Core Responsibilities':
//         return CoreResponsibilitiesPage();
//       case 'CMIS Components & Modules':
//         return ComponentsModulesTablePage();
//       case 'Download':
//         return Downloadpage();
//       case 'Contact Us':
//         return ContactUsPage();
//       case 'Notices':
//         return MainNotificationsPage();
//       case 'rti':
//         return Rtipage();
//       case 'search':
//         return SearchResultPage();
//       case 'gallery':
//         return GallerySection();
//       default:
//         return const MobileDirectorateMISPage();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final LandingController landcon = Get.put(LandingController());
//     final AdminController admincon = Get.put(AdminController());
//     return GetBuilder<LandingController>(
//       builder: (_) {
//         return Scaffold(
//           drawer: Drawer(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(1),
//             ),
//             child: Sidebar(),
//           ),
//           backgroundColor: Colors.white,
//           appBar: AppBar(
//             toolbarHeight: 60,
//             // leading: Padding(
//             //   padding: const EdgeInsets.only(left: 20),
//             //   child: Image.asset('assets/images/logo2.png', fit: BoxFit.contain),
//             // ),
//             title: InkWell(
//               hoverColor: Colors.transparent,
//               onTap: () {
//                 landcon.setcurrentpage('landing', 0);
//               },
//               child: Image.asset(
//                 height: 60,
//                 'assets/images/finalmislogo.png',
//                 fit: BoxFit.contain,
//               ),
//             ),
//             actions: [
//               //  InkWell(
//               //       hoverColor: Colors.transparent,
//               //       onTap: () {
//               //         landcon.setcurrentpage('landing', 0);
//               //       },
//               //       child: Image.asset(
//               //         height: 45,
//               //         'assets/images/MIS-Logo.png',
//               //         fit: BoxFit.contain,
//               //       ),
//               //     ),
//               OutlinedButton(
//                 onPressed: () {
//                   Get.toNamed(AppRoutes.login);
//                 },
//                 style: OutlinedButton.styleFrom(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 15,
//                     vertical: 10,
//                   ),
//                   side: const BorderSide(color: Colors.blue),
//                 ),
//                 child: const Text(
//                   "Login",
//                   style: TextStyle(color: Colors.blue),
//                 ),
//               ),
//               SizedBox(width: 15),
//               MaterialButton(
//                 minWidth: 50,

//                 onPressed: () {
//                   landcon.setsearch(issearch: true);
//                 },
//                 child: SizedBox(height: 30, child: Icon(Icons.search)),
//               ),
//               SizedBox(width: 20),
//             ],
//             backgroundColor: Colors.white,
//             foregroundColor: Colors.black,
//             elevation: 1,
//           ),
//           body: GetBuilder<LandingController>(
//             builder: (_) {
//               return SingleChildScrollView(
//                 child:
//                     landcon.currentPage == 'landing'
//                         ? Column(
//                           children: [
//                             landcon.isSearching
//                                 ? SearchWidget(
//                                   landcon: landcon,
//                                   admincon: admincon,
//                                 )
//                                 : SizedBox(),
//                             getPage(landcon.currentPage, landcon),
//                           ],
//                         )
//                         : Column(
//                           children: [
//                             landcon.isSearching
//                                 ? SearchWidget(
//                                   landcon: landcon,
//                                   admincon: admincon,
//                                 )
//                                 : SizedBox(),
//                             getPage(landcon.currentPage, landcon),
//                             MobileFooterSection(),
//                           ],
//                         ),
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }

// class SearchWidget extends StatelessWidget {
//   const SearchWidget({
//     super.key,
//     required this.admincon,
//     required this.landcon,
//   });

//   final AdminController admincon;
//   final LandingController landcon;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//       child: Row(
//         children: [
//           Expanded(
//             child: SizedBox(
//               height: 35,
//               child: TextFormField(
//                 cursorHeight: 20,
//                 textAlignVertical: TextAlignVertical(y: 0.7),
//                 onFieldSubmitted: (value) {
//                   admincon.performSearch(value.trim());
//                 },
//                 controller: landcon.searchcont,
//                 decoration: InputDecoration(
//                   hintStyle: TextStyle(color: Colors.grey),
//                   focusColor: Colors.grey,

//                   hintText: 'Search',

//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     gapPadding: 10,
//                     borderSide: const BorderSide(color: Colors.blue, width: 1),
//                     borderRadius: BorderRadius.circular(8),
//                   ),

//                   suffixIcon: InkWell(
//                     onTap: () {
//                       admincon.performSearch(landcon.searchcont.text.trim());
//                     },

//                     child: Icon(Icons.search),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(width: 20),
//           ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(8),
//                 side: BorderSide(color: Colors.blue),
//               ),
//             ),
//             onPressed: () {
//               landcon.setsearch(issearch: false);
//             },
//             child: Text("Cancel"),
//           ),
//         ],
//       ),
//     );
//   }
// }
