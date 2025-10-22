
// import 'package:ecommerceapp/config/responsive.dart';
// import 'package:ecommerceapp/pages/view/landing/controller/landing_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';


// class MobileHomePage extends StatelessWidget {
//   const MobileHomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     final ismobile =
//         Responsive.isMobile(context) || Responsive.isMobtab(context);

//     final ismobtab = Responsive.isMobtab(context);

//     Widget leftContent = Container(
//       width: ismobile ? double.infinity : null,
//       height: ismobile ? null : size.height * 0.75,
//       decoration: BoxDecoration(
//         // image: DecorationImage(
//         //   image: const AssetImage("assets/images/homebg3.png"),
//         //   fit: BoxFit.cover,
//         // ),
//         gradient: LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [
//             Color.fromARGB(255, 85, 162, 216), // Light Blue
//             Color.fromARGB(255, 233, 97, 140), // Soft Pink
//             Color.fromARGB(255, 228, 178, 86), // Peach/Light Orange
//             // Color.fromARGB(255, 194, 169, 42), // Light Yellow
//           ],
//           stops: [0.0, 0.4, 0.7],
//         ),
//         // gradient: LinearGradient(
//         //   colors: [
//         //     const Color.fromARGB(255, 131, 194, 111),
//         //     const Color.fromARGB(255, 218, 207, 114),
//         //     Color.fromARGB(255, 216, 161, 165)!, // Firebrick (lighter maroon)
//         //   ],
//         //   begin: Alignment.topLeft,
//         //   end: Alignment.bottomRight,
//         // ),
//       ),
//       padding: const EdgeInsets.all(32),
//       child: Padding(
//         padding: EdgeInsets.only(left: ismobile ? 0 : 30),
//         child: Align(
//           alignment: ismobile ? Alignment.centerLeft : Alignment.center,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.center,
//             mainAxisSize: ismobile ? MainAxisSize.min : MainAxisSize.max,
//             children: [
//               Text(
//                 "Seamleass Systems\nSmarter Governance.",
//                 style: TextStyle(
//                   fontSize: ismobtab ? 60 : 40,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                   letterSpacing: 3,
//                   height: 1.3,
//                 ),
//               ),
//               const SizedBox(height: 20),
//               const Text(
//                 "Real-time employee management, transparent payroll, and secure digital records--powered by CMIS",
//                 style: TextStyle(fontSize: 16, color: Colors.white),
//               ),
//               const SizedBox(height: 20),
//               // ElevatedButton(
//               //   onPressed: () {},
//               //   style: ElevatedButton.styleFrom(
//               //     shape: RoundedRectangleBorder(
//               //       borderRadius: BorderRadius.circular(5),
//               //     ),
//               //     backgroundColor: Colors.white,
//               //     foregroundColor: Colors.black,
//               //     padding: EdgeInsets.symmetric(
//               //       horizontal: ismobile ? 15 : 24,
//               //       vertical: ismobile ? 10 : 14,
//               //     ),
//               //   ),
//               //   child: Padding(
//               //     padding: const EdgeInsets.symmetric(vertical: 5),
//               //     child: const Text("Learn more"),
//               //   ),
//               // ),
//             ],
//           ),
//         ),
//       ),
//     );

//     Widget rightContent = SizedBox(
//       width: ismobile ? double.infinity : null,
//       height: ismobile ? 220 : size.height * 0.75,
//       child: GetBuilder<LandingController>(
//         builder: (lancon) {
//           final AdminController admincon = Get.find<AdminController>();
//           return GetBuilder<AdminController>(
//             builder: (_) {
//               return Stack(
//                 alignment: Alignment.bottomCenter,
//                 children: [
//                   // Main carousel with images
//                   CarouselSlider(
//                     carouselController: lancon.caroucon,
//                     options: CarouselOptions(
//                       height: double.infinity,
//                       autoPlay: true,
//                       enlargeCenterPage: false,
//                       viewportFraction: 1.0,
//                       enableInfiniteScroll: true,
//                     ),
//                     items:
//                         admincon.allbanner.map((item) {
//                           return Builder(
//                             builder: (BuildContext context) {
//                               return isdemo
//                                   ? Image.asset(
//                                     item.imagePath,
//                                     fit: BoxFit.cover,
//                                     width: double.infinity,
//                                   )
//                                   : CustomeNetworkImage(
//                                     imageUrl: api + item.imagePath,
//                                   );
//                             },
//                           );
//                         }).toList(),
//                   ),

//                   // Left navigation button
//                   Positioned(
//                     left: 10,
//                     top: 0,
//                     bottom: 0,
//                     child: Center(
//                       child: IconButton(
//                         icon: Icon(
//                           Icons.arrow_back_ios,
//                           color: Colors.white,
//                           size: ismobile ? 30 : 35,
//                         ),
//                         onPressed: () => lancon.caroucon.previousPage(),
//                       ),
//                     ),
//                   ),

//                   // Right navigation button
//                   Positioned(
//                     right: 10,
//                     top: 0,
//                     bottom: 0,
//                     child: Center(
//                       child: IconButton(
//                         icon: Icon(
//                           Icons.arrow_forward_ios,
//                           color: Colors.white,
//                           size: ismobile ? 30 : 35,
//                         ),
//                         onPressed: () => lancon.caroucon.nextPage(),
//                       ),
//                     ),
//                   ),

//                   // Optional: bottom center indicator (if you have one)
//                   // Positioned(
//                   //   bottom: 10,
//                   //   child: buildIndicator(),
//                   // ),

//                   // Optional: bottom-aligned notice board
//                   // Positioned(
//                   //   bottom: 0,
//                   //   right: 0,
//                   //   left: 0,
//                   //   child: Align(
//                   //     alignment: Alignment.bottomRight,
//                   //     child: NoticeBoard(),
//                   //   ),
//                   // ),
//                 ],
//               );
//             },
//           );
//         },
//       ),
//     );

//     return Padding(
//       padding: EdgeInsets.only(
//         // bottom: ismobile ? 24 : size.height * 0.15,
//         left: ismobile ? 0 : 0,
//         right: ismobile ? 0 : 0,
//       ),
//       child: Container(
//         color: const Color(0xFF237570),
//         child:
//             ismobile
//                 ? Column(children: [leftContent, rightContent])
//                 : Row(
//                   children: [
//                     Expanded(flex: 3, child: leftContent),
//                     Expanded(flex: 4, child: rightContent),
//                   ],
//                 ),
//       ),
//     );
//   }
// }
