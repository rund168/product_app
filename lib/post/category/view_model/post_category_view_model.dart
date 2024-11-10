import 'package:get/get.dart';
import 'package:product_app/data/status.dart';
import 'package:product_app/models/post/Base_post_request.dart';

import 'package:product_app/repository/post/post_repository.dart';
import 'package:product_app/routes/app_routes.dart';
import '../../../models/post/post_category.dart';

class PostCategoryViewModel extends GetxController {
  final _repository = PostRepository();
  var categoryList = <PostCategory>[].obs;
  var loadingRequestAllCategoryStatus = Status.loading.obs;
  void setLoadingRequestAllCategoryStatus(Status value) =>
      loadingRequestAllCategoryStatus.value = value;
  var baseRequest = BasePostRequest().obs;

  @override
  void onInit() {
    loadingCategoryData();
    super.onInit();
  }

  loadingCategoryData() async {
    setLoadingRequestAllCategoryStatus(Status.loading);
    await _fetchAllCategories();
    setLoadingRequestAllCategoryStatus(Status.completed);
  }

  _fetchAllCategories() async {
    try {
      var response = await _repository.getAllPostCategories(baseRequest.value);
      response.data.forEach((data) {
        categoryList.add(PostCategory.fromJson(data));
      });
    }catch(e){
      setLoadingRequestAllCategoryStatus(Status.error);
      Get.snackbar("ERROR", e.toString());
    }
  }

  void onCreate() {
    Get.toNamed(RouteName.postManageCategoryCreatePath)?.then((onValue){
      if(onValue == true){
        categoryList.value = [];
        _fetchAllCategories();
      }
    });

  }
}
