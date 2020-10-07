import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wallpaper/utils/constants.dart';

class ImageViewController extends GetxController {
  String _imageUrl;
  String get imageUrl => _imageUrl;

  @override
  void onInit() {
    super.onInit();
    this._imageUrl = Get.arguments;
  }

  saveImage(String imgUrl) async {
    await _askPermission();
    var response = await Dio()
        .get(imgUrl, options: Options(responseType: ResponseType.bytes));
    final result =
        await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
    print(result);
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
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{
          'Authorization': Constants.API_KEY,
        },
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}
