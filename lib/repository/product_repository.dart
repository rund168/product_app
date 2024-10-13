import 'package:product_app/data/remote/api_url.dart';
import 'package:product_app/data/remote/network_api_service.dart';
import 'package:product_app/models/product/product_response.dart';
import 'package:product_app/models/product/products.dart';

class ProductRepository{
  final NetworkApiService apiService = NetworkApiService();

  Future<ProductResponse> getAllProducts(int limit, int page) async{
    var response =
    await apiService.getApi("${ApiUrl.getAllProductUrl}?limit=$limit&skip=$page");
    ProductResponse productResponse = ProductResponse.fromJson(response);
    return productResponse;
  }

  Future<ProductResponse> getAllProductByCategorySlug(int limit, int page, String slug) async{
    var response =
    await apiService.getApi("${ApiUrl.getAllProductByCategoryUrl}/$slug?limit=$limit&skip=$page");
    ProductResponse productResponse = ProductResponse.fromJson(response);
    return productResponse;
  }
  Future<Products> getProductById(int id) async{
    var response = await apiService.getApi("${ApiUrl.getAllProductUrl}/$id");
    return Products.fromJson(response);
  }
}
