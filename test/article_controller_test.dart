

import 'package:flutter_test/flutter_test.dart';
import 'package:nytimes/article_list_controller.dart';

void main(){

  testWidgets('test', (WidgetTester tester) async {
    var controller = ArticleListController();
    await controller.fetchArticle();
    print(controller.articles);
  });

}