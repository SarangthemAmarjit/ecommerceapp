// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:yumsharolwebapp/constant/allassets.dart';
// import 'package:yumsharolwebapp/landing/controller/landing_controller.dart';
// import 'package:yumsharolwebapp/login/activeprojects.dart';
// import 'package:yumsharolwebapp/login/client.dart';
// import 'package:yumsharolwebapp/login/controller/admin_controller.dart';
// import 'package:yumsharolwebapp/login/controller/login_controller.dart';
// import 'package:yumsharolwebapp/login/helpsupportpage.dart';
// import 'package:yumsharolwebapp/login/quoterequest.dart';
// import 'package:yumsharolwebapp/login/setting.dart';

// class AdminMainPage extends StatelessWidget {
//   const AdminMainPage({super.key});

//   Widget getPage(String key) {
//     switch (key) {
//       case 'Dashboard':
//         return const DashboardPage();
//       case 'Quote Requests':
//         return QuoteRequestsPage();
//       case 'Projects':
//         return ProjectImagesPage();
//       case 'Clients':
//         return ClientsPage();
//       case 'Settings':
//         return SettingsPage();
//       case 'Help & Support':
//         return HelpSupportPage();
//       default:
//         return const DashboardPage();
//     }
//   }

//   // @override
//   Future<void> showLogoutDialog(BuildContext context) async {
//     final LandingController landcon = Get.find<LandingController>();
//     final LoginController logincon = Get.find<LoginController>();
//     final shouldLogout = await showDialog<bool>(
//       context: context,
//       builder:
//           (context) => AlertDialog(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(13),
//             ),
//             title: const Text('Logout'),
//             content: const Text('Are you sure you want to logout?'),
//             actions: [
//               TextButton(
//                 onPressed: () => Navigator.of(context).pop(false),
//                 child: const Text(
//                   'Cancel',
//                   style: TextStyle(color: Colors.red),
//                 ),
//               ),
//               OutlinedButton(
//                 onPressed: () {
//                   Navigator.of(context).pop(true);
//                 },
//                 style: OutlinedButton.styleFrom(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 24,
//                     vertical: 12,
//                   ),
//                   side: const BorderSide(color: Colors.blue),
//                 ),
//                 child: const Text(
//                   "Logout",
//                   style: TextStyle(color: Colors.blue),
//                 ),
//               ),
//             ],
//           ),
//     );

//     if (shouldLogout == true) {
//    logincon.cleartokken();
//       landcon.setadmincurrentpage('dashboard', 0);
//     }
//   }

//   Widget buildSidebar(BuildContext context, bool isDrawer) {
//     final LoginController logincon = Get.find<LoginController>();

//     List<Widget> navItems = [
//       _buildNavItem(0, isDrawer, Icons.dashboard, 'Dashboard', context),
//       _buildNavItem(
//         1,
//         isDrawer,
//         Icons.request_quote,
//         'Quote Requests',
//         context,
//       ),
//       _buildNavItem(2, isDrawer, Icons.construction, 'Projects', context),

//       _buildNavItem(3, isDrawer, Icons.logout, 'Logout', context),
//     ];

