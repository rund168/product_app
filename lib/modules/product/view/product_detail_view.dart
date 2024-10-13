import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_app/modules/product/view_model/product_detail_view_model.dart';
import 'package:product_app/widgets/product_card_widget.dart';

class ProductDetailView extends StatefulWidget {
  const ProductDetailView({super.key});

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  ProductDetailViewModel productViewModel = Get.put(ProductDetailViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFF5000),
        title: Obx((){
          return Text("${productViewModel.product.value.title?? ""}",style: TextStyle(
            color: Colors.white
          ),);
        }),
      ),
      backgroundColor: Color(0xFFFFFFFF),
      body: Obx((){
        if (productViewModel.loading.value){
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        var product = productViewModel.product.value;
        return Column(
          children: [
            ProductCardWidget(product: product,backgorundColor: Color(
                0xFFFAFAFA)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(product.description??""),
            )
          ],
        );
      }),
    );
  }
}
