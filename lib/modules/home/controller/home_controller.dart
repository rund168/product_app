import 'package:get/get.dart';
import 'package:product_app/models/auth/Login_response.dart';
import 'package:product_app/models/category/category.dart';
import 'package:product_app/models/product/products.dart';
import 'package:product_app/repository/auth_repository.dart';
import 'package:product_app/repository/category_repository.dart';
import 'package:product_app/repository/product_repository.dart';

class HomeController extends GetxController {
  var loading = true.obs;
  var loadingProduct = true.obs;
  var selectedCategory = 0.obs;
  final limit = 20;
  var currentPage = 1.obs;
  var isGrid = true.obs;
  List<Category> categories = <Category>[].obs;
  List<Products> products = <Products>[].obs;
  final CategoryRepository categoryRepository = CategoryRepository();
  final ProductRepository productRepository = ProductRepository();
  final AuthRepository authRepository = AuthRepository();
  var userLogin = LoginResponse().obs;

  @override
  void onInit() {
    fetchAllCategory();
    getUser();
    super.onInit();
  }

  Future fetchAllCategory() async {
    try {
      // categories = [];
      loading(true);
      var list = await categoryRepository.getAllCategory();
      var all = Category(slug: "all", name: "All");
      categories.add(all);
      categories.addAll(list);
      fetchAllProducts();
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      loading(false);
    }
  }

  Future selectCategoryChange(int index) async {
    selectedCategory.value = index;
    if (index == 0) {
      fetchAllProducts();
    } else {
      fetchAllProductsByCategorySlug(categories[index].slug ?? "");
    }
    fetchAllProductsByCategorySlug(categories[index].slug ?? "");
    print(categories[index].slug);

  }

  Future fetchAllProducts() async {
    try {
      products = [];
      loadingProduct(true);
      var responseProduct =
          await productRepository.getAllProducts(limit, currentPage.value);
      products.addAll(responseProduct.products!);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      loadingProduct(false);
    }
  }

  Future fetchAllProductsByCategorySlug(String slug) async {
    try {
      products = [];
      loadingProduct(true);
      var responseProduct = await productRepository.getAllProductByCategorySlug(
          limit, currentPage.value, slug);
      products.addAll(responseProduct.products!);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      loadingProduct(false);
    }
  }

  onSelectChangeGrid(bool select){
    if (select == true){
      isGrid.value = true;
    } else {
      isGrid.value = false;
    }
  }
  getUser() async {
    userLogin.value = await authRepository.getUserLocal();
  }
}
