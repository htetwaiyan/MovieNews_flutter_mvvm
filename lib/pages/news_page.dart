import 'package:flutter/material.dart';
import 'package:flutter_apps/pages/loading_page.dart';
import 'package:flutter_apps/pages/news_list_view.dart';
import 'package:flutter_apps/pages/no_internet_page.dart';
import 'package:flutter_apps/utils/news_type.dart';
import 'package:flutter_apps/view_model/my_view_model.dart';
import 'package:scoped_model/scoped_model.dart';


class NewsPage extends StatefulWidget {

  final NewsType nt;


  NewsPage(this.nt);


  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MyViewModel>(builder: (BuildContext context, Widget child, MyViewModel model) {
      if(model.isLoading){
        return LoadingPage();

      }

      if(model.noInternet){
        return NoInternetPage();
      }

      if(widget.nt==NewsType.topten){

       return NewsListView(model.topten);
      }


      if(widget.nt==NewsType.upcoming){
        return NewsListView(model.upcoming);

      }

      if(widget.nt==NewsType.superhero){

return NewsListView(model.superhero);

      }

    },
    );
  }
}
