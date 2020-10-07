import 'package:get/get.dart';
import 'package:wallpaper/routes/route.dart';
import 'package:wallpaper/views/home_page.dart';
import 'package:wallpaper/views/imageView.dart';
import 'package:wallpaper/views/search_page.dart';

abstract class AppPages {
  static final pages = [
    GetPage(name: Routes.INITIAL, page: () => HomePage()),
    GetPage(name: Routes.SEARCH, page: () => SearchPage()),
    GetPage(name: Routes.IMAGEVIEW, page: () => ImageView()),
  ];
}
