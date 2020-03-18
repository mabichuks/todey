import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Utils {

  static void showCustomModalBottomSheet({@required BuildContext context, @required Widget child, @required double height}) {
     showModalBottomSheet(
      context: context,
      //isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topRight: Radius.circular(12), topLeft: Radius.circular(12)),
      ),
      builder: (ctx) => Container(
        height: height,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Container(
                width: 60,
                height: 5,
                alignment: Alignment(0.5, 1.0),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(192, 192, 192, 0.7),
                  borderRadius: BorderRadius.all(Radius.circular(10)
                  ),
                ),
              ),
            ),
            child
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10)
          ),
        ),

      ),

    );
  }
}