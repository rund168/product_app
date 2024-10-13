import 'package:get/get.dart';
import 'package:product_app/core/constants/constants.dart';

class AppLanguage extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    //English
        "en_US":{
          Constant.appName: "Taobao Khmer",
          Constant.featureProducts: "Feature Product",
          Constant.seeAll: "See all>",
        },
    //Khmer
        "km_KH":{
          Constant.appName: "ថៅប៉ៅខ្មែរ",
          Constant.featureProducts: "ផលិតផលពិសេសៗ",
          Constant.seeAll: "ផលិតផលទាំងអស់>",
        }
      };
}
