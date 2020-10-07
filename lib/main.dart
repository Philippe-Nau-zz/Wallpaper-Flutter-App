import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper/pages/pages.dart';
import 'package:wallpaper/routes/route.dart';
import 'package:wallpaper/views/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wallpaper Flutter',
      getPages: AppPages.pages,
      initialRoute: Routes.INITIAL,
      home: HomePage(),
    );
  }
}
