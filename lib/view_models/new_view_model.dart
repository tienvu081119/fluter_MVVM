import 'package:app_ui_03/data/news_repository.dart';
import 'package:app_ui_03/models/news.dart';
import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class NewsViewModel extends ChangeNotifier {
  NewsRepository _newsRepository = NewsRepository();
  List<News> _allNews = [];
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  int _page = 1;

  List<News> get allNews => _allNews;

  NewsViewModel() {
    this.loadNews();
  }

  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  void onRefresh() async {
    _allNews = [];
    notifyListeners();
    _page = 1;
    List<News> news = await _newsRepository.fetchNews(page: _page);
    _allNews.addAll(news);
    notifyListeners();
    refreshController.refreshCompleted();
  }

  void onLoading() async {
    _page += 1;
    List<News> news = await _newsRepository.fetchNews(page: _page);
    _allNews.addAll(news);
    notifyListeners();
    refreshController.loadComplete();
  }


  loadNews() async {
    _isLoading = true;
    notifyListeners();
    List<News> news = await _newsRepository.fetchNews();    
    _allNews.addAll(news);
    _isLoading = false;
    notifyListeners();
  }
}

