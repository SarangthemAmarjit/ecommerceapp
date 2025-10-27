import 'dart:ui';

import 'package:ecommerceapp/pages/pages/ecommerce_page/cart/componend/product_list.dart';
import 'package:flutter/material.dart';

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
Color maincolor = Color.fromARGB(255, 0, 61, 41);

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

final List<Product> allcartproduct = [
  Product(
    id: 1,
    image: 'assets/images/static_images/product_images/product_image_15.jpeg',
    name: 'All Natural Italian-Style Chicken Meatballs',
    price: 5.50,
    quantity: 2,
    subtotal: 11.00,
  ),
  Product(
    id: 2,
    image: 'assets/images/static_images/product_images/product_image_16.png',
    name: 'Apple iPhone 11 64GB Yellow Fully Unlocked',
    price: 599.00,
    quantity: 1,
    subtotal: 599.00,
  ),
  Product(
    id: 3,
    image: 'assets/images/static_images/product_images/product_image_17.png',
    name: 'Organic Sweet Lime / Mosambi',
    price: 20.00,
    quantity: 1,
    subtotal: 20.00,
  ),
  Product(
    id: 4,
    image: 'assets/images/static_images/product_images/product_image_18.jpeg',
    name: 'Pepperidge Farm Farmhouse Hearty White Bread',
    price: 45.00,
    quantity: 1,
    subtotal: 45.00,
  ),
  Product(
    id: 5,
    image: 'assets/images/static_images/product_images/product_image_19.png',
    name: 'Organic Green Seedless Grapes',
    price: 60.00,
    quantity: 1,
    subtotal: 60.00,
  ),
  Product(
    id: 6,
    image: 'assets/images/static_images/product_images/product_image_20.png',
    name: 'Lemon Cream Crunch Cookies',
    price: 35.00,
    quantity: 2,
    subtotal: 70.00,
  ),
  Product(
    id: 7,
    image: 'assets/images/static_images/product_images/product_image_21.png',
    name: 'Best Bluetooth Headphone',
    price: 49.50,
    quantity: 2,
    subtotal: 99.00,
  ),
  Product(
    id: 8,
    image: 'assets/images/static_images/product_images/product_image_22.png',
    name: 'Apple TV HD 32GB (2nd Generation)',
    price: 149.00,
    quantity: 1,
    subtotal: 149.00,
  ),
  Product(
    id: 9,
    image: 'assets/images/static_images/product_images/product_image_23.jpeg',
    name: 'Premium Cavendish Banana',
    price: 20.00,
    quantity: 1,
    subtotal: 20.00,
  ),
  Product(
    id: 10,
    image: 'assets/images/static_images/product_images/product_image_24.png',
    name: 'All Natural Italian-Style Chicken Meatballs',
    price: 5.50,
    quantity: 2,
    subtotal: 11.00,
  ),
  Product(
    id: 11,
    image: 'assets/images/static_images/product_images/product_image_22.png',
    name: 'Apple TV HD 32GB (2nd Generation)',
    price: 149.00,
    quantity: 1,
    subtotal: 149.00,
  ),
  Product(
    id: 12,
    image: 'assets/images/static_images/product_images/product_image_24.png',
    name: 'All Natural Italian-Style Chicken Meatballs',
    price: 5.50,
    quantity: 2,
    subtotal: 11.00,
  ),
];

final List<Map<String, dynamic>> products = [
  {
    'name': 'Laptop Sleeve Briefcase',
    'price': 14.99,
    'imageUrl':
        'https://images.unsplash.com/photo-1588872657578-7efd1f1555ed?w=300',
    'description': 'Slim laptop case with water-resistant fabric.',
    'rating': 4.7,
    'reviews': 245,
  },
  {
    'name': 'On Ear Headphones',
    'price': 29.99,
    'imageUrl':
        'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=300',
    'description': 'Comfortable fit with rich sound and deep bass.',
    'rating': 4.8,
    'reviews': 310,
  },
  {
    'name': 'iPhone Leather Case',
    'price': 19.99,
    'imageUrl':
        'https://images.unsplash.com/photo-1591337676887-a217a6970a8a?w=300',
    'description': 'Genuine leather case with magnetic alignment.',
    'rating': 4.6,
    'reviews': 182,
  },
  {
    'name': 'Thermal Water Bottle',
    'price': 24.99,
    'imageUrl':
        'https://images.unsplash.com/photo-1602143407151-7111542de6e8?w=300',
    'description': 'Keeps drinks hot or cold for up to 12 hours.',
    'rating': 4.9,
    'reviews': 501,
  },
  {
    'name': 'Leather Wallet Brown',
    'price': 34.99,
    'imageUrl':
        'https://images.unsplash.com/photo-1627123424574-724758594e93?w=300',
    'description': 'Classic handcrafted wallet with 6 card slots.',
    'rating': 4.5,
    'reviews': 210,
  },
  {
    'name': 'MacBook Air 13"',
    'price': 899.99,
    'imageUrl':
        'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=300',
    'description': 'Apple M2 chip, 8GB RAM, 256GB SSD storage.',
    'rating': 4.9,
    'reviews': 178,
  },
  {
    'name': 'Life Preserver Ring',
    'price': 14.99,
    'imageUrl':
        'https://images.unsplash.com/photo-1589519160732-57fc498494f8?w=300',
    'description': 'Durable foam ring for safety and rescue use.',
    'rating': 4.4,
    'reviews': 87,
  },
  {
    'name': 'iPad Air 5 Purple',
    'price': 549.99,
    'imageUrl':
        'https://images.unsplash.com/photo-1544244015-0df4b3ffc6b0?w=300',
    'description': '10.9-inch Liquid Retina display with M1 chip.',
    'rating': 4.8,
    'reviews': 134,
  },
];

final List<Map<String, dynamic>> categories = [
  {
    'title': 'T-Shirts',
    'color': const Color(0xFF4FA9AB).withOpacity(0.3),
    'image': 'assets/images/static_images/productcategory/tshirts.webp',
  },
  {
    'title': 'Shoes',
    'color': const Color(0xFFFF9066).withOpacity(0.3),
    'image': 'assets/images/static_images/productcategory/shoes.webp',
  },
  {
    'title': 'Woman Bag',
    'color': const Color(0xFF8B1538).withOpacity(0.3),
    'image': 'assets/images/static_images/productcategory/womanbags.webp',
  },
  {
    'title': 'Fresh Food',
    'color': const Color(0xFF2DB224).withOpacity(0.3),
    'image': 'assets/images/static_images/productcategory/freshfood.webp',
  },
  {
    'title': 'Electronics',
    'color': const Color(0xFFFFCDD2).withOpacity(0.3),
    'image': 'assets/images/static_images/productcategory/electronics.webp',
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
