import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;

class SearchController extends GetxController {
  final List _searchWallpapers = [].obs;
  List get searchWallpapers => [..._searchWallpapers];

  TextEditingController searchController = TextEditingController();

  FocusNode searchFocusNode;

  onInit() {
    super.onInit();
    searchFocusNode = FocusNode();
  }

  onClose() {
    super.onClose();
    searchFocusNode.dispose();
  }

  Future searchWallPapers(String value) async {
    _searchWallpapers.clear();
    var response = await http
        .get('https://api.pexels.com/v1/search?query=$value', headers: {
      'Authorization':
          '563492ad6f91700001000001e229c1b02168440e8a1a175b29cd14f5',
    });
    Map<String, dynamic> data = jsonDecode(response.body);
    data['photos'].forEach((element) {
      _searchWallpapers.add(
        element['src']['original'],
      );
    });
  }
}
