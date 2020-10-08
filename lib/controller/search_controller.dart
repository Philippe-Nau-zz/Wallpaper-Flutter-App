import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper/models/wallpaper_model.dart';
import 'package:wallpaper/utils/constants.dart';

class SearchController extends GetxController {
  final List<WallpaperModel> _searchWallpapers = [];
  List<WallpaperModel> get searchWallpapers => _searchWallpapers;

  TextEditingController searchController = TextEditingController();

  Future searchWallPapers(String value) async {
    _searchWallpapers.clear();
    var response = await http
        .get('https://api.pexels.com/v1/search?query=$value', headers: {
      'Authorization': Constants.API_KEY,
    });
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      data['photos'].forEach((element) {
        _searchWallpapers.add(
          WallpaperModel(
            largeUrl: element['src']['large'],
            mediumUrl: element['src']['medium'],
          ),
        );
      });
      update();
    } else {
      print('error');
    }
  }
}
