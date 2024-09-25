import 'dart:convert';

import 'package:get/get.dart';
import 'package:nytimes/app_constants.dart';
import 'package:nytimes/article_result.dart';
import 'package:http/http.dart' as http;

class ArticleListController extends GetxController {
  RxList<Docs> articles = RxList<Docs>();
  var loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchArticle();
  }

  fetchArticle() async {
    Uri url = Uri.parse(
        "https://api.nytimes.com/svc/search/v2/articlesearch.json?api-key=${AppConstants.apikey}");
    loading.value = true;
    var response = await http.get(url);
    if(response.statusCode != 200){
      articles.value = [];
    } else{
      ArticleResult result = ArticleResult.fromJson(jsonDecode(response.body));
      articles.value = result.response?.docs ?? [];
    }
    loading.value = false;
    update();
  }

  reloadData(){
    articles.clear();
    fetchArticle();
  }
}
