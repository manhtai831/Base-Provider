import 'dart:developer';
import 'package:flutter/foundation.dart';

/*
Black:   \x1B[30m
Red:     \x1B[31m
Green:   \x1B[32m
Yellow:  \x1B[33m
Blue:    \x1B[34m
Magenta: \x1B[35m
Cyan:    \x1B[36m
White:   \x1B[37m
Reset:   \x1B[0m*/

void showLog(dynamic message) {
  if (!kReleaseMode) print('\x1B[34m[VERBOSE] $message\x1B[0m');
  // print('\x1B[34m[VERBOSE] $message\x1B[0m');
}

void showError(Object? message) {
  log('$message', error: message.toString(), name: 'ERROR');
}

void showWarning(Object message) {
  if (kDebugMode) print('\x1B[33m[WARNING] $message\x1B[0m');
}

void showLogState(Object message) {
  if (kDebugMode) print('\x1B[36m[WEUP-APP] $message\x1B[0m');
}

void showDioLog(Object message) {
  if (kDebugMode) print('\x1B[35m[WEUP-APP] $message\x1B[0m');
}

/*
  * Hỗ trợ nhanh delay một khoảng thời gian,
  * thường được sử dụng trong môi trường dev
  * */
Future<void> delay(int millis) async => await Future.delayed(Duration(milliseconds: millis));
