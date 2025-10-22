import 'package:ecommerceapp/config/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class MobileFooterSection extends StatelessWidget {
  const MobileFooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final ismobile = Responsive.isMobile(context);
    final ismobtab = Responsive.isMobtab(context);
    final isTablet = Responsive.isTablet(context);
    final istabdesk = Responsive.isTabDesk(context);

    return Container(
      color: Colors.black,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
      alignment: Alignment.center,
      child: // ...existing code...
      // ...existing code...
      ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isTablet
                ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Contact Info Column
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Contact Us',
                              style: GoogleFonts.publicSans(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 12),
                            ContactFooterLink(
                              'Directorate of Management Information System (MIS)',
                            ),
                            SizedBox(height: 8),
                            ContactFooterLink(
                              'Finance Department, Government of Manipur',
                            ),
                            SizedBox(height: 8),
                            ContactFooterLink(
                              'Location: 3rd Floor, Western Block, New Secretariat Building, Imphal – 795001, ',
                            ),
                            SizedBox(height: 8),
                            // EmailLink(),
                            SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ),

                    // Important Links Column
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Important Link',
                            style: GoogleFonts.publicSans(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          const _FooterLink(
                            text: 'Manipur Government Official site',
                          ),
                          const SizedBox(height: 8),
                          const _FooterLink(
                            text:
                                'National Informatics Centre, Manipur State Centre',
                          ),
                          const SizedBox(height: 8),
                          const _FooterLink(
                            text:
                                'CMIS (Central Management Information System V2.0)',
                          ),

                          const SizedBox(height: 8),
                          const _FooterLink(text: 'MyGov'),
                          const SizedBox(height: 8),
                          // ...existing code...
                          // Row(
                          //   children: [
                          //     InkWell(
                          //       onTap: () async {
                          //         const url =
                          //             'https://www.digitalindia.gov.in/';
                          //         if (await canLaunchUrl(Uri.parse(url))) {
                          //           await launchUrl(
                          //             Uri.parse(url),
                          //             mode: LaunchMode.externalApplication,
                          //           );
                          //         }
                          //       },
                          //       child: Image.asset(
                          //         'assets/images/digital.png',
                          //         height: 32,
                          //       ),
                          //     ),
                          //     const SizedBox(width: 30),
                          //     InkWell(
                          //       onTap: () async {
                          //         const url = 'https://www.india.gov.in/';
                          //         if (await canLaunchUrl(Uri.parse(url))) {
                          //           await launchUrl(
                          //             Uri.parse(url),
                          //             mode: LaunchMode.externalApplication,
                          //           );
                          //         }
                          //       },
                          //       child: Image.asset(
                          //         'assets/images/india-gov-logo.png',
                          //         height: 32,
                          //       ),
                          //     ),
                          //     const SizedBox(width: 30),
                          //     InkWell(
                          //       onTap: () async {
                          //         const url = 'https://manipur.mygov.in/';
                          //         if (await canLaunchUrl(Uri.parse(url))) {
                          //           await launchUrl(
                          //             Uri.parse(url),
                          //             mode: LaunchMode.externalApplication,
                          //           );
                          //         }
                          //       },
                          //       child: Image.asset(
                          //         'assets/images/MyGov-logo.png',
                          //         height: 32,
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          // ...existing code...
                          // const _FooterLink('Accountant General Manipur'),
                          // const SizedBox(height: 8),
                          // const _FooterLink('Online GPF Information System'),
                          // const SizedBox(height: 8),
                          // const _FooterLink('Budget'),
                        ],
                      ),
                    ),
                  ],
                )
                : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Contact Info Column
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Contact Us',
                          style: GoogleFonts.publicSans(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 12),
                        ContactFooterLink(
                          'Directorate of Management Information System (MIS)',
                        ),
                        SizedBox(height: 8),
                        ContactFooterLink(
                          'Finance Department, Government of Manipur',
                        ),
                        SizedBox(height: 8),
                        ContactFooterLink(
                          'Location: 3rd Floor, Western Block, New Secretariat Building, Imphal – 795001, ',
                        ),
                        SizedBox(height: 8),
                        // EmailLink(),
                        SizedBox(height: 8),
                        // ContactFooterLink('Phone: +91-9402537620'),
                        // SizedBox(height: 8),
                      ],
                    ),

                    // Important Links Column
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Important Link',
                          style: GoogleFonts.publicSans(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        const _FooterLink(
                          text: 'Manipur Government Official site',
                        ),
                        const SizedBox(height: 8),
                        const _FooterLink(
                          text:
                              'National Informatics Centre, Manipur State Centre',
                        ),
                        const SizedBox(height: 8),
                        const _FooterLink(
                          text:
                              'CMIS (Central Management Information System V2.0)',
                        ),

                        const SizedBox(height: 8),
                        const _FooterLink(text: 'MyGov'),
                        const SizedBox(height: 8),
                        // ...existing code...
                        // Row(
                        //   children: [
                        //     InkWell(
                        //       onTap: () async {
                        //         const url = 'https://www.digitalindia.gov.in/';
                        //         if (await canLaunchUrl(Uri.parse(url))) {
                        //           await launchUrl(
                        //             Uri.parse(url),
                        //             mode: LaunchMode.externalApplication,
                        //           );
                        //         }
                        //       },
                        //       child: Image.asset(
                        //         'assets/images/digital.png',
                        //         height: 32,
                        //       ),
                        //     ),
                        //     const SizedBox(width: 30),
                        //     InkWell(
                        //       onTap: () async {
                        //         const url = 'https://www.india.gov.in/';
                        //         if (await canLaunchUrl(Uri.parse(url))) {
                        //           await launchUrl(
                        //             Uri.parse(url),
                        //             mode: LaunchMode.externalApplication,
                        //           );
                        //         }
                        //       },
                        //       child: Image.asset(
                        //         'assets/images/india-gov-logo.png',
                        //         height: 32,
                        //       ),
                        //     ),
                        //     const SizedBox(width: 30),
                        //     InkWell(
                        //       onTap: () async {
                        //         const url = 'https://manipur.mygov.in/';
                        //         if (await canLaunchUrl(Uri.parse(url))) {
                        //           await launchUrl(
                        //             Uri.parse(url),
                        //             mode: LaunchMode.externalApplication,
                        //           );
                        //         }
                        //       },
                        //       child: Image.asset(
                        //         'assets/images/MyGov-logo.png',
                        //         height: 32,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // ...existing code...
                        // const _FooterLink('Accountant General Manipur'),
                        // const SizedBox(height: 8),
                        // const _FooterLink('Online GPF Information System'),
                        // const SizedBox(height: 8),
                        // const _FooterLink('Budget'),
                      ],
                    ),
                  ],
                ),
            const SizedBox(height: 24),
            Text(
              '© 2025 Directorate of Management Information System (MIS). All rights reserved.',
              style: GoogleFonts.publicSans(
                color: const Color(0xFF5E7387),
                fontSize: 13,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      // ...existing code...

      // ...existing code...
      // ...existing code...
    );
  }
}

