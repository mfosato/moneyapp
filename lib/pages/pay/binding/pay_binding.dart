import 'package:get/get.dart';
import 'package:zardella_assignment/pages/pay/controller/pay_controller.dart';

class PayBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PayController());
  }
}
