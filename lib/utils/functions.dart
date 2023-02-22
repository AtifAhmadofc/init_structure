// import 'package:firebase_analytics/firebase_analytics.dart';
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
//
// import 'package:inecta_food/mf_logout.dart';
// import 'package:inecta_food/providers/provider_authentications.dart';
// import 'package:inecta_food/utils/z_imports_utils.dart';
// import 'package:inecta_food/widgets/widget_responsive.dart';
// import 'package:provider/provider.dart';
//
// import '../dsdnew/blocs/truck_route/truck_route_bloc.dart';
// import '../dsdnew/repositories/home_page_repository.dart';
// import '../lett/model/lett_data_response.dart';
// import '../mf_logout_wb.dart';
// import '../models/inecta_food_response.dart';
// import '../pnu/model/showapp/all_data.dart';
// import '../pnu/model/vendorApp/vendor_data_response.dart';
// import '../pnu/provider/provider_showapp_data.dart';
// import '../pnu/provider/provider_vendor_data.dart';
// import '../providers/provider_data.dart';
//
// enum DeviceType { Phone, Tablet }
//
// DeviceType getDeviceType() {
//   final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
//   return data.size.shortestSide < 550 ? DeviceType.Phone : DeviceType.Tablet;
// }
//
// class Functions {
//   static String getAddress(ShipToAddresses s) {
//     String _res = "${s.address}, ${s.city}, ${s.state}, ${s.zipCode}";
//     return _res;
//   }
//
//   static num getUnitPriceWithDiscount(
//       num unitPrice, num discountPercent, bool isSample) {
//     try {
//       return isSample != true
//           ? unitPrice * (100 - discountPercent) / 100
//           : unitPrice;
//     } catch (error, s) {
//       recordError(error, s);
//       return 0;
//     }
//   }
//
//   static Future<void> addlogEvent(String nameOfEvent, String data) async {
//     if (!kIsWeb) {
//       await FirebaseAnalytics.instance.logEvent(
//           name: nameOfEvent, parameters: {'data': data, 'debug_mode': true});
//     }
//   }
//
//   static Future<void> addlogEventWithParam(
//       String nameOfEvent, Map<String, Object?>? parameters) async {
//     if (!kIsWeb) {
//       await FirebaseAnalytics.instance
//           .logEvent(name: nameOfEvent, parameters: parameters);
//     }
//   }
//
//   static void recordError(Object error, StackTrace s) {
//     if (!kIsWeb) {
//       FirebaseCrashlytics.instance
//           .recordError(error, s, reason: error.toString());
//     }
//   }
//
//   static double setFontSize(BuildContext context, int smallScreen,
//       int mediumScreen, int largeScreen) {
//     Screen size = Screen(MediaQuery.of(context).size);
//     return ResponsiveWidget.isSmallScreen(context)
//         ? size.setSp(smallScreen)
//         : ResponsiveWidget.isMediumScreen(context)
//             ? size.setSp(mediumScreen)
//             : size.setSp(largeScreen);
//   }
//
//   static double setSizebasedOnWidth(BuildContext context, int smallScreen,
//       int mediumScreen, int largeScreen) {
//     Screen size = Screen(MediaQuery.of(context).size);
//     return ResponsiveWidget.isSmallScreen(context)
//         ? size.getWidthPx(smallScreen)
//         : ResponsiveWidget.isMediumScreen(context)
//             ? size.getWidthPx(mediumScreen)
//             : size.getWidthPx(largeScreen);
//   }
//
//   static double setSizebasedOnHeight(BuildContext context, int smallScreen,
//       int mediumScreen, int largeScreen) {
//     Screen size = Screen(MediaQuery.of(context).size);
//     return ResponsiveWidget.isSmallScreen(context)
//         ? size.getHeightPx(smallScreen)
//         : ResponsiveWidget.isMediumScreen(context)
//             ? size.getHeightPx(mediumScreen)
//             : size.getHeightPx(largeScreen);
//   }
//
//   static double setSizePixelbasedOnHeight(BuildContext context, int smallScreen,
//       int mediumScreen, int largeScreen) {
//     Screen size = Screen(MediaQuery.of(context).size);
//     return ResponsiveWidget.isSmallScreen(context)
//         ? size.hp(smallScreen)
//         : ResponsiveWidget.isMediumScreen(context)
//             ? size.hp(mediumScreen)
//             : size.hp(largeScreen);
//   }
//
//   static void LogoutForApps(BuildContext context,
//       {bool isAutoLogout = false}) async {
//     Provider.of<AuthenticationProvider>(context, listen: false)
//         .setLoading(false);
//     if (!kIsWeb) {
//       Navigator.of(context).push(
//         MaterialPageRoute(
//           builder: (context) => LogoutScreen(
//               logoutURL: AppConstants.msLogoutUrl, isAutoLogout: false),
//         ),
//       );
//     } else {
//       var appauth = LogoutMFService();
//       // appauth.initPopup(context);
//       // appauth.showPopup(context);
//
//       await appauth.ClearData();
//
//       Provider.of<ProviderShowAppDataLoad>(context, listen: false)
//           .allDataResponse_ShowApp = AllDataResponse_ShowApp();
//       // Provider.of<ProviderDataLoad>(context, listen: false).dataResponse =
//       //     InectaDataResponse();
//       Provider.of<ProviderVendorDataLoad>(context, listen: false).dataResponse =
//           VendorDataResponse();
//
//       await appauth.navigateToHome(context);
//     }
//   }
// }
