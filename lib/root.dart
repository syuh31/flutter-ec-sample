import 'package:flutter/material.dart';
import 'package:flutter_ec_sample/model/user_manager.dart';
import 'package:flutter_ec_sample/page/cart.dart';
import 'package:flutter_ec_sample/page/home.dart';
import 'package:flutter_ec_sample/widget/cart_icon.dart';
import 'package:flutter_ec_sample/widget/tab_kind.dart';
import 'package:flutter_ec_sample/widget/tab_navigator.dart';
import 'package:provider/provider.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  final TabKind _rootTab = TabKind.home;
  TabKind _currentTab = TabKind.home;

  final _navigatorKeys = {
    TabKind.home: GlobalKey<NavigatorState>(),
    TabKind.user: GlobalKey<NavigatorState>(),
    TabKind.cart: GlobalKey<NavigatorState>(),
    TabKind.setting: GlobalKey<NavigatorState>(),
  };

  final Map<TabKind, int> tabIndexes = {
    TabKind.home: 0,
    TabKind.user: 1,
    TabKind.cart: 2,
    TabKind.setting: 3,
  };

  var cartItemNum = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final currentNavigatorState = _navigatorKeys[_currentTab]!.currentState;
        if (currentNavigatorState == null) {
          if (_currentTab == _rootTab) {
            return true;
          } else {
            setState(() => _currentTab = _rootTab);
            return false;
          }
        }

        final isFirstRouteInCurrentTab =
            !await currentNavigatorState.maybePop();
        if (isFirstRouteInCurrentTab) {
          if (_currentTab != _rootTab) {
            setState(() => _currentTab = _rootTab);
            return false;
          }
        }
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: buildBody(context),
        bottomNavigationBar: buildBottomNavigationBar(context),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return Stack(
      children: <Widget>[
        Offstage(
          offstage: _currentTab != TabKind.home,
          child: TabNavigator(
            navigatorKey: _navigatorKeys[TabKind.home]!,
            tabKind: TabKind.home,
            home: HomePage(),
          ),
        ),
        Offstage(
          offstage: _currentTab != TabKind.user,
          child: TabNavigator(
            navigatorKey: _navigatorKeys[TabKind.user]!,
            tabKind: TabKind.user,
            home: Text('user'),
          ),
        ),
        Offstage(
          offstage: _currentTab != TabKind.cart,
          child: TabNavigator(
            navigatorKey: _navigatorKeys[TabKind.cart]!,
            tabKind: TabKind.cart,
            home: CartPage(),
          ),
        ),
        Offstage(
          offstage: _currentTab != TabKind.setting,
          child: TabNavigator(
            navigatorKey: _navigatorKeys[TabKind.setting]!,
            tabKind: TabKind.setting,
            home: Text('setting'),
          ),
        ),
      ],
    );
  }

  Widget buildBottomNavigationBar(BuildContext context) {
    final itemNum = 4;
    final borderWidth = 40.0;
    final borderSpaceWidth = (MediaQuery.of(context).size.width / itemNum);
    final color = IconTheme.of(context).color;

    return Container(
      decoration: BoxDecoration(
          border: Border(top: BorderSide(width: 0.5, color: Colors.grey))),
      height: 50,
      child: Stack(
        children: <Widget>[
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            curve: Curves.decelerate,
            left: borderSpaceWidth * tabIndexes[_currentTab]! +
                borderSpaceWidth / 2 -
                borderWidth / 2,
            child: Container(
              width: borderWidth,
              height: 4,
              decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(3),
                      bottomLeft: Radius.circular(3)),
                  border: Border.all(color: color!)),
            ),
          ),
          Row(
            children: <Widget>[
              ...tabIndexes.keys.map((tab) => buildBottomBarItem(
                    context,
                    icon: buildIcon(context, tab),
                    newTab: tab,
                  ))
            ],
          ),
        ],
      ),
    );
  }

  Widget buildIcon(BuildContext context, TabKind tab) {
    Widget icon;
    switch (tab) {
      case TabKind.home:
        icon = Icon(
          Icons.home,
          color: _currentTab == tab ? null : Colors.grey,
        );
        break;
      case TabKind.user:
        icon = Icon(
          Icons.account_circle,
          color: _currentTab == tab ? null : Colors.grey,
        );
        break;
      case TabKind.cart:
        icon = buildCartIcon(context);
        break;
      case TabKind.setting:
        icon = Icon(
          Icons.list,
          color: _currentTab == tab ? null : Colors.grey,
        );
        break;
    }

    return icon;
  }

  Widget buildCartIcon(BuildContext context) {
    return CartIcon(
      color: (_currentTab == TabKind.cart) ? null : Colors.grey,
      count: context.select((UserManager userMgr) => userMgr.cartItems.length),
    );
  }

  Widget buildBottomBarItem(
    BuildContext context, {
    required Widget icon,
    required TabKind newTab,
  }) {
    const bottomBarHeight = 45.0;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        setState(() {
          _currentTab = newTab;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width / tabIndexes.length,
        height: bottomBarHeight,
        child: Center(
          child: icon,
        ),
      ),
    );
  }
}
