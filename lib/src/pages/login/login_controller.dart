import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void goToRegisterPage() {
    Get.toNamed('/register');
  }
  void login() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    print('Email: ${email}');
    print('Password: ${password}');

    if (isValidForm(email, password)) {
      Get.snackbar('Formulario valido', 'Estas listo para enviar la peticion');
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