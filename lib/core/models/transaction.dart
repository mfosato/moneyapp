enum TransactionType { pay, topUp }

class TransactionModel {
  String name;
  TransactionType transactionType;
  double amount;
  DateTime dateTime;

  TransactionModel(
      {this.name, this.transactionType, this.amount, this.dateTime});

  TransactionModel.fromMap(Map<String, dynamic> json)
      : name = json['name'],
        transactionType = json['transaction_type'],
        amount = json['amount'],
        dateTime = json['datetime'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'transaction_type': transactionType,
        'amount': amount,
        'datetime': dateTime
      };
}
