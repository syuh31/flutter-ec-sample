import 'package:flutter/material.dart';
import 'package:flutter_ec_sample/widget/tab_kind.dart';

class TabNavigatorRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}

class TabNavigator extends StatelessWidget {
  TabNavigator({this.navigatorKey, this.tabKind, this.home, this.routes});
  final GlobalKey<NavigatorState> navigatorKey;
  final TabKind tabKind;
  final Widget home;
  final Map<String, WidgetBuilder> routes;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      initialRoute: Navigator.defaultRouteName,
      onGenerateRoute: (routeSettings) {
        final WidgetBuilder pageContentBuilder = home != null
            ? (BuildContext context) => home
            : routes[routeSettings.name];

        return MaterialPageRoute(builder: pageContentBuilder);
      },
    );
  }
}
