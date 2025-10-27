import 'dart:developer';

import 'package:flutter/material.dart';

import '../models/models.dart' show eCommerceMockproducts, MockProduct;

export '../models/models.dart' show MockProduct;

class ECommerceMockProductsNotifier extends ChangeNotifier {
  ECommerceMockProductsNotifier()
    : fakeApiProducts = List.from(eCommerceMockproducts.take(10));

  final _baseList = [
    ...eCommerceMockproducts,
    ...eCommerceMockproducts.reversed,
  ];
  int get totalProducts => _baseList.length;
  List<MockProduct> fakeApiProducts = [];
  final cartProducts = <int>[];

  String _selectedCategory = 'All Category';
  String get selectedCategory => _selectedCategory;

    // Pagination Data
  int _showPerPage = 10;
  int get showPerPage => _showPerPage;

  int _currentPage = 1;
  int get currentPage => _currentPage;

  void setShowPerPage(int value) {
    _showPerPage = value;
    notifyListeners();
  }

  void setCurrentPage(int value) {
    _currentPage = value;
    loadProductsForPage(_currentPage, _showPerPage);
    notifyListeners();
  }

  void setSelectedCategory(String category) {
    log("Category Name : $category");
    _selectedCategory = category;
    if (category == 'All Category') {
      loadProductsForPage(_currentPage, _showPerPage);
      notifyListeners();
     
    }else{
  fakeApiProducts = _baseList
        .where((product) => product.category == category)
        .toList();
    notifyListeners();
    }
  
  }

  final favoriteProducts = <int>[];
  void addToFav(int id) {
    final alreadyAdded = favoriteProducts.any((eId) => eId == id);
    alreadyAdded ? favoriteProducts.remove(id) : favoriteProducts.add(id);
    notifyListeners();
  }

  // Pagination function
  void loadProductsForPage(int pageNumber, int itemsPerPage) {
    final skip = (pageNumber - 1) * itemsPerPage;
    fakeApiProducts = _baseList.skip(skip).take(itemsPerPage).toList();
    notifyListeners();
  }

    // Pagination function
  List<MockProduct> loadProducts(int pageNumber, int itemsPerPage)  {
    final skip = (pageNumber - 1) * itemsPerPage;
   var products = _baseList.skip(skip).take(itemsPerPage).toList();
    notifyListeners();
    return products;
  }
}
