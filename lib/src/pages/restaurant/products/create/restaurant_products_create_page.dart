import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_delivery/src/models/category.dart';
import 'package:flutter_app_delivery/src/pages/restaurant/products/create/restaurant_products_create_controller.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class RestaurantProductsCreatePage extends StatelessWidget {

  RestaurantProductsCreateController con = Get.put(RestaurantProductsCreateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => Stack(
        children: [
          _backgroundCover(context),
          _boxForm(context),
          _textNewCategory(context),
        ],
      ),
    ));
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
      height: MediaQuery.of(context).size.height * 0.70,
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.15, left: 50, right: 50),
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
            _textFieldPrice(),
            _dropDownCategories(con.categories),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GetBuilder<RestaurantProductsCreateController>(
                    builder: (value) => _cardImage(context, con.imageFile1, 1),
                  ),
                  SizedBox(width: 5,),
                  GetBuilder<RestaurantProductsCreateController>(
                    builder: (value) => _cardImage(context, con.imageFile2, 2),
                  ),
                  SizedBox(width: 5,),
                  GetBuilder<RestaurantProductsCreateController>(
                    builder: (value) => _cardImage(context, con.imageFile3, 3),
                  ),
                ],
              ),
            ),
            
            _buttonCreate(context)
          ],
        ),
      ),
    );
  }

  Widget _dropDownCategories (List<Category> categories) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      margin: EdgeInsets.only(top: 15),
      child: DropdownButton(
        underline: Container(
          alignment: Alignment.centerRight,
          child: Icon(
            Icons.arrow_drop_down_circle,
            color: Colors.amber,
          ),
        ),
        elevation: 3,
        isExpanded: true,
        hint: Text(
          'Seleccionar categoria',
          style: TextStyle(
            fontSize: 15
          ),
        ),
        items: _dropDownItems(categories),
        value: con.idCategory.value == '' ? null : con.idCategory.value,
        onChanged: (option) {
          print('Opcion seleccionada ${option}');
          con.idCategory.value = option.toString();
        },
      ),
    );
  }

  List<DropdownMenuItem<String?>> _dropDownItems(List<Category> categories) {
    List<DropdownMenuItem<String>> list = [];
    categories.forEach((category) {
      list.add(DropdownMenuItem(
        child: Text(category.name ?? ''),
        value: category.id,
      ));
    });
    return list;
  }

  Widget _cardImage(BuildContext context, File? imageFile, int numberFile) {
    return GestureDetector(
      onTap: () => con.showAlertDialog(context, numberFile),
      child: Card(
        elevation: 3,
        child: Container(
          padding: EdgeInsets.all(10),
          height: 70,
          width: MediaQuery.of(context).size.width * 0.18,
          child: imageFile != null
          ? Image.file(
            imageFile,
            fit: BoxFit.cover,
          )
          : Image(
            image: AssetImage('assets/img/cover_image.png'))
        ),
        )
        
    );
  }

  Widget _textFieldPrice() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: TextField(
        controller: con.priceController,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          hintText: 'Precio',
          prefixIcon: Icon(Icons.attach_money)
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
        onPressed: () => con.createProduct(context),
        style: ElevatedButton.styleFrom(
            padding:const EdgeInsets.symmetric(vertical: 15) 
          ),
        child: const Text(
          'CREAR PRODUCTO',
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
        child: Text(
              'NUEVO PRODUCTO',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23
              ),
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