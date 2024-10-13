import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:product_app/core/constants/constants.dart';
import 'package:product_app/modules/home/controller/home_controller.dart';

import '../../../routes/app_routes.dart';

class HomeAppBarWidget extends StatelessWidget {
  HomeController homeController = Get.put(HomeController());
  VoidCallback? onPressLogin;
  HomeAppBarWidget({super.key, required this.onPressLogin});

  @override
  Widget build(BuildContext context) {
    final storage = GetStorage();
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Row with logo and text
          Row(
            children: [
              InkWell(
                onTap: () {},
                child: Image.network(
                  'https://upload.wikimedia.org/wikipedia/en/thumb/0/04/Taobao_logo_%282021%29.svg/1200px-Taobao_logo_%282021%29.svg.png',
                  height: 32, // Set height to match icon size
                ),
              ),
              const SizedBox(width: 10), // Add spacing between image and text
              Text(
                Constant.appName.tr,
                style: TextStyle(
                  fontWeight: FontWeight.bold, // Makes the text bold
                  fontSize: 20.0, // Increases the text size
                  color: Color(0xFFFF5000), // Sets the custom color
                ),
              ),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: onPressLogin,
                child: Obx(
                  () {
                    return Container(
                      child: homeController.userLogin.value.username != null
                          ? Text(
                              "${homeController.userLogin.value.username}"
                                  .toUpperCase(),
                              style: const TextStyle(color: Color(0xFFFF5000)),
                            )
                          : Text("Login".tr),
                    );
                  },
                ),
              ),
              SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {
                  if (storage.read("KEY_LANGUAGE") == "KH") {
                    var locale = const Locale('en', 'US');
                    Get.updateLocale(locale);
                    storage.write("KEY_LANGUAGE", "US");
                  } else {
                    var locale = const Locale('km', 'KH');
                    Get.updateLocale(locale);
                    storage.write("KEY_LANGUAGE", "KH");
                  }
                },
                child: Image.asset(
                  storage.read("KEY_LANGUAGE") == "KH"
                      ? Constant.khmerImagePath
                      : Constant.englishImagePath,
                  height: 32,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
