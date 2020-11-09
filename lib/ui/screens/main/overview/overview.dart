import 'package:flutter/material.dart';
import 'package:oma/ui/screens/main/overview/overview_body.dart';
import 'package:oma/ui/screens/main/overview/right_panel.dart';


class OverView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OverViewBody(),
        ),
        RightPanel(),
      ],
    );
  }
}





