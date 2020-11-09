import 'package:flutter/material.dart';
import 'package:oma/ui/utils/styles.dart';

class OverViewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _Top(),
          Expanded(
            child: _Bottom(),
          )
        ],
      ),
    );
  }
}

class _Top extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(50),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'N24,421.54',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Available balance',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          Spacer(),
          Container(
            width: 150,
            height: 40,
            decoration: BoxDecoration(
              color: Color(0xffDEEEF6),
              borderRadius: Corners.s5Border,
            ),
            child: FlatButton(
              child: Text('Create a payment',
                  style: TextStyle(
                      color: AppColors.colorA,
                      fontSize: 12,
                      fontWeight: FontWeight.w600)),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}

class _Bottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: DefaultTabController(
        length: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'My payments',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Expanded(
                  child: TabBar(
                    indicatorColor: AppColors.colorA,
                    labelColor: AppColors.colorA,
                    isScrollable: true,
                    tabs: [
                      Tab(
                        child: Text('All payments'),
                      ),
                      Tab(
                        child: Text('Regular'),
                      )
                    ],
                  ),
                ),
                FlatButton.icon(
                  icon: Icon(
                    Icons.search,
                    size: 18,
                  ),
                  label: Text('Search'),
                  onPressed: () {},
                )
              ],
            ),
            Divider(height: 1),
            Expanded(
              child: TabBarView(
                children: [_AllPayments(), _Regular()],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _Regular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          VSpace(20),
          Text(
            'Recently',
            style: TextStyle(
                color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w600),
          ),
          VSpace(10),
          LongTile(
            iconBg: AppColors.colorB,
            image: 'assets/images/amazon.png',
            title: 'Amazon',
            subtitle: '12 oct, 2020 4:45pm',
            trailing: 'N24,421.54',
          ),
          LongTile(
            iconBg: Colors.black,
            image: 'assets/images/uber.png',
            title: 'Uber',
            subtitle: '12 oct, 2020 4:45pm',
            trailing: 'N24,421.54',
          ),
          LongTile(
            iconBg: AppColors.piggy,
            image: 'assets/images/piggy.png',
            title: 'Piggyvest',
            subtitle: '12 oct, 2020 4:45pm',
            trailing: 'N24,421.54',
          ),
          LongTile(
            iconBg: AppColors.dstv,
            image: 'assets/images/dstv.jpg',
            title: 'Dstv',
            subtitle: '12 oct, 2020 4:45pm',
            trailing: 'N24,421.54',
          ),
          LongTile(
            iconBg: Colors.black,
            image: 'assets/images/netflix.png',
            title: 'Netflix',
            subtitle: '12 oct, 2020 4:45pm',
            trailing: 'N24,421.54',
          ),
        ],
      ),
    );
  }
}

class _AllPayments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          VSpace(20),
          Text(
            'Today',
            style: TextStyle(
                color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w600),
          ),
          VSpace(10),
          LongTile(
            iconBg: AppColors.colorB,
            image: 'assets/images/amazon.png',
            title: 'Amazon',
            subtitle: '12 oct, 2020 4:45pm',
            trailing: 'N24,421.54',
          ),
          LongTile(
            iconBg: Colors.black,
            image: 'assets/images/uber.png',
            title: 'Uber',
            subtitle: '12 oct, 2020 4:45pm',
            trailing: 'N24,421.54',
          ),
          LongTile(
            iconBg: AppColors.piggy,
            image: 'assets/images/piggy.png',
            title: 'Piggyvest',
            subtitle: '12 oct, 2020 4:45pm',
            trailing: 'N24,421.54',
          ),
          VSpace(20),
          Row(
            children: [
              Text(
                'Upcoming payments',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          VSpace(20),
          Text(
            'Next week',
            style: TextStyle(
                color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w600),
          ),
          VSpace(10),
          LongTile(
            iconBg: AppColors.dstv,
            image: 'assets/images/dstv.jpg',
            title: 'Dstv',
            subtitle: '12 oct, 2020 4:45pm',
            trailing: 'N24,421.54',
          ),
          LongTile(
            iconBg: Colors.black,
            image: 'assets/images/netflix.png',
            title: 'Netflix',
            subtitle: '12 oct, 2020 4:45pm',
            trailing: 'N24,421.54',
          ),
        ],
      ),
    );
  }
}

class LongTile extends StatelessWidget {
  final Color iconBg;
  final String image;
  final String title;
  final String subtitle;
  final String trailing;

  const LongTile(
      {Key key,
      @required this.iconBg,
      this.image,
      this.title,
      this.subtitle,
      this.trailing})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.all(5),
            height: 40,
            width: 40,
            decoration:
                BoxDecoration(borderRadius: Corners.s5Border, color: iconBg),
          ),
          HSpace(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                subtitle,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          Spacer(),
          Text(
            trailing,
            style: TextStyle(
                color: Colors.black, fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
