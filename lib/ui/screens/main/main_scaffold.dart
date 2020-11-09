import 'package:flutter/material.dart';
import 'package:oma/state/app/app_bloc.dart';
import 'package:oma/state/app/app_events.dart';
import 'package:oma/ui/screens/main/main_body.dart';
import 'package:oma/ui/screens/main/side_nav.dart';
import 'package:oma/ui/utils/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgA,
      body: Row(
        children: [
          SideNav(
            onPageSelected: (page) {
              BlocProvider.of<AppBloc>(context).add(SetCurrentPage(page));
            },
          ),
          Expanded(
            child: MainBody(),
          ),
        ],
      ),
    );
  }
}
