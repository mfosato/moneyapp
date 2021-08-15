import 'package:get/get.dart';
import 'package:zardella_assignment/pages/recipient/controller/recipient_controller.dart';

class RecipientBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RecipientController());
  }
}
