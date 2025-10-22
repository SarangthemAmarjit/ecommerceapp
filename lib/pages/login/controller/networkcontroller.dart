// controllers/network_controller.dart
import 'package:get/get.dart';

class NetworkController extends GetxController {
  var iservererror = false.obs;
  var isLoading = false.obs;

  void setServerStatus(bool status) {
    iservererror.value = status;
  }

  void setLoading(bool loading) {
    isLoading.value = loading;
  }
}
