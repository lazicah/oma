import 'package:flutter/material.dart';
import 'package:oma/enums/page_type.dart';
import 'package:oma/state/app/app_bloc.dart';
import 'package:oma/ui/screens/empty.dart';
import 'package:oma/ui/screens/main/overview/overview.dart';
import 'package:oma/ui/utils/styles.dart';
import 'package:oma/ui/widgets/fading_indexstack.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var currentPage = context.select<AppBloc, PageType>((bloc) => bloc.state);

    return Scaffold(
      backgroundColor: AppColors.bgA,
      body: FadingIndexedStack(
        index: pageTypes.indexOf(currentPage),
        children: [
          EmptyView(),
          OverView(),
          EmptyView(),
          EmptyView(),
          EmptyView(),
          EmptyView(),
          EmptyView(),
        ],
      ),
    );
  }
}

List<PageType> pageTypes = [
  PageType.Transactions,
  PageType.Overview,
  PageType.Card,
  PageType.SendMoney,
  PageType.Loans,
  PageType.Settings,
  PageType.Logout
];
