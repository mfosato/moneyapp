import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:zardella_assignment/core/models/transaction.dart';
import 'package:zardella_assignment/pages/home/controller/home_controller.dart';

class PayController extends GetxController {
  final homeController = Get.find<HomeController>();
  void buttonFunction(isTopUp, text) {
    final format = NumberFormat('#,##0.00', 'en_US');
    if (isTopUp && text.length > 0) {
      homeController.topUp(TransactionModel(
          name: 'Top Up',
          transactionType: TransactionType.topUp,
          amount: double.parse(text),
          dateTime: DateTime.now()));
      Get.back();
      Get.snackbar('Top Up Successful',
          'You have added £${double.parse(text).toStringAsFixed(2)} to your account.');
    } else
      Get.toNamed('/recipient',
          arguments:
              format.format(double.parse(text.length == 0 ? '0' : text)));
  }
}
