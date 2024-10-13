import 'package:get/get.dart';
import 'package:product_app/models/product/products.dart';
import 'package:product_app/repository/product_repository.dart';

class ProductDetailViewModel extends GetxController{
  final productRepository = ProductRepository();
  var product = Products().obs;
  var loading = true.obs;


  @override
  void onInit() {
    fetchProductById();
    super.onInit();

  }

  fetchProductById() async{
    try{
      loading(true);
      product.value = await productRepository.getProductById(Get.arguments ?? 0);
    }finally{
      loading(false);
    }
  }
}