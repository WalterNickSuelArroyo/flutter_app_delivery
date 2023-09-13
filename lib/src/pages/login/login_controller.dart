import 'package:flutter/material.dart';
import 'package:flutter_app_delivery/src/models/response_api.dart';
import 'package:flutter_app_delivery/src/provider/users_provider.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  UsersProvider usersProvider = UsersProvider();
  void goToRegisterPage() {
    Get.toNamed('/register');
  }
  void login() async{
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    print('Email: ${email}');
    print('Password: ${password}');

    if (isValidForm(email, password)) {
      ResponseApi responseApi = await usersProvider.login(email, password);
      print('Response Api: ${responseApi.toJson()}');
      if (responseApi.sucess == true) {
        Get.snackbar('Login exitoso', responseApi.message ?? '');
      }
      else {
        Get.snackbar('Login fallido', responseApi.message ?? '');
      }
    }
    
  }
  bool isValidForm(String email, String password) {
      
      if (email.isEmpty) {
        Get.snackbar('Formulario no valido', 'Debes ingresar el email');
        return false;
      }
      if (!GetUtils.isEmail(email)) {
        Get.snackbar('Formulario no valido', 'El email no es valido');
        return false;
      }
      if (password.isEmpty) {
        Get.snackbar('Formulario no valido', 'Debes ingresar la contraseña');
        return false;
      }
      return true;
    }
}