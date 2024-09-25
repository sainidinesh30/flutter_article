import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nytimes/app_pages.dart';
import 'package:nytimes/article_list_controller.dart';
import 'package:nytimes/article_result.dart';

class ArticleListPage extends GetView<ArticleListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Article List"),
      ),
      body: SafeArea(
        child: Obx(() => controller.loading.value
            ? const Center(child: CircularProgressIndicator())
            : controller.articles.isEmpty
                ? const Center(
                  child: Text(
                      "No Articles",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 18),
                    ),
                )
                : RefreshIndicator(
                  onRefresh: () async{
                    controller.reloadData();
                  },
                  child: ListView.builder(
                      itemCount: controller.articles.length,
                      itemBuilder: (context, index) {
                        return _articleWidget(controller.articles[index]);
                      },
                    ).paddingSymmetric(horizontal: 20, vertical: 10),
                )),
      ),
    );
  }

  Widget _articleWidget(Docs doc) {
    return GestureDetector(
      onTap: () => Get.toNamed(AppPages.detail, arguments: {"doc": doc}),
      child: Card(
        surfaceTintColor: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              doc.headline?.main ?? "",
              style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 15),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Source : ${doc.source ?? ""}",
              style: const TextStyle(
                  fontWeight: FontWeight.normal, color: Colors.black),
            ),
          ],
        ).paddingAll(10),
      ),
    );
  }
}
