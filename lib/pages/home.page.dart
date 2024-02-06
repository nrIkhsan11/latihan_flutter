
import 'package:flutter/material.dart';
import 'package:latihan_flutter/component/news.dart';
import 'package:latihan_flutter/model/models.dart';
import 'package:latihan_flutter/pages/SearchPage.dart';
import 'package:latihan_flutter/providers/Newsprovider.dart';

import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  getNews(){
    Provider.of<NewsProvider>(context, listen: false).getTopNews();
  }

  @override
  void initState() {
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsProvider>(
        builder: (BuildContext context, news, Widget? child) {
      return RefreshIndicator(
        onRefresh: () async{
          news.setLoading(true);
          return await getNews();
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Berita terbaru'),
            actions: [
              IconButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchPage()));
              }, icon: const Icon(Icons.search),
              )
            ],
          ),
          body: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                news.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Column(
                        children: [
                          ...news.newsModels!.articles!.map((e) => News(
                                title: e.title ?? '',
                                image: e.urlToImage ?? '',
                                description: e.description,
                                date: e.publishedAt,
                              ))
                        ],
                      ),
              ],
            ),
          )),
        ),
      );
    });
  }
}
