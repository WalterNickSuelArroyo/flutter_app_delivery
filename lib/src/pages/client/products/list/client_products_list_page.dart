import 'package:flutter/material.dart';
import 'package:flutter_app_delivery/src/models/category.dart';
import 'package:flutter_app_delivery/src/pages/client/products/list/client_products_list_controller.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ClientProductsListPage extends StatelessWidget {
  ClientProductsListController con = Get.put(ClientProductsListController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: con.categories.length,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBar(
            bottom: TabBar(
              isScrollable: true,
              indicatorColor: Colors.amber,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey[600],
              tabs: List<Widget>.generate(con.categories.length, (index) {
                return Tab(
                  child: Text(con.categories[index].name ?? ''),
                );
                
              }),
              ),
          ),
        ),
        body: TabBarView(
          children: con.categories.map((Category category){
            return Container();
          }).toList()
        )
      ),
    );
  }
  
}
