import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:random_string/random_string.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wallpaper/utils/constants.dart';

class ImageViewController extends GetxController {
  String _imageUrl;
  String get imageUrl => _imageUrl;

  var _isSaving = false.obs;
  bool get isSaving => _isSaving.value;

  @override
  void onInit() {
    super.onInit();
    this._imageUrl = Get.arguments;
  }

  saveImage(String imgUrl) async {
    await _askPermission();
    _isSaving.value = true;
    Dio dio = Dio();
    try {
      var dir = await getExternalStorageDirectory();
      var fileName = randomAlpha(5);
      await dio.download(imgUrl, "${dir.path}/$fileName.jpg").then((value) {
        Get.snackbar(
          'Success',
          'Wallpaper saved',
          backgroundColor: Colors.white,
          colorText: Colors.blue,
          icon: Icon(
            Icons.check_circle_outline_rounded,
            size: 30,
            color: Colors.blue,
          ),
        );
        Timer(Duration(seconds: 3), () => Get.back());
      });
    } catch (e) {
      _isSaving.value = false;
      Get.snackbar(
        'Error',
        e.toString(),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.white,
        colorText: Colors.red,
        icon: Icon(
          Icons.close_rounded,
          size: 30,
          color: Colors.red,
        ),
      );
    }
  }

  _askPermission() async {
    if (Platform.isIOS) {
      await PermissionHandler().requestPermissions([PermissionGroup.photos]);
    } else {
      await PermissionHandler().checkPermissionStatus(PermissionGroup.storage);
    }
  }

  launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        headers: <String, String>{
          'Authorization': Constants.API_KEY,
        },
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}
