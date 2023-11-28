import 'package:flutter/material.dart';

import 'enum/lifecycle.dart';
import 'routing_observer.dart';

mixin LifecycleBase {
  bool mounted = false;

  TickerProvider? _vsync;

  RouteSettings? settings;
  RoutingInformation? routeInformation;

  Lifecycle flagLifecycle = Lifecycle.initState;

  TickerProvider get vsync => _vsync!;

  bool get mustCancelRequest => flagLifecycle == Lifecycle.dispose;

  void setMounted(bool mounted) => this.mounted = mounted;

  void setTickerProvider(TickerProvider? tp) => _vsync = tp;

  /// This funciton setSetting use after 1 frame so it slow use setRouteSetting2 instead
  void setRouteSetting(RouteSettings? rs) {
    // settings = rs;
  }

  void setRouteSetting2() {
    routeInformation = SettingRemoteData().routeInformation;
    settings = routeInformation?.settings;
  }

  void setFlagLifecycle(Lifecycle flag) => flagLifecycle = flag;

  /*
  * Hàm được chạy đầu tiên ngay sau khi chuyển page
  * */
  Future<void> init() async {}

  /*
  * Hàm được chạy đầu tiên ngay sau khi chuyển page
  * */
  Future<void> onViewCreated() async {}

  void onDeActive() {}

  @mustCallSuper
  void onDispose() {
    // setTickerProvider(null);
  }
}
