import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../component/news.dart';
import '../providers/Newsprovider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  TextEditingController searchController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsProvider>(
        builder: (BuildContext context, news, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Cari berita',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: searchController,
                          decoration: const InputDecoration(
                            hintText: 'Cari berita disini...',
                            hintStyle: TextStyle(fontWeight: FontWeight.normal)
                          ),
                          onSaved: (String? value) {

                          },
                          validator: (String? value) {
                            return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
                          },
                        ),
                      ),
                      IconButton(onPressed: () {
                        news.searchNews(searchController.text);
                      }, icon: Icon(Icons.search))
                    ],
                  ),
                  SizedBox(height: 10),

                  news.isDataEmpty
                  ? const SizedBox()
                  : news.isLoadingSearch
                      ? const Center(
                    child: CircularProgressIndicator(),
                  )
                      : Column(
                    children: [
                      ...news.resSearch!.articles!.map((e) => News(
                        title: e.title ?? '',
                        image: e.urlToImage ?? '',
                        description: e.description,
                        date: e.publishedAt,
                      ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
