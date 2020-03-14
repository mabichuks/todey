import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingIndicator extends StatelessWidget {

  final Color backgroundColor;
  final Color loaderColor;

  LoadingIndicator(this.backgroundColor, this.loaderColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Center(
        child: SpinKitChasingDots(
          color: loaderColor,
          size: 50.0,
        ),
      ),
    );
  }

}