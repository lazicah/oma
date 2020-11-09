import 'package:flutter/material.dart';

class EmptyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Image.asset(
          'assets/images/empty.png',
          height: 300,
          width: 500,
        ),
      ),
    );
  }
}
