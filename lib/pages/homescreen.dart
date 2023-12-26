import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news/new_response/article.dart';
import 'package:news/new_response/new_response.dart';
import 'package:news/pages/firstscreen.dart';
import 'package:news/pages/news_settings.dart';
import 'package:news/pages/webpage.dart';
import 'package:news/shared/sharedd.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Article> articles = [];
  int selectedindex = 0;

  final List<String> title = ['Health', 'Science', 'Sports', 'Technology'];

  @override
  void initState() {
    super.initState();
    getData(title[0]);
    if (PreferenceUtils.getString(PrefKeys.country).isEmpty) {
      PreferenceUtils.setString(PrefKeys.country, 'us');
    }
  }

  List<Widget> screens = [
    const FirstXX(categories: 'business'),
    const FirstXX(categories: 'sports'),
    const FirstXX(categories: 'health'),
    const FirstXX(categories: 'technology'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title[selectedindex]),
        actions: [
          IconButton(
            onPressed: () => navToSettingsScreen(),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          Article article = articles[index];
          return Card(
            color: const Color(0xffffc91f),
            elevation: 5,
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                article.urlToImage == null
                    ? const CircularProgressIndicator()
                    : SizedBox(
                        height: 300,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return WebPage(url: article.url.toString());
                                }),
                              );
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
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  article.description.toString(),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedindex,
        onTap: (value) {
          setState(() {
            selectedindex = value;
            getData(title[selectedindex]);
          });
          selectedindex = value;
        },
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.blue,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports),
            label: 'sports',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.health_and_safety),
            label: 'health',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.tv), label: 'technology'),
        ],
      ),
    );
  }

  final Dio dio = Dio();

  Future<void> getData(String categories) async {
    final response = await dio.get(
      'https://newsapi.org/v2/top-headlines',
      queryParameters: {
        "country": PreferenceUtils.getString(PrefKeys.country),
        "category": categories,
        "apiKey": '557fcf3d9de44314a0d7e582dab2948f',
      },
    );
    final news = NewResponse.fromJson(response.data);
    setState(() {
      articles = news.articles ?? [];
    });
  }

  void navToSettingsScreen() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const NewsSettings();
    })).then((value) => getData(title[selectedindex]));
  }
}
