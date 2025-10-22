import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


bool isdemo = false;
var api = 'https://dmis.mn.gov.in';
// var api = 'http://10.10.1.118';

Color greencol = const Color(0xff008631);
Color bordercolor = const Color.fromARGB(255, 179, 179, 179);
Color bordercolorsecondary = const Color.fromARGB(255, 221, 220, 220);
Color greencolsecondary = const Color(0xff008631).withOpacity(0.3);
Color greencoltextfocus = const Color(0xff008631).withOpacity(0.5);
Color policebluecol = const Color(0xff0e0893);
Color policeredcol = const Color(0xffd40708);



final List<Map<String, dynamic>> demoadmins = [
  {
    'id': 1,
    'name': 'Vivek Kumar Dewangan, IAS',
    'designation': 'Additional Chief Secretary (Finance)',
  },
  {
    'id': 2,
    'name': 'N. Ashok Kumar, IAS',
    'designation': 'Commissioner-cum-Secretary',
  },
  {
    'id': 3,
    'name': 'Yumnam Nelson, MCS',
    'designation': 'Joint Secretary (Finance)',
  },
];

final List<Map<String, dynamic>> departmentStaff = [
  {
    'id': 1,
    'name': 'Dr. Sonia Oinam, MCS',
    'designation': 'Director',
    'email': 'sonia.oinam@gov.in',
  },
  {
    'id': 2,
    'name': 'Khumanthem Deepak Singh',
    'designation': 'System Manager',
    'email': 'kh.deepak@nic.in',
  },
  {
    'id': 3,
    'name': 'Rajkumar Manmohan Singh',
    'designation': 'Computer Programmer',
    'email': 'manmohan.rajkumar@manipur.gov.in',
  },
  {
    'id': 4,
    'name': 'Yumlembam Adhip Singh',
    'designation': 'Verification Assistant',
    'email': 'adhip.yumlembam@manipur.gov.in',
  },
  {
    'id': 5,
    'name': 'Hanjabam Premananda Sharma',
    'designation': 'Verification Assistant',
    'email': 'premananda.h@manipur.gov.in',
  },
  {
    'id': 6,
    'name': 'Pradeep Karam',
    'designation': 'Verification Assistant',
    'email': 'pradeep.karam@manipur.gov.in',
  },
  {
    'id': 7,
    'name': 'Loitongbam Premjit Singh',
    'designation': 'Verification Assistant',
    'email': 'premjit.loi@manipur.gov.in',
  },
  {
    'id': 8,
    'name': 'Kangabam Randip',
    'designation': 'Verification Assistant',
    'email': 'randip.kangabam@manipur.gov.in',
  },
  {
    'id': 9,
    'name': 'Khuraijam Jugindro Singh',
    'designation': 'Verification Assistant',
    'email': 'jugindro.khuraijam@manipur.gov.in',
  },
  {
    'id': 10,
    'name': 'Khaidem Bikramjit Meitei',
    'designation': 'Verification Assistant',
    'email': 'bikramjit.meitei@manipur.gov.in',
  },
  {
    'id': 11,
    'name': 'Hidam Surjoy Singh',
    'designation': 'Grade - IV',
    'email': '---',
  },
];

