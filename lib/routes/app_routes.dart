import 'package:get/get.dart';
import 'package:product_app/modules/auth/view/login_screen.dart';
import 'package:product_app/modules/home/view/home_screen.dart';
import 'package:product_app/modules/product/view/product_view.dart';
import 'package:product_app/modules/product/view/product_detail_view.dart';
import 'package:product_app/repository/post/modules/login/view/login_view.dart';
import 'package:product_app/repository/post/modules/root/view/root_view.dart';
import 'package:product_app/repository/post/modules/splash/view/splash_view.dart';

class RouteName {
  static const String homeScreen = "/";
  static const String productScreen = "/product";
  static const String loginScreen = "/login";
  static const String productDetailScreen = "/product/details";
  static const String postRoot = "/post/root";
  static const String postLogin = "/post/login";
  static const String postSplash = "/post/splash";
}

class AppRoute {
  static appRoutes() => [
        GetPage(
            name: RouteName.homeScreen,
            page: () => HomeScreen(),
            transition: Transition.rightToLeft),
        GetPage(
            name: RouteName.productScreen,
            page: () => ProductScreen(),
            transition: Transition.rightToLeft),
        GetPage(
            name: RouteName.loginScreen,
            page: () => LoginScreen(),
            transition: Transition.rightToLeft),
        GetPage(
            name: RouteName.productDetailScreen,
            page: () => const ProductDetailView(),
            transition: Transition.rightToLeftWithFade),
        GetPage(
          name: RouteName.postRoot,
          page: () => const RootView(),
        ),        GetPage(
          name: RouteName.postSplash,
          page: () =>  SplashView(),
        ),GetPage(
          name: RouteName.postLogin,
          page: () =>  LoginView(),
        ),
      ];
}
