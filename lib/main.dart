import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:product_app/core/language/app_language.dart';
import 'package:product_app/routes/app_routes.dart';

Future<void> main() async {
  await GetStorage.init();
  var storage = GetStorage();
  if (storage.read("KEY_LANGUAGE") == null) {
    storage.write("KEY_LANGUAGE", "KH");
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final storage = GetStorage();
    return GetMaterialApp(
      translations: AppLanguage(),
      locale: storage.read("KEY_LANGUAGE") == "KH"
          ? Locale('km', 'KH')
          : Locale('en', 'US'),
      fallbackLocale: storage.read("KEY_LANGUAGE") == "KH"
          ? Locale('en', 'US')
          : Locale('km', 'KH'),
      title: 'Post App', // Updated app title
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // Set initialRoute to postSplash
      initialRoute: RouteName.postSplash, // Change this to postLogin if needed
      getPages: AppRoute.appRoutes(),
    );
  }
}
