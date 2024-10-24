class ApiUrl{
  static const String baseUrl = "https://dummyjson.com";
  static const String getAllCategoryUrl = "$baseUrl/products/categories";

  static const String getAllProductUrl = "$baseUrl/products";

  static const String getAllProductByCategoryUrl = "$baseUrl/products/category";
  static const String loginPath = "$baseUrl/auth/login";

  static const String baseUrlPostApp = "http://194.233.91.140:20099";
  static const String postAppLoginPath = "$baseUrlPostApp/api/oauth/token";
  static const String postAppLoginRegisterPath = "$baseUrlPostApp/api/oauth/register";
}