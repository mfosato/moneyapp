import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zardella_assignment/core/models/transaction.dart';
import 'package:zardella_assignment/core/utils/colors.dart';
import 'package:zardella_assignment/core/widgets/appbar_transaction.dart';
import 'package:zardella_assignment/pages/recipient/controller/recipient_controller.dart';

class RecipientScreen extends StatefulWidget {
  final String amount;
  const RecipientScreen({this.amount});

  @override
  State<RecipientScreen> createState() => _RecipientScreenState();
}

class _RecipientScreenState extends State<RecipientScreen> {
  TextEditingController recipient = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final recipientController = Get.find<RecipientController>();

    return Scaffold(
      backgroundColor: AppColors().primaryColor,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50), child: AppBarTransaction()),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text('To who?',
                style: TextStyle(fontSize: 30, color: Colors.white)),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Theme(
                data: ThemeData(primaryColor: Colors.white),
                child: TextFormField(
                  style: const TextStyle(color: Colors.white),
                  controller: recipient,
                  cursorColor: Colors.white,
                  decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        //  when the TextFormField in focused
                      ),
                      focusColor: Colors.white,
                      fillColor: Colors.white,
                      hoverColor: Colors.white),
                ),
              ),
            ),
            Container(
                width: 200,
                child: TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white30)),
                    onPressed: () {
                      recipientController.pay(TransactionModel(
                        name: recipient.text,
                        amount: double.parse(Get.arguments),
                        transactionType: TransactionType.pay,
                      ));
                    },
                    child: const Text('Pay',
                        style: TextStyle(color: Colors.white))))
          ],
        ),
      ),
    );
  }
}