class ContactFooterLink extends StatelessWidget {
  final String text;
  const ContactFooterLink(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.publicSans(
        color: const Color(0xFF5E7387),
        fontSize: 14,
      ),
      textAlign: TextAlign.left,
    );
  }
}

class _FooterLink extends StatefulWidget {
  final String text;
  final String? url; // Optional: allow passing a URL
  const _FooterLink({required this.text, this.url, super.key});

  @override
  State<_FooterLink> createState() => _FooterLinkState();
}

class _FooterLinkState extends State<_FooterLink> {
  bool _isHovering = false;

  // Optional: Map text to URLs if not provided directly
  String? get _linkUrl {
    if (widget.url != null) return widget.url;
    switch (widget.text) {
      case 'Manipur Government Official site':
        return 'https://manipur.gov.in/';
      case 'National Informatics Centre, Manipur State Centre':
        return 'https://manipur.nic.in/';
      case 'CMIS (Central Management Information System V2.0)':
        return 'https://cmis.man.nic.in/sevaarth/home1/sevaarthhome.php';
      case 'MyGov':
        return 'https://manipur.mygov.in/';
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isClickable = _linkUrl != null;
    return MouseRegion(
      cursor: isClickable ? SystemMouseCursors.click : MouseCursor.defer,
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: InkWell(
        onTap:
            isClickable
                ? () async {
                  final url = _linkUrl!;
                  // if (await canLaunchUrl(Uri.parse(url))) {
                  //   await launchUrl(
                  //     Uri.parse(url),
                  //     mode: LaunchMode.externalApplication,
                  //   );
                  // }
                }
                : null,
        child: Text(
          widget.text,
          style: GoogleFonts.publicSans(
            color: _isHovering ? Colors.white : const Color(0xFF5E7387),
            fontSize: 14,
            decoration:
                _isHovering ? TextDecoration.underline : TextDecoration.none,
            decorationColor: Colors.white,
          ),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}
