import 'package:flutter_app_delivery/src/models/category.dart';
import 'package:flutter_app_delivery/src/providers/categories_provider.dart';
import 'package:get/get.dart';

class ClientProductsListController extends GetxController {
  CategoriesProvider categoriesProvider = CategoriesProvider();
  List<Category> categories = <Category>[].obs;

  ClientProductsListController() {
    getCategories();
  }
  
  void getCategories() async {
    var result = await categoriesProvider.getAll();
    categories.clear();
    categories.addAll(result);
  }
}