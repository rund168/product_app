import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_app/modules/product/view_model/product_view_model.dart';
import 'package:product_app/widgets/product_card_widget.dart';

class ProductScreen extends StatefulWidget {

  ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final ProductViewModel productViewModel = Get.put(ProductViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFFF5000),
        title: Text("Product Screen",style: TextStyle(
            color: Colors.white
        ),),
        actions: [
          Icon(Icons.search_rounded),
        ],
      ),
      body: Obx(() {
        return NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            if (!productViewModel.loading.value &&
                scrollInfo.metrics.pixels ==
                    scrollInfo.metrics.maxScrollExtent) {
              setState(() {
                productViewModel.fetchMoreAllProducts();
              });

            }
            return true;
          },
          child: RefreshIndicator(
            onRefresh: () async {
              productViewModel.fetchAllProduct();
            },
            child: SingleChildScrollView(
              child: productViewModel.loading.value
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: productViewModel.productList.length,
                      itemBuilder: (context, index) {
                        return ProductCardWidget(
                          product: productViewModel.productList[index],
                          backgorundColor: Colors.black12,
                        );
                      }),
            ),
          ),
        );
      }),
    );
  }
}
