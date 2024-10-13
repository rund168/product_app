import 'package:product_app/data/remote/api_url.dart';
import 'package:product_app/data/remote/network_api_service.dart';

import '../models/category/category.dart';

class CategoryRepository{
  final NetworkApiService apiService = NetworkApiService();
  Future<List<Category>> getAllCategory() async {
    List<Category> res = [];
    var response = await apiService.getApi(ApiUrl.getAllCategoryUrl);
    response.forEach((data){
      Category category = Category.fromJson(data);
        res.add(category);
    });
    return res;
  }
}