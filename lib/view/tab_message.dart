import 'package:app_ui_03/view_models/new_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TabMessages extends StatefulWidget {
    @override 
  _TabMessages createState() => _TabMessages();
}

class _TabMessages extends State<TabMessages>{
  NewsViewModel model = new NewsViewModel();
   
  @override
  void initState(){
    super.initState();
  }


  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider<NewsViewModel>(
      create: (_) => NewsViewModel(),
      child: Consumer<NewsViewModel>(builder: (_, model, Widget child) {
         if (model.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (!model.isLoading && model.allNews.length == 0) {
            return Center(
              child: Text('NoData'),
            );
          }
            return SmartRefresher(
              enablePullDown: true,
              enablePullUp: true,
              controller: model.refreshController,
              onRefresh: model.onRefresh,
              onLoading: model.onLoading,
              child: ListView.builder(
                  itemCount: model.allNews.length,
                  itemBuilder: (_, index) {
                    return ListTile(
                      title: Text('${model.allNews[index].title}'),
                      subtitle: Text('${model.allNews[index].timeAgo}'),
                    );
                  }));
      }
    ));
  }

}