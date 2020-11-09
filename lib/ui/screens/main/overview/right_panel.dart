import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:oma/ui/utils/screen_utils.dart';
import 'package:oma/ui/utils/styles.dart';
import 'package:oma/ui/widgets/animated_panel.dart';

class RightPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isNarrow =
        MediaQuery.of(context).size.width < PageBreaks.TabletLandscape;
    return Container(
      width: 350,
      height: double.infinity,
      child: Column(
        children: [
          Expanded(child: _Top()),
          Expanded(child: _Bottom()),
        ],
      ),
    ).animatedPanelX(closeX: 350, isClosed: isNarrow);
  }
}

class _Top extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: AppColors.bgB,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        CircleAvatar(
          radius: 30,
        ),
        VSpace(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Oma Anaele',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Icon(Icons.keyboard_arrow_down),
          ],
        ),
        VSpace(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(Insets.m),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(Insets.m),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.colorB,
                    ),
                    child: Icon(
                      Icons.arrow_circle_up_outlined,
                      color: Colors.white,
                    ),
                  ),
                  VSpace(5),
                  Text(
                    'Top up',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(Insets.m),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(Insets.m),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                    child: Icon(
                      Icons.sync_alt,
                      color: Colors.white,
                    ),
                  ),
                  VSpace(5),
                  Text(
                    'Exchange',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(Insets.m),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(Insets.m + 5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.colorA,
                    ),
                    child: Icon(
                      FontAwesome.send,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                  VSpace(5),
                  Text(
                    'Send',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  )
                ],
              ),
            ),
          ],
        )
      ]),
    );
  }
}

class _Bottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.bgC,
      padding: EdgeInsets.all(Insets.l),
      child: Column(
        children: [
          MyTile(
            isHeader: true,
            leading: 'Card Details',
            trailing: 'More details',
            hasEndIcon: false,
          ),
          MyTile(
            isHeader: false,
            leading: 'Status',
            trailing: 'Active',
            hasEndIcon: true,
            color: AppColors.colorA,
          ),
          MyTile(
            isHeader: false,
            leading: 'Card Type',
            trailing: 'Virtual Card',
            hasEndIcon: true,
          ),
          MyTile(
            isHeader: false,
            leading: 'Currency',
            trailing: 'USD',
            hasEndIcon: true,
          ),
          VSpace(10),
          MyTile(
            isHeader: true,
            leading: 'Limits',
            trailing: 'Settings',
            hasEndIcon: false,
          ),
          MyTile(
            isHeader: false,
            leading: 'Monthly payment limit',
            trailing: 'N50000.00',
            hasEndIcon: true,
          ),
          MyTile(
            isHeader: false,
            leading: 'Monthly ATM limit',
            trailing: 'N26000.00',
            hasEndIcon: true,
          ),
        ],
      ),
    );
  }
}

class MyTile extends StatelessWidget {
  final bool isHeader;
  final String leading;
  final String trailing;
  final bool hasEndIcon;
  final Color color;

  const MyTile(
      {Key key,
      this.isHeader = false,
      this.leading,
      this.trailing,
      this.hasEndIcon = false,
      this.color = Colors.white})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: isHeader ? Insets.m : Insets.sm),
      child: Row(
        children: [
          Text(leading,
              style: TextStyle(
                  color: isHeader ? Colors.black : Colors.grey,
                  fontSize: isHeader ? 16 : 12,
                  fontWeight: isHeader ? FontWeight.bold : FontWeight.normal)),
          Spacer(),
          Row(
            crossAxisAlignment:
                hasEndIcon ? CrossAxisAlignment.center : CrossAxisAlignment.end,
            children: [
              Text(
                trailing,
                style: TextStyle(
                    color: isHeader ? Colors.grey : Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
              HSpace(hasEndIcon ? 10 : 5),
              isHeader
                  ? Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                    )
                  : hasEndIcon
                      ? Container(
                          height: 4,
                          width: 4,
                          color: color,
                        )
                      : SizedBox(height: 2, width: 2)
            ],
          )
        ],
      ),
    );
  }
}
