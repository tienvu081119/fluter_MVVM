import 'dart:convert';
import 'package:app_ui_03/models/news.dart';
import 'package:http/http.dart' as http;


class NewsRepository {
  Future<List<News>> fetchNews({int page=1}) async {
    List<News> news = [];
    var url = Uri.parse("https://api.hnpwa.com/v0/news/$page.json");
    var response = await http.get(url);
    dynamic jsons = jsonDecode(response.body);
    for (var json in jsons) {
      news.add(News.fromJson(json));
    }
    return news;
  }
}