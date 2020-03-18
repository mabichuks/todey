import 'package:flutter/material.dart';

class CustomBottomModal extends StatefulWidget {

  final Widget child;

  CustomBottomModal(this.child);

  @override
  _CustomBottomModalState createState() => _CustomBottomModalState();
}

class _CustomBottomModalState extends State<CustomBottomModal> {
  @override
  Widget build(BuildContext context) {
    return   SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom + 50),
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
            widget.child
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