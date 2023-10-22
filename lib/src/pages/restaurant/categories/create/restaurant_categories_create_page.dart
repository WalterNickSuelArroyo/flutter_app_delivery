import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_delivery/src/pages/restaurant/categories/create/restaurant_categories_create_controller.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class RestaurantCategoriesCreatePage extends StatelessWidget {

  RestaurantCategoriesCreateController con = Get.put(RestaurantCategoriesCreateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _backgroundCover(context),
          _boxForm(context),
          _textNewCategory(context),
        ],
      ),
    );
  }

  Widget _backgroundCover(context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.35,
      color: Colors.amber,
    );
  }
  Widget _boxForm(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.45,
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.25, left: 50, right: 50),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black54,
            blurRadius: 15,
            offset: Offset(0, 0.75)
          )
        ]
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _textYourInfo(),
            _textFieldName(),
            _textFielDescription(),
            _buttonCreate(context)
          ],
        ),
      ),
    );
  }
  Widget _textFieldName() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: TextField(
        controller: con.nameController,
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
          hintText: 'Nombre',
          prefixIcon: Icon(Icons.category)
        ),
      ),
    );
  }

  Widget _textFielDescription() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: TextField(
        controller: con.descriptionController,
        keyboardType: TextInputType.text,
        maxLines: 4,
        decoration: InputDecoration(
          hintText: 'Descripcion',
          prefixIcon: Container(
            margin: EdgeInsets.only(bottom: 50),
            child: Icon(Icons.description)
          )
        ),
      ),
    );
  }

  Widget _buttonCreate(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: ElevatedButton(
        onPressed: () => con.createCategory(),
        style: ElevatedButton.styleFrom(
            padding:const EdgeInsets.symmetric(vertical: 15) 
          ),
        child: const Text(
          'CREAR CATEGORIA',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w800,
            fontSize: 16
          ),
        )
      ),
    );
  }

  Widget _textNewCategory(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 45),
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Icon(Icons.category, size: 100,),
            Text(
              'NUEVA CATEGORIA',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23
              ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _textYourInfo() {
    return Container(
      margin: const EdgeInsets.only(top: 50, bottom: 20),
      child: const Text(
        'INGRESA ESTA INFORMACION',
        style: TextStyle(
          color: Colors.black,
          fontSize: 17
        ),
      ),
    );
  }
}