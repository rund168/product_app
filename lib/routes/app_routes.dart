import 'package:get/get.dart';
import 'package:product_app/modules/auth/view/login_screen.dart';
import 'package:product_app/modules/home/view/home_screen.dart';
import 'package:product_app/modules/product/view/product_view.dart';
import 'package:product_app/modules/product/view/product_detail_view.dart';

class RouteName {
  static const String homeScreen = "/";
  static const String productScreen = "/product";
  static const String loginScreen = "/login";
  static const String productDetailScreen = "/product/details";
}

class AppRoute {
  static appRoutes() => [
        GetPage(
            name: RouteName.homeScreen,
            page: () => HomeScreen(),
            transition: Transition.rightToLeft),
        GetPage(
            name: RouteName.productScreen,
            page: () =>  ProductScreen(),
            transition: Transition.rightToLeft),
        GetPage(
            name: RouteName.loginScreen,
            page: () =>  LoginScreen(),
            transition: Transition.rightToLeft),
        GetPage(
            name: RouteName.productDetailScreen,
            page: () => const ProductDetailView(),
            transition: Transition.rightToLeftWithFade)
      ];
}
