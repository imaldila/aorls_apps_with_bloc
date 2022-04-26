import 'package:flutter/material.dart';

class BottomLoader extends StatelessWidget {
  const BottomLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.symmetric(vertical: 20.0),
      child: SizedBox(
        height: 30,
        width: 30,
        child:  CircularProgressIndicator(),
      ),
    );
  }
}