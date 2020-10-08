import 'dart:convert';
import 'package:get/get.dart';
import 'package:wallpaper/data/categories_data.dart';
import 'package:wallpaper/models/categories_model.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper/models/wallpaper_model.dart';
import 'package:wallpaper/utils/constants.dart';

class HomeController extends GetxController {
  final List<CategoriesModel> _categories = CATEGORIES_DATA;
  List<CategoriesModel> get categories => _categories;

  final List<WallpaperModel> _wallpapers = [];
  List<WallpaperModel> get wallpapers => _wallpapers;

  onInit() {
    getWallPapers();
    super.onInit();
  }

  Future getWallPapers() async {
    var response = await http.get(Constants.CURATED_URL, headers: {
      'Authorization': Constants.API_KEY,
    });
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      data['photos'].forEach((element) {
        _wallpapers.add(WallpaperModel(
          originalUrl: element['src']['original'],
          mediumUrl: element['src']['medium'],
        ));
      });
      update();
    } else {
      print('error');
    }
  }
}
