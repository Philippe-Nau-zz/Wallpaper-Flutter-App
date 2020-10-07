import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:wallpaper/controller/imageView_controller.dart';

class ImageView extends StatelessWidget {
  final _imageViewController = Get.put(ImageViewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GetBuilder<ImageViewController>(
            init: ImageViewController(),
            builder: (_controller) => Hero(
              tag: _controller.imageUrl,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Image.network(
                  _controller.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: MediaQuery.of(context).size.width > 350
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          kIsWeb
                              ? _imageViewController
                                  .launchUrl(_imageViewController.imageUrl)
                              : _imageViewController
                                  .saveImage(_imageViewController.imageUrl);
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 25),
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          height: 50,
                          width: 250,
                          decoration: BoxDecoration(
                            color: Color(0x90636e72),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Set Wallpaper',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                kIsWeb
                                    ? "Image will open in new tab to download"
                                    : "Image will be saved in gallery",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        onTap: () => Get.back(),
                        child: Container(
                          margin: EdgeInsets.only(bottom: 25),
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Color(0x90636e72),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Icon(
                            Icons.close,
                            size: 40,
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                      )
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          kIsWeb
                              ? _imageViewController
                                  .launchUrl(_imageViewController.imageUrl)
                              : _imageViewController
                                  .saveImage(_imageViewController.imageUrl);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          height: 50,
                          width: 250,
                          decoration: BoxDecoration(
                            color: Color(0x90636e72),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Set Wallpaper',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                height: 14,
                                child: Text(
                                  kIsWeb
                                      ? "Image will open in new tab to download"
                                      : "Image will be saved in gallery",
                                  style: TextStyle(
                                    color: Colors.white70,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Text(
                          'Cancel',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
