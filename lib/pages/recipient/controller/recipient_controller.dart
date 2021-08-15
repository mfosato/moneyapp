import 'package:get/get.dart';
import 'package:zardella_assignment/core/models/transaction.dart';
import 'package:zardella_assignment/pages/home/controller/home_controller.dart';

class RecipientController extends GetxController {
  void pay(TransactionModel transc) {
    final homeController = Get.find<HomeController>();
    homeController.topUp(TransactionModel(
        name: transc.name,
        transactionType: transc.transactionType,
        amount: transc.amount,
        dateTime: DateTime.now()));
    Get.back();
    Get.back();
  }
}
