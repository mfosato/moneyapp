import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zardella_assignment/pages/home/binding/home_binding.dart';
import 'package:zardella_assignment/pages/home/view/home.dart';
import 'package:zardella_assignment/pages/pay/binding/pay_binding.dart';
import 'package:zardella_assignment/pages/pay/view/pay.dart';
import 'package:zardella_assignment/pages/recipient/binding/recipient_binding.dart';
import 'package:zardella_assignment/pages/recipient/view/recipient.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      getPages: [
        GetPage(
            name: '/home', page: () => HomeScreen(), binding: HomeBinding()),
        GetPage(name: '/pay', page: () => PayScreen(), binding: PayBinding()),
        GetPage(
            name: '/recipient',
            page: () => const RecipientScreen(),
            binding: RecipientBinding()),
      ],
      initialRoute: '/home',
    );
  }
}
