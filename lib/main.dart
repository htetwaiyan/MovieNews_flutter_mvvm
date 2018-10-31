import 'package:flutter/material.dart';
import 'package:flutter_apps/network/my_api.dart';
import 'package:flutter_apps/pages/news_page.dart';
import 'package:flutter_apps/utils/news_type.dart';
import 'package:flutter_apps/view_model/my_view_model.dart';
import 'package:scoped_model/scoped_model.dart';

void main(){
  runApp(
    MaterialApp(
      home: MyHome(),
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        iconTheme: IconThemeData(
          color: Colors.white,
        )
      ),
    )
  );
}



class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> with SingleTickerProviderStateMixin{


  var controller;

  MyViewModel model;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller=TabController(length: 3, vsync: this);
    model=MyViewModel(MyApi());
    fetchNews();
  }

  void fetchNews()async{
    await model.fetchSuperHero();
    await model.fetchTopTen();
    await model.fetctUpcoming();
  }


  @override
  Widget build(BuildContext context) {
    return ScopedModel<MyViewModel>(model: model, child:
    Scaffold(

        appBar: AppBar(
          actions: <Widget>[
            ScopedModelDescendant<MyViewModel>(builder: (BuildContext context, Widget child, MyViewModel model) {
              return IconButton(
                icon: Icon(Icons.refresh,color: Colors.white,),
                onPressed: (){
                  fetchNews();
                },
              );
            },

            ),
            IconButton(icon:Icon(Icons.more_vert,color: Colors.white,),onPressed: (){
              showDialog(context: context,builder: (context){
                return SimpleDialog(
                  contentPadding: EdgeInsets.all(0.0),
                  children: <Widget>[
                    Container(
                      color: Theme.of(context).primaryColor,
                      child: Text("Developed By",style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0
                      ),),
                      width: double.infinity,
                      height: 50.0,
                      alignment: Alignment.center,
                    ),
                    Container(
                      alignment:Alignment.center,
                      child: Text("Htet Wai Yan",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0
                      ),),
                      margin: EdgeInsets.all(50.0),
                    )

                  ],
                );
              });
            },)
          ],
          title: Text("Movie News",style: TextStyle(
            color: Colors.white,
          ),),
          bottom: PreferredSize(child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: Colors.white
            ),
            padding: EdgeInsets.all(5.0),
            margin: EdgeInsets.only(right:5.0,left: 5.0,bottom: 5.0,top: 10.0),
            height: 63.0,
            child: TabBar(tabs: <Widget>[
              Tab(
                text: "SuperHero",
                icon: Icon(Icons.movie_filter),
              ),
              Tab(
                text: "Upcoming",
                icon: Icon(Icons.movie_creation),
              ),
              Tab(
                text: "Top Ten",
                icon: Icon(Icons.local_movies),
              ),

            ],
              controller:controller,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Theme.of(context).primaryColor,

              ),

              indicatorPadding: EdgeInsets.all(0.0),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,

            ),
          ),preferredSize: Size(double.infinity,60.0))
        ),
        body:TabBarView(children: [
          NewsPage(NewsType.superhero),

          NewsPage(NewsType.upcoming),
          NewsPage(NewsType.topten),


        ],
        controller: controller,)

    ),

    );
  }
}
