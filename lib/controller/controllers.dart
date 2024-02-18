import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/state_manager.dart';
import 'package:rampi_dashboard/model/rampa_class.dart';

class Controller extends GetxController {
  RxBool selected = false.obs;
  RxString id = "".obs;
  Rx<Rampa> rampa = Rampa(
    coordenadas: [0, 0],
    dataAdicionado: 0,
    inclinacao: 0,
    condicao: 0,
    foto: "",
    id: "",
  ).obs;
}
