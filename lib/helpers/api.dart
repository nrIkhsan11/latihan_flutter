

import 'package:dio/dio.dart';

final dio = Dio();
api(String url, {String? methode, String? data}) async {

  final response = await dio.request(
    url,
    data: data,
    options: Options(method: methode),
  );

  return response;
}