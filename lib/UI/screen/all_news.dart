import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:news_app/UI/wiget/article_wiget.dart';
import 'package:news_app/data/article_model.dart';

class AllNews extends StatefulWidget {
  AllNews({super.key});

  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  List<ArticleModel> articleList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('All News'),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return ArticleWiget(
              article: articleList[index],
            );
          },
          itemCount: articleList.length,
        ));
  }

  getData() async {
    Response response = await get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=eg&apiKey=563c7cade23e4676b3b1f2b12fe8309b'));
    Map data = jsonDecode(response.body);
    List listOfMap = data['articles'];
    for (var element in listOfMap) {
      ArticleModel model = ArticleModel(
          title: element['title'],
          description: element['description'],
          author: element['author'],
          url: element['url']);
      //print(element['url']);
      setState(() {
        articleList.add(model);
      });
    }
  }
}
