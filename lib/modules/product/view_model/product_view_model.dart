import 'package:get/get.dart';
import 'package:product_app/models/product/products.dart';
import 'package:product_app/repository/product_repository.dart';

class ProductViewModel extends GetxController {
  List<Products> productList = <Products>[].obs;
  var loading = true.obs;
  var loadingmore = false.obs;
  var currentPage = 1.obs;
  final limit = 10;
  final ProductRepository productRepository = ProductRepository();

  @override
  void onInit() {
    fetchAllProduct();
    super.onInit();
  }

  fetchAllProduct() async {
    productList = [];
    try {
      loading(true);
      currentPage.value = 1;
      var response =
          await productRepository.getAllProducts(limit, currentPage.value);
      productList.addAll(response.products!);
    } catch (e) {
      Get.snackbar("ERROR", e.toString());
    } finally {
      loading(false);
    }
  }

  fetchMoreAllProducts() async {
    try {
      loadingmore(true);
      currentPage.value +=1;
      var response = await productRepository.getAllProducts(limit, currentPage.value);
      productList.addAll(response.products!);
    } catch (e) {
      Get.snackbar("ERROR", e.toString());
    } finally {
      loadingmore(false);
    }
  }
}
