import 'package:app_ui_03/data/products_repository.dart';
import 'package:app_ui_03/models/products.dart';
import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ProductsViewModel extends ChangeNotifier {
  ProductsRepository _productsRepository = ProductsRepository();
  List<Products> _allProducts = [];
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<Products> get allProducts => _allProducts;

  ProductsViewModel(){
    this.loadProducts();
  }

   RefreshController refreshController =
      RefreshController(initialRefresh: false);


  loadProducts() async {
    _isLoading = true;
    notifyListeners();
    List<Products> products = await _productsRepository.fetchProducts();
    _allProducts.addAll(products);
    _isLoading = false;
    notifyListeners();
  }
}