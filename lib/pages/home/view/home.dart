import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:zardella_assignment/core/models/transaction.dart';
import 'package:zardella_assignment/core/utils/colors.dart';
import 'package:zardella_assignment/pages/home/controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  final DateFormat generalFormat = DateFormat('yyyyMMdd');

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors().primaryColor,
        shadowColor: Colors.transparent,
        title: const Text('MoneyApp'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                height: 130,
                color: AppColors().primaryColor,
                child: Center(
                    child: Obx(
                  () => Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('£',
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.w500)),
                      Text(
                          homeController
                              .compute()
                              .toStringAsFixed(2)
                              .split('.')[0],
                          style: const TextStyle(
                              fontSize: 40,
                              height: 0.8,
                              color: Colors.white,
                              fontWeight: FontWeight.w600)),
                      Text(
                          '.${homeController.compute().toStringAsFixed(2).split('.')[1]}',
                          style: const TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                ))),
            Container(
              height: 100,
              child: Stack(children: [
                Container(height: 50, color: AppColors().primaryColor),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0, 0),
                                blurRadius: 10.0),
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.toNamed('/pay', arguments: false);
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.payment, size: 50),
                                Text('Pay', style: TextStyle(fontSize: 14))
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed('/pay', arguments: true);
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.add_circle, size: 50),
                                Text('Top up', style: TextStyle(fontSize: 14))
                              ],
                            ),
                          )
                        ],
                      )),
                )
              ]),
            ),
            const SizedBox(
              height: 10,
            ),
            const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text('Recent Activity',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w600)),
                )),
            Expanded(
                child: Container(
              child: Obx(
                () => GroupedListView(
                  elements: homeController.transactionData
                      .where((transc) =>
                          generalFormat.format(transc.dateTime) ==
                              generalFormat.format(DateTime.now()) ||
                          generalFormat.format(transc.dateTime) ==
                              generalFormat.format(DateTime.now()
                                  .subtract(const Duration(days: 1))))
                      .toList(),
                  groupBy: (TransactionModel transc) =>
                      generalFormat.format(transc.dateTime),
                  groupComparator: (value1, value2) =>
                      double.parse(value1).compareTo(double.parse(value2)),
                  itemComparator:
                      (TransactionModel transc1, TransactionModel transc2) =>
                          transc1.dateTime.compareTo(transc2.dateTime),
                  order: GroupedListOrder.DESC,
                  useStickyGroupSeparators: true,
                  groupSeparatorBuilder: (String datetime) => Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    padding:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                    child: Text(
                      generalFormat.format(DateTime.now()) == datetime
                          ? 'TODAY'
                          : generalFormat.format(DateTime.now()
                                      .subtract(const Duration(days: 1))) ==
                                  datetime
                              ? 'YESTERDAY'
                              : DateFormat.yMMMMd()
                                  .format(DateTime.parse(datetime))
                                  .toUpperCase(),
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                  ),
                  itemBuilder: (c, TransactionModel transc) {
                    return Container(
                      padding: const EdgeInsets.all(4),
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                          color: AppColors().primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Icon(
                                            transc.transactionType ==
                                                    TransactionType.pay
                                                ? Icons.shopping_bag
                                                : Icons.add_circle,
                                            color: Colors.white),
                                      )),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(transc.name,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700))
                                ]),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                if (transc.transactionType ==
                                    TransactionType.topUp)
                                  Text('+',
                                      style: TextStyle(
                                          fontSize: 16,
                                          height: 1.6,
                                          color: AppColors().primaryColor)),
                                Text(
                                    transc.amount
                                        .toStringAsFixed(2)
                                        .split('.')[0],
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: transc.transactionType ==
                                                TransactionType.topUp
                                            ? AppColors().primaryColor
                                            : Colors.black)),
                                Text(
                                    ".${transc.amount.toStringAsFixed(2).split('.')[1]}",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: transc.transactionType ==
                                                TransactionType.topUp
                                            ? AppColors().primaryColor
                                            : Colors.black)),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
