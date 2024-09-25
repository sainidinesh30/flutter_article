import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nytimes/app_pages.dart';

void main() {
  runApp(ArticleApp());
}

class ArticleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: Get.key,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(centerTitle: true),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: AppPages.list,
      getPages: AppPages.pages,
    );
  }
}
