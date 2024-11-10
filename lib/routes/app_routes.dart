import 'package:get/get.dart';
import 'package:product_app/post/account/view/account_view.dart';
import 'package:product_app/post/auth/login/view/login_view.dart'; // New Login View
import 'package:product_app/post/auth/register/view/register_view.dart';
import 'package:product_app/post/category/views/post_category_form_view.dart';
import 'package:product_app/post/category/views/post_category_view.dart';
import 'package:product_app/post/home/view/home_view.dart';
import 'package:product_app/post/post/views/post_view.dart';
import 'package:product_app/post/root/view/root_view.dart';
import 'package:product_app/post/splash/view/splash_view.dart';

class RouteName {
  static const String homeScreen = "/"; // Home route
  static const String productScreen = "/product";
  static const String loginScreen = "/login"; // Old Login Screen route
  static const String productDetailScreen = "/product/details";
  static const String postRoot = "/post/root";
  static const String postLogin = "/post/login"; // New Login View route
  static const String postSplash = "/post/splash";
  static const String postManageCategory = "/post/manage/categories";
  static const String postManageCategoryCreatePath = "/post/manage/categories/create";
  static const String postManagePost = "/post/manage/post";
  static const String postAppLoginRegisterPath = "/api/oauth/register";
  static const String home = "/home"; // New HomeView route
  static const String myPosts = "/my-posts";
  static const String account = "/account";
}

class AppRoute {
  static appRoutes() => [
    GetPage(
      name: RouteName.postRoot,
      page: () => const RootView(),
    ),
    GetPage(
      name: RouteName.postLogin,
      page: () => LoginView(), // New Login View
      transition: Transition.fade,
    ),
    GetPage(
      name: RouteName.postSplash,
      page: () => SplashView(),
      transition: Transition.fade,
    ),
    GetPage(
      name: RouteName.postManageCategory,
      page: () => PostCategoryView(),
    ),
    GetPage(
      name: RouteName.postManageCategoryCreatePath,
      page: () => PostCategoryFormView(),
    ),
    GetPage(
      name: RouteName.postManagePost,
      page: () => PostView(),
      transition: Transition.fade,

    ),
    GetPage(
      name: RouteName.postAppLoginRegisterPath,
      page: () => RegisterView(),
    ),
    GetPage(
      name: RouteName.home,
      page: () => HomeView(), // New HomeView page
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: RouteName.account,
      page: () => const AccountView(),
      transition: Transition.fadeIn,
    ),
  ];
}
