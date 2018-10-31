import 'package:flutter/material.dart';
import 'package:flutter_apps/view_model/my_view_model.dart';
import 'package:scoped_model/scoped_model.dart';


class NoInternetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MyViewModel>(builder: (BuildContext context, Widget child, MyViewModel model) {
      return Container(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("No Internet Connection"),
          ],
        ),
      );
    },

    );
  }
}
