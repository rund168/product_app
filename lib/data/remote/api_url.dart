class ApiUrl{
  static const String baseUrl = "https://dummyjson.com";
  static const String getAllCategoryUrl = "$baseUrl/products/categories";

  static const String getAllProductUrl = "$baseUrl/products";

  static const String getAllProductByCategoryUrl = "$baseUrl/products/category";
  static const String loginPath = "$baseUrl/auth/login";

  static const String baseUrlPostApp = "http://194.233.91.140:20099";
  static const String postAppLoginPath = "$baseUrlPostApp/api/oauth/token";
  static const String postAppRefreshTokenPath = "$baseUrlPostApp/api/oauth/refresh";
  static const String postAppLoginRegisterPath = "$baseUrlPostApp/api/oauth/register";
  static const String postAppCategories = "$baseUrlPostApp/api/app/category/list";
  static const String postCreateCategoryPath = "$baseUrlPostApp/api/app/category/create";
  static const String postCategoryByIdPath = "$baseUrlPostApp/api/app/category/";
  static const String getAllPostPath = "$baseUrlPostApp/api/app/post/list";
  static const String createPostPath = "$baseUrlPostApp/api/app/post/create";
  static const String updatePostPath = "$baseUrlPostApp/api/app/post/update";
  static const String getPostByIdPath = "$baseUrlPostApp/api/app/post/";





  static const String imageViewPath = "$baseUrlPostApp/api/public/view/image?filename=";
}