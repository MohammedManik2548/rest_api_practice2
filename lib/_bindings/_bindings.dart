import 'package:get/get.dart';
import 'package:rest_api_practice2/controllers/my_home_page_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyHomePageController());
  }
}
