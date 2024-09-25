import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:nytimes/article_detail_controller.dart';

class ArticleDetail extends GetView<ArticleDetailController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail"),
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            controller.doc?.headline?.main ?? "",
            style: const TextStyle(
                fontWeight: FontWeight.w600, color: Colors.black),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Source : ${controller.doc?.source ?? ""}",
            style: const TextStyle(
                fontWeight: FontWeight.normal, color: Colors.black),
          ),
        ],
      ).paddingAll(10)),
    );
  }
}
