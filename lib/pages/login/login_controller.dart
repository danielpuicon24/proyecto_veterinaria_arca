
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:proyecto_veterinaria_arca/environment/preferencias_usuario.dart';
import 'package:proyecto_veterinaria_arca/usuario/usuario_conntroller.dart';

import '../../models/UsuarioLogin.dart';
import '../../providers/usuario_provider.dart';
import '../../usuario/logueado_controller.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController(text: 'juan23xx@gmail.com');
  TextEditingController passwordController = TextEditingController(text: 'Juan123@');
  PreferenciasUsuario prefs = PreferenciasUsuario();
  UsersProvider usersProvider = UsersProvider();

  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();


    if (isValidForm(email, password)) {
      UsuarioModel usuarioModel = await usersProvider.iniciarSesion(email, password);
      LogueadoController logueado = Get.put(LogueadoController());

      var usuario = usuarioModel.toJson();
      if (usuarioModel.resultado == "0") {
        prefs.logueado = true;
        GetStorage().write('usuario', usuario);
        Get.snackbar(usuarioModel.mensaje!, 'Estas listo');
        goToHomePage();
      } else {
        Get.snackbar('Login fallido', usuarioModel.nombres ?? '');
      }
    }
  }

  void goToRegisterPage() {
    Get.toNamed('/register');
  }

  void goToHomePage() {
    Get.offNamedUntil('/home', (route) => false);
  }

  bool isValidForm(String email, String password) {
    if (email.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debe ingresar un usuario');
      return false;
    }

    if (!GetUtils.isEmail(email)) {
      Get.snackbar('Formulario no valido', 'El usuario no es valido');
      return false;
    }

    if (password.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debe ingresar la clave');
      return false;
    }

    return true;
  }
}