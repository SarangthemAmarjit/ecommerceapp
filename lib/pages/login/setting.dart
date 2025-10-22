// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class SettingsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Settings',
//             style: GoogleFonts.poppins(
//               fontSize: 22,
//               fontWeight: FontWeight.w600,
//               color: const Color(0xFF141A2D),
//             ),
//           ),
//           const SizedBox(height: 20),
//           Card(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 children: [
//                   _buildSettingsItem(
//                     context,
//                     Icons.account_circle,
//                     'Account Settings',
//                     'Update your profile information',
//                   ),
//                   const Divider(),
//                   _buildSettingsItem(
//                     context,
//                     Icons.notifications,
//                     'Notification Settings',
//                     'Manage your notification preferences',
//                   ),
//                   const Divider(),
//                   _buildSettingsItem(
//                     context,
//                     Icons.lock,
//                     'Security',
//                     'Change password and security settings',
//                   ),
//                   const Divider(),
//                   _buildSettingsItem(
//                     context,
//                     Icons.palette,
//                     'Appearance',
//                     'Change theme and display settings',
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(height: 20),
//           Card(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 children: [
//                   _buildSettingsItem(
//                     context,
//                     Icons.help,
//                     'Help Center',
//                     'Get help with using the app',
//                   ),
//                   const Divider(),
//                   _buildSettingsItem(
//                     context,
//                     Icons.info,
//                     'About',
//                     'App version and developer information',
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildSettingsItem(
//       BuildContext context, IconData icon, String title, String subtitle) {
//     return ListTile(
//       leading: Icon(
//         icon,
//         color: const Color(0xFF6C72FF),
//       ),
//       title: Text(
//         title,
//         style: GoogleFonts.poppins(
//           fontWeight: FontWeight.w500,
//         ),
//       ),
//       subtitle: Text(
//         subtitle,
//         style: GoogleFonts.poppins(
//           color: Colors.grey[600],
//           fontSize: 12,
//         ),
//       ),
//       trailing: const Icon(Icons.chevron_right),
//       onTap: () {},
//     );
//   }
// }