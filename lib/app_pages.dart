import 'package:get/get.dart';
import 'package:nytimes/article_detail_controller.dart';
import 'package:nytimes/article_detail_page.dart';
import 'package:nytimes/article_list_controller.dart';
import 'package:nytimes/article_list_page.dart';

class AppPages {
  static String list = "/list";
  static String detail = "/detail";

  static var pages = [
    GetPage(
      name: list,
      page: () => ArticleListPage(),
      binding: BindingsBuilder(
        () {
          Get.put(ArticleListController());
        },
      ),
    ),
    GetPage(
        name: detail,
        page: () => ArticleDetail(),
        binding: BindingsBuilder(
          () {
            Get.put(ArticleDetailController());
          },
        ))
  ];
}
