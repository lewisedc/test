import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: CupertinoThemeData(
        textTheme: CupertinoTextThemeData(
          textStyle: TextStyle(
            fontFamily: 'Gilroy',
          ),
        ),
        barBackgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Navigator(),
    );
  }
}

class Navigator extends StatefulWidget {
  @override
  _NavigatorState createState() => _NavigatorState();
}

class _NavigatorState extends State<Navigator> {
  int pageIndex = 0;

  void changePage(int newPageIndex) {
    setState(() {
      pageIndex = newPageIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(pageIndex);

    return CupertinoTabScaffold(
      backgroundColor: Colors.white,
      tabBuilder: (BuildContext context, int index) {
        switch (index) {
          case 0:
            return HomeScreen(changePage: changePage);
            break;
          case 1:
            return TicketScreen();
            break;
          default:
            return AccountScreen();
            break;
        }
      },
      tabBar: CupertinoTabBar(
        activeColor: Color(0xFF141414),
        inactiveColor: Color(0xFFAAAAAA),
        currentIndex: pageIndex,
        iconSize: 30.0,
        border: Border(
          top: BorderSide(
            color: Color(0xFFF7F7F7),
            width: 1.0,
          ),
        ),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({this.changePage});

  final Function changePage;

  @override
  Widget build(BuildContext context) {
    return CupertinoTabView(
      builder: (BuildContext context) {
        return CupertinoPageScaffold(
          child: SafeArea(
            child: ListView(
              padding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 30.0),
              children: <Widget>[
                TopBar(
                  title: 'Pots',
                  changePage: changePage,
                ),
                SizedBox(
                  height: 16.0,
                ),
                ProductCard(
                  color: Color(0xFF007AFF),
                  image: Image.asset('assets/ps4.png'),
                  timeRemaning: '14 hours left',
                  pillColor: Color(0xFF146BCA),
                  name: 'PS4 Pro - Spider-Man',
                  potType: 'DAILY',
                ),
                SizedBox(
                  height: 32.0,
                ),
                ProductCard(
                  color: Color(0xFFEF2E61),
                  image: Image.asset('assets/yeezy.png'),
                  timeRemaning: '3 days left',
                  pillColor: Color(0xFFC71D4A),
                  name: 'Yeezy Boost 350 V2 - Black',
                  potType: 'PREMIUM',
                ),
                SizedBox(
                  height: 32.0,
                ),
                ProductCard(
                  color: Color(0xFF21D896),
                  image: Image.asset('assets/iphone.png'),
                  timeRemaning: '5 days left',
                  pillColor: Color(0xFF1EB37D),
                  name: 'iPhone XS Max - 256gb',
                  potType: 'WEEKLY',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class TicketScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabView(
      builder: (BuildContext context) {
        return CupertinoPageScaffold(
          child: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TopBar(
                      title: 'Tickets',
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    ClickableCard(
                      icon: Icons.play_circle_filled,
                      details: '+1',
                      title: 'Watch an Ad',
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: ClickableCard(
                            icon: Icons.format_align_center,
                            details: '+3',
                            title: 'Complete Survey',
                            topPadding: 183.0,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Column(
                              children: <Widget>[
                                ClickableCard(
                                  icon: Icons.local_offer,
                                  title: 'View Offers',
                                ),
                                ClickableCard(
                                  icon: Icons.people,
                                  title: 'Invite Friends',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabView(
      builder: (BuildContext context) {
        return CupertinoPageScaffold(
          child: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 30.0),
                child: Column(
                  children: <Widget>[
                    TopBar(
                      title: 'Lewis',
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: ClickableCard(
                            icon: Icons.check,
                            title: 'Winnings',
                            topPadding: 61.0,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: ClickableCard(
                              icon: Icons.card_giftcard,
                              title: 'Premium',
                              topPadding: 61.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: ClickableCard(
                            icon: Icons.question_answer,
                            title: 'FAQs',
                            topPadding: 61.0,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: ClickableCard(
                              icon: Icons.help,
                              title: 'Help',
                              topPadding: 61.0,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class TopBar extends StatelessWidget {
  TopBar({this.title, this.changePage});

  final String title;
  final Function changePage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 92.0,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              color: Color(0xFF141414),
              fontSize: 48.0,
              fontWeight: FontWeight.w900,
            ),
          ),
          GestureDetector(
            onTap: () => changePage(2),
            child: Text(
              '374',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24.0,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  ProductCard({
    @required this.color,
    @required this.image,
    @required this.timeRemaning,
    @required this.pillColor,
    @required this.name,
    @required this.potType,
  });

  final Color color;
  final Image image;
  final String timeRemaning;
  final Color pillColor;
  final String name;
  final String potType;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.3),
            blurRadius: 15.0,
          ),
        ],
      ),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 249.0,
                  child: Center(child: image),
                ),
                SizedBox(
                  height: 12.0,
                ),
                Text(
                  potType,
                  style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 0.8),
                    fontWeight: FontWeight.w900,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Container(
                  child: Text(
                    name,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 36.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 16.0,
            right: 16.0,
            child: Container(
              decoration: BoxDecoration(
                color: pillColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    5.0,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25.0,
                  vertical: 9.0,
                ),
                child: Text(
                  timeRemaning,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ClickableCard extends StatelessWidget {
  ClickableCard({
    @required this.icon,
    this.details,
    @required this.title,
    this.topPadding = 28.0,
  });

  final IconData icon;
  final String details;
  final String title;
  final double topPadding;

  @override
  Widget build(BuildContext context) {
    if (details == null) {
      return Container(
        margin: EdgeInsets.only(
          bottom: 16.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
          color: Color(0xFF007AFF),
          boxShadow: [
            BoxShadow(
              blurRadius: 15.0,
              color: Color.fromRGBO(0, 0, 0, 0.3),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.0, topPadding, 20.0, 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Icon(
                icon,
                color: Colors.white,
                size: 40.0,
              ),
              SizedBox(
                height: 16.0,
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        margin: EdgeInsets.only(
          bottom: 16.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
          color: Color(0xFF007AFF),
          boxShadow: [
            BoxShadow(
              blurRadius: 15.0,
              color: Color.fromRGBO(0, 0, 0, 0.3),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.0, topPadding, 20.0, 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Icon(
                icon,
                color: Colors.white,
                size: 40.0,
              ),
              SizedBox(
                height: 16.0,
              ),
              Text(
                details,
                style: TextStyle(
                  color: Color(0xFFA9D2FF),
                  fontSize: 24.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
