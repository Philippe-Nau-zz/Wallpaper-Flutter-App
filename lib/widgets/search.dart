import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper/controller/search_controller.dart';

class Search extends StatelessWidget {
  final _controller = Get.put(SearchController());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      margin: EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: Color(0xfff5f8fd),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller.searchController,
              decoration: InputDecoration(
                hintText: 'Search Wallpaper',
                border: InputBorder.none,
              ),
              onSubmitted: (_) {
                if (_controller.searchController.text.isNotEmpty) {
                  _controller
                      .searchWallPapers(_controller.searchController.text);
                  _controller.searchController.clear();
                  Get.toNamed('/search');
                }
              },
            ),
          ),
          GestureDetector(
            onTap: () {
              if (_controller.searchController.text.isNotEmpty) {
                _controller.searchWallPapers(_controller.searchController.text);
                _controller.searchController.clear();
                Get.toNamed('/search');
              }
            },
            child: Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}
