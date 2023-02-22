import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:init_structure/utils/z_imports_utils.dart';

class Utils {
  // static List<CameraDescription> cameras = [];

  // static String formatNumber(double number) =>
  //     NumberFormat.simpleCurrency(locale: 'en_US', decimalDigits: 2)
  //         .format(number);

  static Future<bool> checkConnection() async => await check();

  static Future<bool> check() async {
    if (!kIsWeb) {
      bool hasConnection;
      try {
        final result = await InternetAddress.lookup('google.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          hasConnection = true;
        } else {
          hasConnection = false;
        }
      } on SocketException catch (_) {
        hasConnection = false;
      }
      return hasConnection;
    } else {
      return true;
    }

    // final connectivityResult = await Connectivity().checkConnectivity();

    // return connectivityResult == ConnectivityResult.mobile ||
    //     connectivityResult == ConnectivityResult.wifi;
  }

  static hideKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  static String convertStringFromDate(DateTime date) {
    return formatDate(date, [yyyy, '-', mm, '-', dd]);
  }

  static String getCurrentDay() => convertStringFromDate(DateTime.now());

  static String homeScreenConvertStringFromDate(DateTime date) {
    return formatDate(date, [DD, ' ', dd, ',  ', MM]);
  }

  // static DateTime stringToDate(String date) {
  //   return DateFormat('yyyy-mm-dd').parse(date).toLocal();
  // }

  // static navigateToHome(BuildContext context) {
  //   // Provider.of<ProviderDataLoad>(context, listen: false).getSalesPersonRoutesList();
  //   Provider.of<NavigationProvider>(context, listen: false)
  //       .updateNavigationScreen(2);
  //
  //   Navigator.of(context).pushAndRemoveUntil(
  //       MaterialPageRoute(builder: (context) => HomePage()),
  //       (Route<dynamic> route) => false);
  // }

  static bool isAndroidPlatform() => Platform.isAndroid;
}
