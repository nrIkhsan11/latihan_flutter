import 'package:flutter/material.dart';
import 'package:latihan_flutter/helpers/api.dart';
import 'package:latihan_flutter/model/models.dart';
import 'package:latihan_flutter/utils/cons.dart';

class NewsProvider with ChangeNotifier{
  bool isDataEmpty = true;
  bool isLoading = true;
  bool isLoadingSearch = true;
  NewsModels? newsModels;
  NewsModels? resSearch;

  setLoading(data){
    isLoading = data;
    notifyListeners();
  }

  getTopNews() async{
    final res = await api(baseUrl + topHeadlines + apiKey);

    if(res.statusCode == 200){
      newsModels = NewsModels.fromJson(res.data);
    }else{
      newsModels = NewsModels();
    }
    isLoading = false;
    notifyListeners();
  }

  searchNews(String q) async{
    isDataEmpty = false;
    isLoadingSearch = true;
    notifyListeners();
    final res = await api(baseUrl + 'everything?q=$q' + apiKey);

    if(res.statusCode == 200){
      resSearch = NewsModels.fromJson(res.data);
    }else{
      resSearch = NewsModels();
    }
    isLoadingSearch = false;
    notifyListeners();
  }
}