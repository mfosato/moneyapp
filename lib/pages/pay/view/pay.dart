import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:zardella_assignment/core/utils/colors.dart';
import 'package:zardella_assignment/core/widgets/appbar_transaction.dart';
import 'package:zardella_assignment/pages/pay/controller/pay_controller.dart';

class PayScreen extends StatefulWidget {
  @override
  State<PayScreen> createState() => _PayScreenState();
}

class _PayScreenState extends State<PayScreen> {
  String text = '';
  bool isTopUp = false;

  void _onKeyboardTap(String value) {
    setState(() {
      if (text.contains('.')) {
        if (text.split('.')[1].length < 2) {
          text = text + value;
        }
      } else {
        text = text + value;
      }
    });
  }

  @override
  void initState() {
    isTopUp = Get.arguments;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final payController = Get.find<PayController>();

    return Scaffold(
      backgroundColor: AppColors().primaryColor,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50), child: AppBarTransaction()),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text('How much?',
              style: TextStyle(fontSize: 30, color: Colors.white)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text('£',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w500)),
              Text(
                  text.contains('.')
                      ? text.split('.')[0].isEmpty
                          ? '0'
                          : text.split('.')[0]
                      : text.isEmpty
                          ? '0'
                          : text,
                  style: const TextStyle(
                      fontSize: 50,
                      height: 0.7,
                      color: Colors.white,
                      fontWeight: FontWeight.w700)),
              const Text('.',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w700)),
              Text(
                  text.contains('.')
                      ? (text.split('.')[1].length > 1
                          ? text.split('.')[1].substring(0, 2)
                          : text.split('.')[1].isEmpty
                              ? '00'
                              : text.split('.')[1] + '0')
                      : '00',
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w700)),
            ],
          ),
          Container(
            width: 700,
            child: NumericKeyboard(
                onKeyboardTap: _onKeyboardTap,
                textColor: Colors.white,
                rightButtonFn: () {
                  setState(() {
                    if (text.isNotEmpty)
                      text = text.substring(0, text.length - 1);
                  });
                },
                rightIcon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                leftButtonFn: () {
                  if (!text.contains('.')) {
                    text += '.';
                  }
                },
                leftIcon: const Icon(
                  Icons.circle,
                  size: 5,
                  color: Colors.white,
                ),
                mainAxisAlignment: MainAxisAlignment.spaceBetween),
          ),
          Container(
              width: 200,
              child: TextButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.white30)),
                  onPressed: () {
                    payController.buttonFunction(isTopUp, text);
                  },
                  child: Text(isTopUp ? 'Top Up' : 'Next',
                      style: const TextStyle(color: Colors.white))))
        ],
      ),
    );
  }
}
