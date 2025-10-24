// // 📦 Package imports:

// import 'package:acnoo_flutter_admin_panel/app/controller/authcontroller.dart';
// import 'package:acnoo_flutter_admin_panel/app/controller/managementcontroller.dart';
// import 'package:acnoo_flutter_admin_panel/app/pages/customerlist/customerlist.dart';
// import 'package:acnoo_flutter_admin_panel/app/pages/productpages/forexpage.dart';
// import 'package:acnoo_flutter_admin_panel/app/pages/productpages/generalinsurance.dart';
// import 'package:acnoo_flutter_admin_panel/app/pages/productpages/leadpage.dart';
// import 'package:acnoo_flutter_admin_panel/app/pages/productpages/lifeinsurancepage.dart';
// import 'package:acnoo_flutter_admin_panel/app/pages/productpages/loanpage.dart';
// import 'package:acnoo_flutter_admin_panel/app/pages/productpages/productdetailpages/forexdetailspage.dart';
// import 'package:acnoo_flutter_admin_panel/app/pages/productpages/productdetailpages/lifeinsurancepage.dart';
// import 'package:acnoo_flutter_admin_panel/app/pages/productpages/recentactivitypage.dart';
// import 'package:acnoo_flutter_admin_panel/app/pages/productpages/staffactivitypage.dart';
// import 'package:acnoo_flutter_admin_panel/app/pages/productpages/upcomingcalls/upcomingcallpage.dart';
// import 'package:acnoo_flutter_admin_panel/dev_utils/dev_utils.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:go_router/go_router.dart';
// import 'package:provider/provider.dart';

// // 🌎 Project imports:
// import '../controller/authnotifier.dart';
// import '../pages/dashboard/dashboard_view.dart';
// import '../pages/pages.dart';
// import '../pages/productpages/occasionpage/occasionpage.dart';
// import '../pages/productpages/productdetailpages/generaldetailspage.dart';
// import '../pages/productpages/productdetailpages/loandetailspage.dart';
// import '../pages/stafflist/addstaffpage.dart';
// import '../pages/stafflist/stafflist.dart';
// import '../providers/providers.dart';

// abstract class AcnooAppRoutes {
//   //--------------Navigator Keys--------------//
//   static final _rootNavigatorKey = GlobalKey<NavigatorState>();
//   static final _emailShellNavigatorKey = GlobalKey<NavigatorState>();
//   //--------------Navigator Keys--------------//

//   static const _initialPath = '/';
//   static final routerConfig = GoRouter(
//     navigatorKey: GlobalKey<NavigatorState>(),
//     initialLocation: _initialPath,
 
//     redirect: (context, state) {
    

//       final isLoggingIn = state.uri.path == '/authentication/signin';

//       // if (!auth.isAuthenticated.value && !isLoggingIn) {
//       //   return '/authentication/signin'; // Redirect unauthenticated users
//       // }
//       // if (auth.isAuthenticated.value && isLoggingIn) {
//       //   if (state.uri.path.contains('/dashboard') ||
//       //       state.uri.path.contains('/loan') ||
//       //       state.uri.path.contains('/lifeinsurance') ||
//       //       state.uri.path.contains('/users') ||
//       //       state.uri.path.contains('/generalinsurance') ||
//       //       state.uri.path.contains('/forex') ||
//       //       state.uri.path.contains('/leads') ||
//       //       state.uri.path.contains('/upcomingcalls') ||
//       //       state.uri.path.contains('/occasions') ||
//       //       state.uri.path.contains('/recentactivity') ||
//       //       state.uri.path.contains('/forms')) {
//       //     return state.uri.path;
//       //   }
//       //   return '/dashboard/siroi-dashboard'; // Redirect logged-in users away from login page
//       // }
//       return '/landing';
//     },
//     routes: [
//       // Landing Route Handler
//       GoRoute(
//         path: _initialPath,
//         redirect: (context, state) {
//           final _appLangProvider = Provider.of<AppLanguageProvider>(context);
      
