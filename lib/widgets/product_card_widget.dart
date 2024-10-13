import 'package:flutter/material.dart';
import 'package:product_app/models/product/products.dart';


class ProductCardWidget extends StatelessWidget {
  Products product;
  Color? backgorundColor;
  VoidCallback? onTabImage;
  ProductCardWidget({super.key,required this.product, this.onTabImage, this.backgorundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      height: 200,
      decoration: BoxDecoration(
          color: backgorundColor?? Color(0xFFFAFAFA),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: InkWell(
              onTap: onTabImage,
              child: Image.network(
                product.thumbnail ?? "",
                fit: BoxFit.cover,
                height: 100,
              ),
            ),
          ),
          Text(
            product.title ?? "",
            style: TextStyle(fontSize: 11),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$ ${product.price}",
                  style: TextStyle(color: Color(0xFFFF5000)
                  ),
                ),
                Text(
                  "Sold: ${product.reviews!.length}",
                  style: TextStyle(color: Colors.blueGrey
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
