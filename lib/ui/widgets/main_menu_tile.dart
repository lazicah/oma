import 'package:flutter/material.dart';
import 'package:oma/enums/page_type.dart';
import 'package:oma/ui/screens/main/side_nav.dart';
import 'package:oma/ui/utils/build_utils.dart';

class MainMenuTile extends StatefulWidget {
  final Function onTap;
  final PageType pageType;
  final bool selected;
  final IconData icon;
  final String title;
  const MainMenuTile({
    Key key,
    @required this.onTap,
    @required this.icon,
    @required this.title,
    @required this.pageType,
    this.selected,
  }) : super(key: key);

  @override
  _MainMenuTileState createState() => _MainMenuTileState();
}

class _MainMenuTileState extends State<MainMenuTile> {
  @override
  Widget build(BuildContext context) {
    /// If we have a pageType, send a notification to the parent menu, so it know the position of each btn, and can position it's current-page indicator
    if (widget.pageType != null) {
      Future.delayed(Duration(milliseconds: 100), () {
        Offset o = BuildUtils.getOffsetFromContext(context);
        MainMenuOffsetNotification(widget.pageType, o).dispatch(context);
      });
    }
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: ListTile(
        leading: Icon(
          widget.icon,
          size: 18,
        ),
        selected: widget.selected,
        title: Text(
          widget.title,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        onTap: widget.onTap,
      ),
    );
  }
}