//           if (state.uri.queryParameters['rtl'] == 'true') {
//             _appLangProvider.isRTL = true;
//           }
 
//           return '/landing';
//         },
//       ),

//       // Global Shell Route
//       ShellRoute(
//         navigatorKey: _rootNavigatorKey,
//         pageBuilder: (context, state, child) {
//           return NoTransitionPage(
//             child: ShellRouteWrapper(child: child),
//           );
//         },
//         routes: [
//           // Dashboard Routes
//           GoRoute(
//             path: '/dashboard',
//             redirect: (context, state) async {
//               if (state.fullPath == '/dashboard') {
//                 return '/dashboard/siroi-dashboard';
//               }
//               return null;
//             },
//             routes: [
//               GoRoute(
//                 path: 'siroi-dashboard',
//                 pageBuilder: (context, state) {
//                   return NoTransitionPage(child: ECommerceAdminDashboardView());
//                 },
//               ),
//             ],
//           ),
//           GoRoute(
//             path: '/dashboard',
//             redirect: (context, state) async {
//               if (state.fullPath == '/dashboard') {
//                 return '/dashboard/customers-page';
//               }
//               return null;
//             },
//             routes: [
//               GoRoute(
//                 path: 'customers-page',
//                 pageBuilder: (context, state) {
//                   final ctrl = Get.find<ManagementController>();

//                   return NoTransitionPage(
//                     child: GetBuilder<ManagementController>(
//                       builder: (_) {
//                         if (ctrl.allcustomerformain.isEmpty) {
//                           return const Scaffold(
//                             body: Center(
//                                 child: CircularProgressIndicator(
//                               color: Colors.green,
//                             )),
//                           );
//                         }
//                         return const CustomeresListView();
//                       },
//                     ),
//                   );
//                 },
//               ),
//             ],
//           ),

//           // Widgets Routes
//           // GoRoute(
//           //   path: '/widgets',
//           //   redirect: (context, state) async {
//           //     if (state.fullPath == '/widgets') {
//           //       return '/widgets/general-widgets';
//           //     }
//           //     return null;
//           //   },
//           //   routes: [
//           //     GoRoute(
//           //       path: 'chart-widgets',
//           //       pageBuilder: (context, state) => const NoTransitionPage<void>(
//           //         child: ChartWidgetsView(),
//           //       ),
//           //     ),
//           //   ],
//           // ),

//           //--------------Application Section--------------//
//           GoRoute(
//               path: '/loan',
//               redirect: (context, state) async {
//                 if (state.fullPath == '/loan') {
//                   return '/loan/loans';
//                 }
//                 return null;
//               },
//               routes: [
//                 GoRoute(
//                     path: 'loans',
//                     pageBuilder: (context, state) {
//                       return NoTransitionPage(child: LoanListView());
//                     }),
//                 // GoRoute(
//                 //     path: 'loandetails',
//                 //     pageBuilder: (context, state) {
//                 //       return NoTransitionPage(child: LoanDetailsView());
//                 //     }),

//                 GoRoute(
//                   path: 'loandetails/:id',
//                   pageBuilder: (context, state) {
//                     final id = state.pathParameters['id']!;
//                     print("ID : $id");

//                     final ctrl = Get.find<ManagementController>();

//                     return NoTransitionPage(
//                       child: GetBuilder<ManagementController>(
//                         builder: (_) {
//                           if (ctrl.getAllloans.isEmpty) {
//                             return const Scaffold(
//                               body: Center(
//                                   child: CircularProgressIndicator(
//                                 color: Colors.red,
//                               )),
//                             );
//                           }

//                           return LoanDetailsView(id: int.parse(id));
//                         },
//                       ),
//                     );
//                   },
//                 ),
//               ]),

