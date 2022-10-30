
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:proyecto_veterinaria_arca/environment/preferencias_usuario.dart';
import 'package:proyecto_veterinaria_arca/usuario/usuario_conntroller.dart';

import '../../models/Categoria.dart';
import '../../models/Mascota.dart';
import '../../models/UsuarioLogin.dart';
import '../../providers/animal_provider.dart';
import '../../providers/categoria_provider.dart';
import '../../usuario/logueado_controller.dart';
import 'mascota_controller.dart';

class HomeController extends GetxController {
  UsuarioModel user = UsuarioModel.fromJson(GetStorage().read('usuario') ?? {});
  PreferenciasUsuario prefs = PreferenciasUsuario();


  HomeController() {
    print('USUARIO DE SESION: ${user.toJson()}');
  }

  void cerrarSesion() {
    prefs.logueado = false;
    GetStorage().remove('usuario');

    Get.offNamedUntil('/login', (route) => false);
  }

  void eliminarMascota(){
    Get.delete<MascotaController>();
  }
  void seleccionarMascota(MascotaModel mascotaModel){
    var mascota = mascotaModel.toJson();
    GetStorage().write('mascota', mascota);
  }
  CategoriaProvider categoriaProvider = CategoriaProvider();
  AnimalsProvider animalsProvider = AnimalsProvider();


  Future<List<CategoriaModel>> listAllCategories() async{
    List<CategoriaModel> categorias = await categoriaProvider.getListarCategoria();
    var lista = categorias.toList();
    //GetStorage().write('categorias', lista);
    return categorias;
  }

  Future<List<MascotaModel>> listAllAnimals() async{
    List<MascotaModel> mascotas = await animalsProvider.getListarMascotas();
    //GetStorage().write('categorias', lista);
    return mascotas;
  }

}
