import 'package:flutter/material.dart';
import 'package:flutter_app_delivery/src/models/Rol.dart';
import 'package:flutter_app_delivery/src/pages/roles/roles_controller.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class RolesPage extends StatelessWidget {

  RolesController con = Get.put(RolesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Seleccionar el rol',
          style: TextStyle(
            color: Colors.black
          ),),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.20),
        child: ListView(
          children: con.user.roles != null ? con.user.roles!.map((Rol rol) {
            return _cardRol(rol);
          }).toList() : [],
        ),
      ),
    );
  }
  Widget _cardRol(Rol rol) {
    return GestureDetector(
      onTap: () => con.goToPageRol(rol),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 25),
            height: 100,
            child: FadeInImage(
              image: NetworkImage(rol.image!),
              fit: BoxFit.contain,
              fadeInDuration: const Duration(milliseconds: 50),
              placeholder: const AssetImage('assets/img/no-image.png'),
            ),             
          ),
          Text(
            rol.name ?? '',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black
            ),
          )
        ],
      ),
    );
  }
}