//           GoRoute(
//             path: '/lifeinsurance',
//             redirect: (context, state) {
//               // Only redirect when visiting exactly `/lifeinsurance`
//               if (state.uri.path == '/lifeinsurance') {
//                 return '/lifeinsurance/lifeinsurances';
//               }
//               return null;
//             },
//             routes: [
//               GoRoute(
//                 path: 'lifeinsurances',
//                 pageBuilder: (context, state) {
//                   return const NoTransitionPage(child: LifeInsuranceListView());
//                 },
//               ),
//               GoRoute(
//                 path: 'lifeinsdetails/:id',
//                 pageBuilder: (context, state) {
//                   final id = state.pathParameters['id']!;
//                   print("ID : $id");

//                   final ctrl = Get.find<ManagementController>();

//                   return NoTransitionPage(
//                     child: GetBuilder<ManagementController>(
//                       builder: (_) {
//                         if (ctrl.getalllifeInsurance.isEmpty) {
//                           return const Scaffold(
//                             body: Center(
//                                 child: CircularProgressIndicator(
//                               color: Colors.red,
//                             )),
//                           );
//                         }

//                         return LifeInsuranceDetailsView(id: int.parse(id));
//                       },
//                     ),
//                   );
//                 },
//               ),
//             ],
//           ),

//           GoRoute(
//               path: '/users',
//               redirect: (context, state) async {
//                 if (state.fullPath == '/users') {
//                   return '/users/user-list';
//                 }
//                 return null;
//               },
//               routes: [
//                 GoRoute(
//                   path: 'user-list',
//                   pageBuilder: (context, state) => const NoTransitionPage<void>(
//                     child: StaffListView(),
//                   ),
//                 ),
//                 GoRoute(
//                   path: 'user-form',
//                   pageBuilder: (context, state) => const NoTransitionPage<void>(
//                     child: AddStaffForm(),
//                   ),
//                 ),
//               ]),

//           GoRoute(
//               path: '/generalinsurance',
//               redirect: (context, state) async {
//                 if (state.fullPath == '/generalinsurance') {
//                   return '/generalinsurance/generalinsurances';
//                 }
//                 return null;
//               },
//               routes: [
//                 GoRoute(
//                     path: 'generalinsurances',
//                     pageBuilder: (context, state) {
//                       return NoTransitionPage(
//                           child: GeneralinsuranceListView());
//                     }),
//                 GoRoute(
//                   path: 'generalinsdetails/:id',
//                   pageBuilder: (context, state) {
//                     final id = state.pathParameters['id']!;
//                     print("ID : $id");

//                     final ctrl = Get.find<ManagementController>();

//                     return NoTransitionPage(
//                       child: GetBuilder<ManagementController>(
//                         builder: (_) {
//                           if (ctrl.getallgeneralInsurance.isEmpty) {
//                             return const Scaffold(
//                               body: Center(
//                                   child: CircularProgressIndicator(
//                                 color: Colors.red,
//                               )),
//                             );
//                           }

//                           return GeneralInsuranceDetailsView(id: int.parse(id));
//                         },
//                       ),
//                     );
//                   },
//                 ),
//               ]),

//           GoRoute(
//               path: '/forex',
//               redirect: (context, state) async {
//                 if (state.fullPath == '/forex') {
//                   return '/forex/forexlist';
//                 }
//                 return null;
//               },
//               routes: [
//                 GoRoute(
//                     path: 'forexlist',
//                     pageBuilder: (context, state) {
//                       return NoTransitionPage(child: ForexListView());
//                     }),
//                 GoRoute(
//                   path: 'forexdetails/:id',
//                   pageBuilder: (context, state) {
//                     final id = state.pathParameters['id']!;
//                     print("ID : $id");

//                     final ctrl = Get.find<ManagementController>();

//                     return NoTransitionPage(
//                       child: GetBuilder<ManagementController>(
//                         builder: (_) {
//                           if (ctrl.getallForex.isEmpty) {
//                             return const Scaffold(
//                               body: Center(
//                                   child: CircularProgressIndicator(
//                                 color: Colors.red,
//                               )),
//                             );
//                           }

