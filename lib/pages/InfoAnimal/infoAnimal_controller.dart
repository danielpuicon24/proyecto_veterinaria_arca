import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../models/Mascota.dart';

class InfoAnimalController extends GetxController{
  final checkboxValue = false.obs;
  final checkboxValue2 = false.obs;

  addOrNotFavorite(){
    checkboxValue(!checkboxValue.value);
  }
  addOrNotFavorite2(){
    checkboxValue2(!checkboxValue2.value);
  }
}
