import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_app/data/status.dart';
import 'package:product_app/post/category/view_model/post_category_view_model.dart';
import 'package:product_app/routes/app_routes.dart';

class PostCategoryView extends StatelessWidget {
  var viewModel = Get.put(PostCategoryViewModel());

  PostCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Color(0xFF4A90E2), // Updated color for AppBar
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Manage Categories",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        actions: [
          IconButton(
            onPressed: () {
              viewModel.onCreate();
            },
            icon: Icon(Icons.add, color: Colors.white), // White color for icon
          )
        ],
      ),
      body: Obx(() {
          switch (viewModel.loadingRequestAllCategoryStatus.value) {
            case Status.loading:
              return Center(
                child: CircularProgressIndicator(
                  color: Color(0xFF4A90E2), // Updated color for loading indicator
                ),
              );
            case Status.error:
              return Center(
                child: Text(
                  "Error loading data...",
                  style: TextStyle(color: Color(0xFFB00020)), // Red for error text
                ),
              );
            case Status.completed:
              return ListView.builder(
                itemCount: viewModel.categoryList.length,
                itemBuilder: (context, index) {
                  var data = viewModel.categoryList[index];
                  return Container(
                    margin: EdgeInsets.only(top: 10, left: 16, right: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          offset: Offset(2, 4),
                        ),
                      ],
                    ),
                    child: ListTile(
                      title: Text(
                        "${data.name}",
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: GestureDetector(
                        onTap: (){
                          Get.toNamed(RouteName.postManageCategoryCreatePath, parameters: {
                            "id": "${data.id}"
                          });
                        },

                        child: Icon(
                          Icons.edit,
                          color: Color(0xFF4A90E2), // Updated color for edit icon
                        ),
                      ),
                      onTap: () {
                        // Define what happens when a category is tapped
                        // For example, navigate to edit category screen
                      },
                    ),
                  );
                },
              );
            default:
              return SizedBox(); // Default case
          }
        },
      ),
    );
  }
}
