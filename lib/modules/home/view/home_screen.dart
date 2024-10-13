import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_app/core/constants/constants.dart';
import 'package:product_app/modules/home/controller/home_controller.dart';
import 'package:product_app/modules/home/widget/home_app_bar_widget.dart';
import 'package:product_app/modules/home/widget/home_category_widget.dart';
import 'package:product_app/modules/home/widget/home_product_list_widget.dart';
import 'package:product_app/modules/home/widget/home_product_widget.dart';
import 'package:product_app/routes/app_routes.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Obx(() {
          return SafeArea(
            top: true,
            child: SingleChildScrollView(
              child: RefreshIndicator(
                onRefresh: () async {
                  homeController.fetchAllCategory();
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HomeAppBarWidget(onPressLogin: (){
                      if(homeController.userLogin.value.username != null){

                      }else {
                        Get.toNamed(RouteName.loginScreen)!.then((onValue) {
                          if (onValue == true) {
                            homeController.getUser();
                          }
                        });
                      }
                    },),
                    SizedBox(
                      height: 32,
                    ),
                    HomeCategoryWidget(),
                    SizedBox(
                      height: 32,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, bottom: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(Constant.featureProducts.tr),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                child: Icon(
                                  Icons.featured_play_list_rounded,
                                  color: homeController.isGrid.value
                                      ? Colors.grey
                                      : Color(0xFFFF5000),
                                ),
                                onTap: () {
                                  homeController.onSelectChangeGrid(false);
                                },
                              ),
                              InkWell(
                                child: Icon(
                                  Icons.grid_view_rounded,
                                  color: homeController.isGrid.value
                                      ? Color(0xFFFF5000)
                                      : Colors.grey,
                                ),
                                onTap: () {
                                  homeController.onSelectChangeGrid(true);
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: (){
                                  Get.toNamed(RouteName.productScreen);
                                },
                                child: Text(Constant.seeAll.tr,
                                  style: TextStyle(color: Color(0xFFFF5000)),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    homeController.isGrid.value
                        ? HomeProductWidget()
                        : HomeProductListWidget()
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
