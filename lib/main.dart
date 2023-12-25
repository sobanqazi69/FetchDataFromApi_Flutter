// ignore_for_file: prefer_const_constructors, unnecessary_import, unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/route_manager.dart';
import 'package:hiring_task/homepage.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
 
  Widget build(BuildContext context) {
    return GetMaterialApp(home: homepage());
  }
}