//     return Container(
//       width: isDrawer ? null : 280,
//       color: const Color(0xFF141A2D),
//       child: Column(
//         children: [
//           const SizedBox(height: 40),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset(Allassets.admin, height: 36, width: 36),
//               const SizedBox(width: 12),
//               Text(
//                 'YUMSHAROL ADMIN',
//                 style: GoogleFonts.poppins(
//                   fontSize: 18,
//                   fontWeight: FontWeight.w700,
//                   color: const Color(0xFF6C72FF),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 40),
//           Expanded(
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   ListView.builder(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemCount: navItems.length,
//                     itemBuilder: (context, ind) => navItems[ind],
//                   ),
//                   Container(
//                     padding: const EdgeInsets.all(16),
//                     margin: const EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       color: const Color(0xFF1D2335),
//                       borderRadius: BorderRadius.circular(15),
//                       border: Border.all(
//                         color: const Color(0xFF6C72FF).withOpacity(0.2),
//                       ),
//                     ),
//                     child: FittedBox(
//                       child: Row(
//                         children: [
//                           const CircleAvatar(
//                             radius: 24,
//                             backgroundColor: Color(0xFF6C72FF),
//                             child: Icon(
//                               Icons.admin_panel_settings,
//                               color: Colors.white,
//                             ),
//                           ),
//                           const SizedBox(width: 12),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Admin User',
//                                 style: GoogleFonts.poppins(
//                                   fontWeight: FontWeight.w600,
//                                   fontSize: 16,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                               Text(
//                                 logincon.username!,
//                                 // overflow: TextOverflow.visible,
//                                 // maxLines: 2,
//                                 style: GoogleFonts.poppins(
//                                   color: Colors.grey,
//                                   fontSize: 13,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(height: 20),
//         ],
//       ),
//     );
//   }

//   Widget _buildNavItem(
//     int index,
//     bool isdrawer,
//     IconData icon,
//     String title,
//     BuildContext context,
//   ) {
//     final LandingController landingcon = Get.find<LandingController>();
//     return GetBuilder<LandingController>(
//       builder: (_) {
//         return Container(
//           margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
//           decoration: BoxDecoration(
//             color:
//                 landingcon.selectedadminpageindex == index
//                     ? const Color(0xFF6C72FF)
//                     : Colors.transparent,
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: ListTile(
//             leading: Icon(
//               icon,
//               color:
//                   landingcon.selectedadminpageindex == index
//                       ? Colors.white
//                       : Colors.grey[400],
//             ),
//             title: Text(
//               title,
//               style: GoogleFonts.poppins(
//                 color:
//                     landingcon.selectedadminpageindex == index
//                         ? Colors.white
//                         : Colors.grey[400],
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//             onTap: () {
//               if (index == 3) {
//                 // Logout item
//                 showLogoutDialog(context);
//               } else {
//                 if (isdrawer) {
//                   Navigator.of(context).pop();
//                 }
//                 landingcon.setadmincurrentpage(title, index);
//               }
//             },
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final LandingController landcon = Get.put(LandingController());
//     final isMobile = MediaQuery.of(context).size.width < 800;

//     return GetBuilder<LandingController>(
//       builder: (_) {
//         return Scaffold(
//           appBar:
//               isMobile
//                   ? AppBar(
//                     iconTheme: IconThemeData(
//                       color: Colors.white, // 👈 Change drawer icon color here
//                     ),
//                     title: const Text(
//                       "Admin Panel",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                     backgroundColor: const Color(0xFF141A2D),
//                   )
//                   : null,
//           drawer:
//               isMobile
//                   ? Drawer(
//                     backgroundColor: Colors.white,
//                     child: buildSidebar(context, true),
//                   )
//                   : null,
//           body: Row(
//             children: [
//               if (!isMobile) buildSidebar(context, false),
//               Expanded(
//                 child: Container(
//                   color: Colors.grey[100],
//                   alignment: Alignment.topCenter,
//                   child: SingleChildScrollView(
//                     child: getPage(landcon.admincurrentpage),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   // Sidebar and other methods remain the same as in your original AdminMainPage
//   // ...
// }

// class DashboardPage extends StatelessWidget {
//   const DashboardPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Dashboard Overview',
//             style: GoogleFonts.poppins(
//               fontSize: 22,
//               fontWeight: FontWeight.w600,
//               color: const Color(0xFF141A2D),
//             ),
//           ),
//           const SizedBox(height: 20),

//           // Stats Cards
//           _buildStatsRow(context),
//           const SizedBox(height: 24),

//           // // Recent Activities
//           // _buildRecentActivities(context),
//           // const SizedBox(height: 24),

//           // // Projects Progress
//           // _buildProjectsProgress(context),
//         ],
//       ),
//     );
//   }

//   Widget _buildStatsRow(BuildContext context) {
//     final AdminController admincon = Get.put(AdminController());
//     return GetBuilder<AdminController>(
//       builder: (_) {
//         return Column(
//           children: [
//             Row(
//               children: [
//                 _buildStatCard(
//                   context,
//                   'Total Projects',
//                   admincon.allproject.length,
//                   Icons.construction,
//                   const Color(0xFF6C72FF),
//                 ),
//                 const SizedBox(width: 16),
//                 _buildStatCard(
//                   context,
//                   'Active Quotes',
//                   admincon.allquote.length,
//                   Icons.request_quote,
//                   const Color(0xFF4CAF50),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 16),
//             // Row(
//             //   children: [
//             //     _buildStatCard(
//             //       context,
//             //       'Revenue',
//             //       '₹42.5L',
//             //       Icons.attach_money,
//             //       const Color(0xFFFF9800),
//             //     ),
//             //     const SizedBox(width: 16),
//             //     _buildStatCard(
//             //       context,
//             //       'Clients',
//             //       '15',
//             //       Icons.people,
//             //       const Color(0xFF9C27B0),
//             //     ),
//             //   ],
//             // ),
//           ],
//         );
//       },
//     );
//   }

//   Widget _buildStatCard(
//     BuildContext context,
//     String title,
//     int value,
//     IconData icon,
//     Color color,
//   ) {
//     return Expanded(
//       child: Card(
//         elevation: 2,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.all(8),
//                     decoration: BoxDecoration(
//                       color: color.withOpacity(0.2),
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: Icon(icon, color: color),
//                   ),
//                   const SizedBox(width: 12),
//                   Text(
//                     title,
//                     style: GoogleFonts.poppins(
//                       color: Colors.grey[600],
//                       fontSize: 14,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 12),
//               Text(
//                 value.toString(),
//                 style: GoogleFonts.poppins(
//                   fontSize: 22,
//                   fontWeight: FontWeight.w600,
//                   color: const Color(0xFF141A2D),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildRecentActivities(BuildContext context) {
//     final recentActivities = [
//       {
//         'title': 'New quote request',
//         'time': '2 hours ago',
//         'icon': Icons.request_quote,
//       },
//       {
//         'title': 'Project approved',
//         'time': '5 hours ago',
//         'icon': Icons.check_circle,
//       },
//       {'title': 'Payment received', 'time': '1 day ago', 'icon': Icons.payment},
//       {
//         'title': 'New client registered',
//         'time': '2 days ago',
//         'icon': Icons.person_add,
//       },
//     ];

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'Recent Activities',
//           style: GoogleFonts.poppins(
//             fontSize: 18,
//             fontWeight: FontWeight.w600,
//             color: const Color(0xFF141A2D),
//           ),
//         ),
//         const SizedBox(height: 12),
//         Card(
//           elevation: 2,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               children: [
//                 ...recentActivities.map(
//                   (activity) => Column(
//                     children: [
//                       ListTile(
//                         contentPadding: EdgeInsets.zero,
//                         leading: Container(
//                           padding: const EdgeInsets.all(8),
//                           decoration: BoxDecoration(
//                             color: const Color(0xFF6C72FF).withOpacity(0.2),
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           child: Icon(
//                             activity['icon'] as IconData,
//                             color: const Color(0xFF6C72FF),
//                           ),
//                         ),
//                         title: Text(
//                           activity['title'] as String,
//                           style: GoogleFonts.poppins(
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         subtitle: Text(
//                           activity['time'] as String,
//                           style: GoogleFonts.poppins(
//                             color: Colors.grey[600],
//                             fontSize: 12,
//                           ),
//                         ),
//                         trailing: const Icon(Icons.chevron_right),
//                       ),
//                       const Divider(height: 1),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildProjectsProgress(BuildContext context) {
//     final projects = [
//       {'name': 'Wangkhei Residence', 'progress': 0.65, 'status': 'On Track'},
//       {
//         'name': 'Imphal Commercial Complex',
//         'progress': 0.35,
//         'status': 'Delayed',
//       },
//       {'name': 'Retrofit Project', 'progress': 0.15, 'status': 'On Track'},
//     ];

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'Projects Progress',
//           style: GoogleFonts.poppins(
//             fontSize: 18,
//             fontWeight: FontWeight.w600,
//             color: const Color(0xFF141A2D),
//           ),
//         ),
//         const SizedBox(height: 12),
//         Card(
//           elevation: 2,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               children: [
//                 ...projects.map(
//                   (project) => Column(
//                     children: [
//                       ListTile(
//                         contentPadding: EdgeInsets.zero,
//                         title: Text(
//                           project['name'] as String,
//                           style: GoogleFonts.poppins(
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         subtitle: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const SizedBox(height: 8),
//                             LinearProgressIndicator(
//                               value: project['progress'] as double,
//                               backgroundColor: Colors.grey[200],
//                               color:
//                                   project['status'] == 'Delayed'
//                                       ? Colors.orange
//                                       : const Color(0xFF6C72FF),
//                               minHeight: 6,
//                               borderRadius: BorderRadius.circular(3),
//                             ),
//                             const SizedBox(height: 8),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   '${((project['progress'] as double) * 100).toStringAsFixed(0)}% Complete',
//                                   style: GoogleFonts.poppins(
//                                     fontSize: 12,
//                                     color: Colors.grey[600],
//                                   ),
//                                 ),
//                                 Text(
//                                   project['status'] as String,
//                                   style: GoogleFonts.poppins(
//                                     fontSize: 12,
//                                     color:
//                                         project['status'] == 'Delayed'
//                                             ? Colors.orange
//                                             : const Color(0xFF6C72FF),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                       const Divider(height: 1),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