//                           return ForexDetailsView(id: int.parse(id));
//                         },
//                       ),
//                     );
//                   },
//                 ),
//               ]),

//           GoRoute(
//               path: '/leads',
//               pageBuilder: (context, state) {
//                 return NoTransitionPage(child: LeadListView());
//               }),
//           GoRoute(
//               path: '/upcomingcalls',
//               pageBuilder: (context, state) {
//                 return NoTransitionPage(child: UpcomingCallPage());
//               }),
//           GoRoute(
//               path: '/occasions',
//               pageBuilder: (context, state) {
//                 return NoTransitionPage(child: OccasionPage());
//               }),
//           GoRoute(
//               path: '/recentactivity',
//               pageBuilder: (context, state) {
//                 return NoTransitionPage(child: RecentActivityPageforMain());
//               }),
//           GoRoute(
//               path: '/staffactivity',
//               pageBuilder: (context, state) {
//                 return NoTransitionPage(child: StaffActivityPageforMain());
//               }),
//           // E-Commerce Routes

//           // Open AI Routes

//           // Users Route
//           // GoRoute(
//           //   path: '/users',
//           //   redirect: (context, state) async {
//           //     if (state.fullPath == '/users') {
//           //       return '/users/user-list';
//           //     }
//           //     return null;
//           //   },
//           //   routes: [
//           //     GoRoute(
//           //       path: 'user-list',
//           //       pageBuilder: (context, state) => const NoTransitionPage<void>(
//           //         child: UsersListView(),
//           //       ),
//           //     ),
//           //     GoRoute(
//           //       path: 'user-grid',
//           //       pageBuilder: (context, state) => const NoTransitionPage<void>(
//           //         child: UsersGridView(),
//           //       ),
//           //     ),
//           //     GoRoute(
//           //       path: 'user-profile',
//           //       pageBuilder: (context, state) => const NoTransitionPage<void>(
//           //         child: UserProfileView(),
//           //       ),
//           //     ),
//           //   ],
//           // ),

//           //--------------Application Section--------------//

//           //--------------Tables & Forms--------------//

//           GoRoute(
//             path: '/forms',
//             redirect: (context, state) async {
//               if (state.fullPath == '/forms') {
//                 return '/forms/basic-forms';
//               }
//               return null;
//             },
//             routes: [
//               GoRoute(
//                 path: 'basic-forms',
//                 pageBuilder: (context, state) => const NoTransitionPage<void>(
//                   child: BasicFormsView(),
//                 ),
//               ),
//               GoRoute(
//                 path: 'form-select',
//                 pageBuilder: (context, state) => const NoTransitionPage<void>(
//                   child: FormSelectView(),
//                 ),
//               ),
//               GoRoute(
//                 path: 'form-validation',
//                 pageBuilder: (context, state) => const NoTransitionPage<void>(
//                   child: FormValidationView(),
//                 ),
//               ),
//             ],
//           ),
//           //--------------Tables & Forms--------------//

//           //--------------Components--------------//

//           //--------------Pages--------------//
//           GoRoute(
//             path: '/pages',
//             redirect: (context, state) async {
//               if (state.fullPath == '/pages') {
//                 return '/pages/gallery';
//               }
//               return null;
//             },
//             routes: [
//               GoRoute(
//                 path: '404',
//                 pageBuilder: (context, state) => const NoTransitionPage<void>(
//                   child: NotFoundView(),
//                 ),
//               ),
//             ],
//           ),
//           //--------------Pages--------------//
//         ],
//       ),

//       // Full Screen Pages
//       GoRoute(
//         path: '/authentication/signup',
//         pageBuilder: (context, state) => const NoTransitionPage(
//           child: SignupView(),
//         ),
//       ),
//       GoRoute(
//         path: '/authentication/signin',
//         pageBuilder: (context, state) => const NoTransitionPage(
//           child: SigninView(),
//         ),
//       )
//     ],
//     errorPageBuilder: (context, state) => const NoTransitionPage(
//       child: NotFoundView(),
//     ),
//   );
// }
