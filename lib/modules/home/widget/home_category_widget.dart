import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_app/modules/home/controller/home_controller.dart';

class HomeCategoryWidget extends StatefulWidget {
  const HomeCategoryWidget({super.key});

  @override
  State<HomeCategoryWidget> createState() => _HomeCategoryWidgetState();
}

class _HomeCategoryWidgetState extends State<HomeCategoryWidget> {
  final homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (homeController.loading.value) {
        return Center(
          child: CircularProgressIndicator(
            color: Colors.black12,
          ),
        );
      }
      return SizedBox(

        height: 50,
        child: ListView.separated(
          padding: EdgeInsets.only(left: 16,right: 16),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              var category = homeController.categories[index];
              return InkWell(
                onTap: () {
                  setState(() {
                    homeController.selectCategoryChange(index);
                    // print(index);
                  });
                },
                child: Container(
                  margin: EdgeInsets.all(5),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: homeController.selectedCategory == index
                          ? Color(0xFF2B2B2B)
                          : Color(0xFFFF5000),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Text(
                    category.name ?? "",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 20,
              );
            },
            itemCount: homeController.categories.length),
      );
    });
  }
}
