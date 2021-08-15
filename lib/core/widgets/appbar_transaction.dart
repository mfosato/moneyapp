import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zardella_assignment/core/utils/colors.dart';

class AppBarTransaction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors().primaryColor,
      shadowColor: Colors.transparent,
      title: const Text('MoneyApp'),
      automaticallyImplyLeading: false,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: InkWell(
            highlightColor: Colors.transparent,
            onTap: () {
              Get.back();
            },
            child: Container(
              width: 30,
              decoration: const BoxDecoration(
                  color: Colors.white, shape: BoxShape.circle),
              child: Icon(Icons.close, color: AppColors().primaryColor),
            ),
          ),
        )
      ],
    );
  }
}
