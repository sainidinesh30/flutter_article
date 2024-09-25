import 'package:get/get.dart';
import 'package:nytimes/article_result.dart';

class ArticleDetailController extends GetxController {

  Docs? doc;

  @override
  void onInit() {
    super.onInit();
    getDoc();
  }

  getDoc(){
    if(Get.arguments != null){
      doc = Get.arguments["doc"];
      print(doc?.headline?.main ?? "");
    }
  }
}