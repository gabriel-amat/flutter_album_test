import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/controller_binding.dart';
import 'package:test_app/pages/home/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: ControllersBindings(),
      title: 'Test app',
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
