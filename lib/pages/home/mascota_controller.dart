

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../models/Mascota.dart';

class MascotaController extends GetxController{
  MascotaModel mascotaModel = MascotaModel.fromJson(GetStorage().read('mascota')  ?? {} );

}