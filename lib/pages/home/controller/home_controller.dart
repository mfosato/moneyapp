import 'package:get/get.dart';
import 'package:zardella_assignment/core/models/transaction.dart';

class HomeController extends GetxController {
  var transactionData = [
    TransactionModel.fromMap({
      'name': 'eBay',
      'transaction_type': TransactionType.pay,
      'amount': 32.00,
      'datetime': DateTime.now()
    }),
    TransactionModel.fromMap({
      'name': 'Merton Council',
      'transaction_type': TransactionType.pay,
      'amount': 65.00,
      'datetime': DateTime.now()
    }),
    TransactionModel.fromMap({
      'name': 'Top Up',
      'transaction_type': TransactionType.topUp,
      'amount': 150.00,
      'datetime': DateTime.now()
    }),
    TransactionModel.fromMap({
      'name': 'Amazon',
      'transaction_type': TransactionType.pay,
      'amount': 32.00,
      'datetime': DateTime.now().subtract(const Duration(days: 1))
    }),
    TransactionModel.fromMap({
      'name': 'John Snow',
      'transaction_type': TransactionType.pay,
      'amount': 1400.00,
      'datetime': DateTime.now().subtract(const Duration(days: 1))
    }),
    TransactionModel.fromMap({
      'name': 'Top Up',
      'transaction_type': TransactionType.topUp,
      'amount': 200.00,
      'datetime': DateTime.now().subtract(const Duration(days: 1))
    }),
    TransactionModel.fromMap({
      'name': 'Top Up',
      'transaction_type': TransactionType.topUp,
      'amount': 1329.25,
      'datetime': DateTime.parse('20210813'),
    })
  ].obs;

  void topUp(TransactionModel transactionModel) {
    transactionData.add(transactionModel);
  }

  double compute() {
    double currentAmount = 0;
    for (final tr in transactionData) {
      if (tr.transactionType == TransactionType.topUp)
        currentAmount += tr.amount;
      else
        currentAmount -= tr.amount;
    }
    return currentAmount;
  }
}
