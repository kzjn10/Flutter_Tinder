import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

class FavoriteScreen extends StatelessWidget {
  final LocalStorage storage;

  const FavoriteScreen({Key key, this.storage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: storage.ready,
      builder: (BuildContext context, snapshot) {
        if (snapshot.data == true) {
          Map<String, dynamic> data = storage.getItem('key');

          return Container(
              child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  color: Colors.black12.withOpacity(.25),
                ),
              ),
              Container(
                height: _size.height * .7,
                width: double.infinity,
              )
            ],
          ));
        } else {
          return Center(
            child: CircularProgressIndicator(strokeWidth: 2.0),
          );
        }
      },
    );
  }
}
