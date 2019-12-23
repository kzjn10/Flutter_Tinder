import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TinderCardShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    ThemeData _theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
        boxShadow: [
          BoxShadow(
            color: _theme.primaryColor.withOpacity(.15),
            blurRadius: 20.0,
            spreadRadius: 10.0,
            offset: Offset(
              10.0,
              10.0,
            ),
          )
        ],
      ),
      width: _size.width * .75,
      height: _size.height * .65,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: _size.width * .255,
                  decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: _theme.dividerColor.withOpacity(0.5), width: 1),
                      ),
                      color: _theme.dividerColor.withOpacity(.225)),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: _size.width * .05,
                  ),
                  width: _size.width * .3,
                  height: _size.width * .3,
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: _theme.dividerColor,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Shimmer.fromColors(
                        baseColor: _theme.dividerColor,
                        highlightColor: Colors.white,
                        child: SizedBox(
                          width: _size.width * .3,
                          height: _size.width * .3,
                          child: Container(
                            color: _theme.dividerColor,
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    width: _size.width,
                    child: Shimmer.fromColors(
                      baseColor: _theme.dividerColor,
                      highlightColor: Colors.white,
                      child: SizedBox(
                        width: _size.width,
                        height: 15,
                        child: Container(
                          color: _theme.dividerColor,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                  ),
                  Shimmer.fromColors(
                    baseColor: _theme.dividerColor,
                    highlightColor: Colors.white,
                    child: SizedBox(
                      width: _size.width,
                      height: 30,
                      child: Container(
                        color: _theme.dividerColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
