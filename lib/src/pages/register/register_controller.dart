import 'package:flutter/material.dart';
import 'package:flutter_app_delivery/src/models/user.dart';
import 'package:flutter_app_delivery/src/provider/users_provider.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  UsersProvider usersProvider = UsersProvider();

  void register() async{
    String email = emailController.text.trim();
    String name = nameController.text;
    String lastname = lastNameController.text;
    String phone = phoneController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    print('Email: ${email}');
    print('Password: ${password}');

    if (isValidForm(email, name, lastname, phone, password, confirmPassword)) {
      User user = User(
        email: email, 
        name: name, 
        lastname: lastname, 
        phone: phone, 
        password: password,
      );
      Response response = await usersProvider.create(user);

      print('RESPONSE: ${response.body}');

      Get.snackbar('Formulario valido', 'Estas listo para enviar la peticion');
    }
    
  }
  bool isValidForm(String email, String name, String lastName, String phone, String password, String confirmPassword) {
      
      if (email.isEmpty) {
        Get.snackbar('Formulario no valido', 'Debes ingresar el email');
        return false;
      }
      if (!GetUtils.isEmail(email)) {
        Get.snackbar('Formulario no valido', 'El email no es valido');
        return false;
      }
      if (name.isEmpty) {
        Get.snackbar('Formulario no valido', 'Debes ingresar tu nombre');
        return false;
      }
      if (lastName.isEmpty) {
        Get.snackbar('Formulario no valido', 'Debes ingresar tu apellido');
        return false;
      }
      if (phone.isEmpty) {
        Get.snackbar('Formulario no valido', 'Debes ingresar tu telefono');
        return false;
      }
      if (password.isEmpty) {
        Get.snackbar('Formulario no valido', 'Debes ingresar la contraseña');
        return false;
      }
      if (confirmPassword.isEmpty) {
        Get.snackbar('Formulario no valido', 'Debes confirmar la contraseña');
        return false;
      }
      if (password != confirmPassword) {
        Get.snackbar('Formulario no valido', 'Las contraseñas no coinciden');
        return false;
      }
      return true;
    }
}