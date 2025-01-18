import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  var isLoading = true.obs;

  void finishLoading() {
    isLoading.value = false;
  }
}
