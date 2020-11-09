import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:oma/enums/page_type.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oma/state/app/app_bloc.dart';
import 'package:oma/ui/utils/styles.dart';
import 'package:oma/ui/widgets/main_menu_tile.dart';
import 'package:oma/ui/widgets/styled_container.dart';

class SideNav extends StatefulWidget {
  final Function(PageType) onPageSelected;

  const SideNav({Key key, this.onPageSelected}) : super(key: key);
  @override
  _SideNavState createState() => _SideNavState();
}

class _SideNavState extends State<SideNav> {
  Map<PageType, Offset> _menuBtnOffsetsByType = {};
  PageType _prevPage;

  double get _headerHeight => 150;

  double get _indicatorHeight => 40;

  double get _btnHeight => 40;

  double _indicatorY;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var bloc = BlocProvider.of<AppBloc>(context);
      _updateIndicatorState(bloc.state);
    });

    super.initState();
  }

  @override
  void didChangeDependencies() {
    Future.delayed(Duration(milliseconds: 300)).then((value) {
      if (mounted) {
        var bloc = BlocProvider.of<AppBloc>(context);
        _updateIndicatorState(bloc.state);
      }
    });

    super.didChangeDependencies();
  }

  void _handlePageSelected(PageType pageType) =>
      widget.onPageSelected?.call(pageType);

  void _updateIndicatorState(PageType type) {
    if (_menuBtnOffsetsByType.containsKey(type)) {
      Offset o = _menuBtnOffsetsByType[type];
      setState(() => _indicatorY =
          o.dy - _headerHeight + _btnHeight * .5 - _indicatorHeight * .5);
    }
  }

  @override
  Widget build(BuildContext context) {
    var currentPage = context.select<AppBloc, PageType>((bloc) => bloc.state);
    if (currentPage != _prevPage) {
      _updateIndicatorState(currentPage);
    }
    _prevPage = currentPage;
    return Container(
      width: 250,
      child: Drawer(
        child: Material(
          color: AppColors.bgA,
          child: Column(
            children: [
              Container(
                height: _headerHeight,
                child: Image.asset(
                  'assets/images/logo.jpg',
                  height: 50,
                  width: 50,
                ),
              ),
              Expanded(
                child: NotificationListener<MainMenuOffsetNotification>(
                  // Listen for [MainMenuOffsetNotification], dispatched from each [MainMenuBtn] that is assigned a pageType.
                  // We use these to position the animated indicator in [_updateIndicatorState]
                  onNotification: (n) {
                    _menuBtnOffsetsByType[n.pageType] = n.offset;
                    return true; // Return true so the notification stops here
                  },
                  child: ListTileTheme(
                    dense: true,
                    selectedColor: Colors.white,
                    child: Stack(
                      children: [
                        _AnimatedMenuIndicator(_indicatorY ?? 0.0,
                            height: _indicatorHeight),
                        Column(
                          children: [
                            MainMenuTile(
                              pageType: PageType.Transactions,
                              icon: FontAwesome.exchange,
                              title: 'Transactions',
                              selected: currentPage == PageType.Transactions,
                              onTap: () =>
                                  _handlePageSelected(PageType.Transactions),
                            ),
                            MainMenuTile(
                              pageType: PageType.Overview,
                              icon: Icons.remove_red_eye,
                              title: 'Overview',
                              selected: currentPage == PageType.Overview,
                              onTap: () =>
                                  _handlePageSelected(PageType.Overview),
                            ),
                            MainMenuTile(
                              pageType: PageType.Card,
                              icon: Ionicons.ios_card,
                              title: 'Card',
                              selected: currentPage == PageType.Card,
                              onTap: () => _handlePageSelected(PageType.Card),
                            ),
                            MainMenuTile(
                              pageType: PageType.SendMoney,
                              icon: FontAwesome.send,
                              title: 'Send Money',
                              selected: currentPage == PageType.SendMoney,
                              onTap: () =>
                                  _handlePageSelected(PageType.SendMoney),
                            ),
                            MainMenuTile(
                              pageType: PageType.Loans,
                              icon: Icons.list,
                              title: 'Loans',
                              selected: currentPage == PageType.Loans,
                              onTap: () => _handlePageSelected(PageType.Loans),
                            ),
                            Spacer(),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: ListTile(
                                leading: Icon(
                                  CupertinoIcons.gear,
                                  size: 18,
                                ),
                                title: Text('Settings'),
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: ListTile(
                                leading: Icon(
                                  Icons.logout,
                                  size: 18,
                                ),
                                title: Text('Logout'),
                              ),
                            ),
                            VSpace(10)
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MainMenuOffsetNotification extends Notification {
  final Offset offset;
  final PageType pageType;

  MainMenuOffsetNotification(this.pageType, this.offset);
}

class _AnimatedMenuIndicator extends StatefulWidget {
  final double indicatorY;
  final double width;
  final double height;

  _AnimatedMenuIndicator(this.indicatorY,
      {this.width = double.infinity, this.height = 24});

  @override
  _AnimatedMenuIndicatorState createState() => _AnimatedMenuIndicatorState();
}

class _AnimatedMenuIndicatorState extends State<_AnimatedMenuIndicator> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
        width: widget.width,
        height: widget.height,
        child: StyledContainer(
          AppColors.colorA,
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: EdgeInsets.only(
            top: widget.indicatorY ?? 20.0, left: 20, right: 20));
  }
}
