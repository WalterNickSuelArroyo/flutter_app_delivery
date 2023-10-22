import 'package:flutter/material.dart';
import 'package:flutter_app_delivery/src/pages/client/products/list/client_products_list_controller.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ClientProductsListPage extends StatelessWidget {
  ClientProductsListController con = Get.put(ClientProductsListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('CLIENT PRODUCTS LIST'),
      )
    );
  }
  
}
