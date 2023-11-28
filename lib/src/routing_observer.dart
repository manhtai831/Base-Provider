import 'package:flutter/material.dart';

class RoutingObserver extends NavigatorObserver {
  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    SettingRemoteData().update((information) => information.settings = previousRoute?.settings);
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    SettingRemoteData().update((information) => information.settings = route.settings);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    SettingRemoteData().update((information) => information.settings = newRoute?.settings);
  }
}

class RoutingInformation {
  RouteSettings? settings;

  RoutingInformation({this.settings});
}

class SettingRemoteData {
  SettingRemoteData._();

  static final SettingRemoteData _singleton = SettingRemoteData._();

  factory SettingRemoteData() => _singleton;

  final RoutingInformation _routeInformation = RoutingInformation();

  void update(void Function(RoutingInformation infomation) fn) => fn(_routeInformation);

  RoutingInformation get routeInformation => _routeInformation;
}
