// ignore_for_file: must_be_immutable

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news/new_response/article.dart';
import 'package:news/new_response/new_response.dart';
import 'package:news/pages/webpage.dart';

class FirstXX extends StatefulWidget {
  const FirstXX({super.key, required this.categories});
final String categories;
  @override
  State<FirstXX> createState() => _FirstXXState();
}

class _FirstXXState extends State<FirstXX> {
  List<Article> articles = [];
  @override
  void initState() {
    super.initState();
    getData(widget.categories);
  }

  Future<void> getData(String categories) async {
    final response = await Dio().get(
      'https://newsapi.org/v2/top-headlines',
      queryParameters: {
        "country": "us",
        "category": categories,
        "apiKey": '557fcf3d9de44314a0d7e582dab2948f',
      },
    );
    final news = NewResponse.fromJson(response.data);
    setState(() {
      articles = news.articles ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
          itemCount: articles.length,
          itemBuilder: (context, index) {
            Article article = articles[index];
            return Card(
              color:Color(0xffffc91f),
              elevation: 5,
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  article.urlToImage == null
                      ? SizedBox()
                      : SizedBox(
                          height: 300,
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return WebPage(url: article.url.toString());
                                }));
                              },
                              child: Image.network(
                                article.urlToImage.toString(),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                  Text(
                    article.author.toString(),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    article.description.toString(),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            );
          },
        );
  }
}