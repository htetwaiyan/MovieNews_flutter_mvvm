import 'package:flutter/material.dart';
import 'package:flutter_apps/model/news_result.dart';

class NewsListView extends StatelessWidget {

  List<Items> items;


  NewsListView(this.items);

  @override
  Widget build(BuildContext context) {


    return items!=null?ListView(
//      padding: EdgeInsets.symmetric(horizontal: width-targetwidth),
      children: items.map((i){
        List<String> pubs=i.pubDate.split(" ");
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0)
          ),
          height: 300.0,
          child: Stack(
            children: <Widget>[
              Card(

                margin: EdgeInsets.only(top: 20.0,left: 10.0,right: 10.0,bottom: 10.0),
                elevation: 10.0,
                child: Stack(
                  children: <Widget>[
                    Container(


                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                          image: DecorationImage(image: NetworkImage(i.thumbnail==null?i.enclosure.link:i.thumbnail),fit:BoxFit.cover),
                          borderRadius: BorderRadius.circular(10.0)

                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                          color: Colors.black45,
                        ),
                        padding: EdgeInsets.all(10.0),
                        width: double.infinity,

                        child: Text(i.title,style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
//                  fontFamily: "Zawgyi",
                        ),),
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(5.0),
                  width: 90.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(pubs[0],style: TextStyle(
                    color: Colors.white
                  ),),
                ),
              )

            ],
          ),
        );
      }).toList(),
    ):Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("No Data Found")
      ],
    );
  }
}
