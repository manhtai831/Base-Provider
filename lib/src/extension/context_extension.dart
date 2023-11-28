import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  /*
  * Hiển thị dialog
  * */
  Future<dynamic> dialog(Widget dialog, {dynamic arguments, bool? barrierDismissible, int? duration}) async {
    return await showGeneralDialog(
      context: this,
      barrierDismissible: barrierDismissible ?? true,
      barrierLabel: MaterialLocalizations.of(this).modalBarrierDismissLabel,
      routeSettings: RouteSettings(arguments: arguments),
      pageBuilder: (animation, secondaryAnimation, child) {
        return dialog;
      },
    );
  }

  /*
  * Hiển thị bottomSheet
  * */
  Future<dynamic> bottomSheetDialog(Widget dialog, {dynamic arguments, bool? isScrollControlled, Color? backgroundColor}) async {
    return await showModalBottomSheet(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))),
        context: this,
        isScrollControlled: isScrollControlled ?? false,
        builder: (context) => dialog,
        backgroundColor: backgroundColor ?? Colors.white,
        routeSettings: RouteSettings(arguments: arguments));
  }

  Future<dynamic> push(dynamic page, {dynamic arguments}) async {
    return await Navigator.push(
      this,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => page,
      ),
    );
  }

  /*
  * Navigate to new page with [RouteName]
  * */
  Future<dynamic> pushNamed(String routeName, {dynamic arguments}) async {
    return await Navigator.pushNamed(this, routeName, arguments: arguments);
  }

  /*
  * Navigate to new page with [RouteName] and replace [current page]
  * */
  Future<dynamic> pushReplacementNamed(String routeName, {dynamic arguments, dynamic result}) async {
    return await Navigator.pushReplacementNamed(this, routeName, arguments: arguments, result: result);
  }

  /*
  * Navigate to new page with [RouteName] and replace all util pages
  * */
  Future<dynamic> pushNamedAndRemoveUntil(String routeName, {dynamic arguments}) async {
    return await Navigator.pushNamedAndRemoveUntil(
      this,
      routeName,
      (Route<dynamic> route) => false,
      arguments: arguments,
    );
  }

  /*
  * Close dialog, page,...
  *
  * Safe when [page histories] is empty
  * */
  void back({dynamic result}) async {
    await Navigator.maybePop(this, result);
  }

  void pop({dynamic result}) async {
    Navigator.pop(this, result);
  }

  void popUntil(String routePath) async {
    Navigator.popUntil(this, ModalRoute.withName(routePath));
  }
}
