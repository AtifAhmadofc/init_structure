// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';
// import 'package:http/http.dart' as http;
//
// import '../../utils/z_imports_utils.dart';
//
//
// class ApiBaseHelper {
//   bool? isHeader;
//
//   var client = http.Client();
//
//   String getBasicAuth() {
//     try {
//       String username = "ApiConstants.username";
//       String password = "ApiConstants.password";
//       String basicAuth =
//           'Basic ${base64Encode(utf8.encode('$username:$password'))}';
//       //
//       String isAccessToken ="";
//           // PreferenceManager.getString(AppConstants.accessToken);
//
//       String basicAuths =
//           isAccessToken.isEmpty ? basicAuth : 'Bearer $isAccessToken';
//       return basicAuths;
//     } catch (error) {
//       // Functions.recordError(error, s);
//       return "";
//     }
//   }
//
//   Future<dynamic> get(String url,
//       {String? baseUrl, bool isSetToTimeout = true}) async {
//     dynamic responseJson;
//     dynamic response;
//
//
//     try {
//       // print(object)
//       if (isSetToTimeout) {
//         response = await client
//             .get(Uri.parse((baseUrl ?? ApiConstants.baseURL) + url), headers: {
//           'Authorization': getBasicAuth(),
//           "Access-Control-Allow-Origin": "*"
//         }).timeout(const Duration(seconds: 600), onTimeout: () {
//           return _returnResponse(http.Response('Error', 408));
//         });
//       } else {
//         response = await http
//             .get(Uri.parse((baseUrl ?? ApiConstants.baseURL) + url), headers: {
//           'Authorization': getBasicAuth(),
//           "Access-Control-Allow-Origin": "*"
//         });
//       }
//
//       responseJson = _returnResponse(response);
//     } on SocketException {
//       responseJson = _returnResponse(http.Response('Error', 408));
//
//       // throw FetchDataException('No Internet connection');
//     } catch (error) {
//       // Functions.recordError(error, s);
//     }
//     return responseJson;
//   }
//
//
//   Future<dynamic> post(String url, dynamic body,
//       {var headers,
//       String? baseUrl,
//       bool isContentTypeJson = false,
//       bool isSetToTimeout = true}) async {
//     dynamic responseJson;
//     dynamic response;
//
//     try {
//       if (isSetToTimeout) {
//         response = await client
//             .post(Uri.parse((baseUrl ?? ApiConstants.baseURL) + url),
//                 body: body,
//                 headers: isContentTypeJson
//                     ? {
//                         'Authorization': getBasicAuth(),
//                         "Content-Type": "application/json"
//                       }
//                     : {
//                         'Authorization': getBasicAuth(),
//                       })
//             .timeout(const Duration(seconds: 300), onTimeout: () {
//           return _returnResponse(http.Response('Error', 408));
//         });
//       } else {
//         response = await http.post(
//             Uri.parse((baseUrl ?? ApiConstants.baseURL) + url),
//             body: body,
//             headers: isContentTypeJson
//                 ? {
//                     'Authorization': getBasicAuth(),
//                     "Content-Type": "application/json"
//                   }
//                 : {
//                     'Authorization': getBasicAuth(),
//                   });
//       }
//
//       responseJson = _returnResponse(response);
//     } on SocketException {
//       // if (!Provider.of<ProviderPostData>(context, listen: false)
//       //     .isBackgroundDataSyncing) {
//       //   DialogHelper().showMessage(
//       //       context, AppConstants.appName, "Internet is not connected.", () {
//       //     // Navigator.pop(context);
//       //   });
//       // }
//       responseJson = _returnResponse(http.Response('Error', 408));
//     } catch (error) {
//       // Functions.recordError(error, s);
//     }
//     return responseJson;
//   }
//
//   Future<dynamic> patch(String url, dynamic body,
//       {var headers, String? baseUrl, bool isContentTypeJson = false}) async {
//     dynamic responseJson;
//     dynamic response;
//
//     try {
//       response = await client
//           .patch(Uri.parse((baseUrl ?? ApiConstants.baseURL) + url),
//               body: body,
//               headers: isContentTypeJson
//                   ? {
//                       'Authorization': getBasicAuth(),
//                       "Access-Control-Allow-Origin": "*",
//                       "Content-Type": "application/json"
//                     }
//                   : {
//                       'Authorization': getBasicAuth(),
//                       "Access-Control-Allow-Origin": "*",
//                     })
//           .timeout(const Duration(seconds: 300), onTimeout: () {
//         return _returnResponse(http.Response('Error', 408));
//       });
//
//       responseJson = _returnResponse(response);
//     } on SocketException {
//       responseJson = _returnResponse(http.Response('Error', 408));
//     } catch (error) {
//       // Functions.recordError(error, s);
//     }
//     return responseJson;
//   }
//
//   Future<dynamic> put(String url, dynamic body,
//       {var headers, String? baseUrl, bool isContentTypeJson = false}) async {
//     dynamic responseJson;
//     dynamic response;
//
//     try {
//       response = await client
//           .put(Uri.parse((baseUrl ?? ApiConstants.baseURL) + url),
//               body: body,
//               headers: isContentTypeJson
//                   ? {
//                       'Authorization': getBasicAuth(),
//                       "Access-Control-Allow-Origin": "*",
//                       "Content-Type": "application/json"
//                     }
//                   : {
//                       'Authorization': getBasicAuth(),
//                       "Access-Control-Allow-Origin": "*",
//                     })
//           .timeout(const Duration(seconds: 300), onTimeout: () {
//         return _returnResponse(http.Response('Error', 408));
//       });
//
//       responseJson = _returnResponse(response);
//     } on SocketException {
//       responseJson = _returnResponse(http.Response('Error', 408));
//
//       // throw FetchDataException('No Internet connection');
//     } catch (error) {
//       // Functions.recordError(error, s);
//     }
//     return responseJson;
//   }
//
//   Future<dynamic> delete(String url, dynamic body,
//       {var headers, String? baseUrl, bool isContentTypeJson = false}) async {
//     dynamic responseJson;
//     dynamic response;
//
//     try {
//       response = await client
//           .delete(Uri.parse((baseUrl ?? ApiConstants.baseURL) + url),
//               body: body,
//               headers: isContentTypeJson
//                   ? {
//                       'Authorization': getBasicAuth(),
//                       "Access-Control-Allow-Origin": "*",
//                       "Content-Type": "application/json"
//                     }
//                   : {
//                       'Authorization': getBasicAuth(),
//                       "Access-Control-Allow-Origin": "*",
//                     })
//           .timeout(const Duration(seconds: 300), onTimeout: () {
//         return _returnResponse(http.Response('Error', 408));
//       });
//
//       responseJson = _returnResponse(response);
//     } on SocketException {
//       responseJson = _returnResponse(http.Response('Error', 408));
//
//       // throw FetchDataException('No Internet connection');
//     } catch (error) {
//       // Functions.recordError(error, s);
//     }
//     return responseJson;
//   }
//
//   Future<dynamic> getTokenFromRefresh(String url, dynamic body,
//       {var headers, String? baseUrl, bool isContentTypeJson = false}) async {
//     dynamic responseJson;
//     dynamic response;
//
//     try {
//       response = await client.post(
//           Uri.parse((baseUrl ?? ApiConstants.baseURL) + url),
//           body: body,
//           headers: {
//             "Access-Control-Allow-Origin": "*",
//             "Content-Type": "application/json"
//           });
//       responseJson = _returnResponse(response);
//     } on SocketException {
//       responseJson = _returnResponse(http.Response('Error', 408));
//
//       //throw FetchDataException('No Internet connection');
//     } catch (error) {
//       // Functions.recordError(error, s);
//     }
//     return responseJson;
//   }
//
//
//
//   dynamic _returnResponse(http.Response response) {
//     switch (response.statusCode) {
//       //Refresh TOKEN API 401 & 403 UnAuthorized
//       case 200:
//         var responseJson = json.decode(response.body);
//         return responseJson;
//       case 400:
//         var body =
//             jsonEncode(<String, String>{'detail': response.body.toString()});
//         var responseJson = json.decode(body);
//         return responseJson;
//       case 401:
//         var body = jsonEncode(<String, String>{
//           'detail': ConstantStrings.unauthorizedError,
//         });
//         var responseJson = json.decode(body);
//         return responseJson;
//       case 403:
//         var body = jsonEncode(<String, String>{
//           'detail': ConstantStrings.forbiddenError,
//         });
//         var responseJson = json.decode(body);
//         return responseJson;
//       case 408:
//         var body = jsonEncode(<String, String>{
//           'detail': "Internet connection error",
//         });
//         var responseJson = json.decode(body);
//         return responseJson;
//       case 500:
//         var body = jsonEncode(<String, String>{
//           'detail': "Backend is facing issues, contact administrator",
//         });
//         var responseJson = json.decode(body);
//         return responseJson;
//
//       default:
//         var body = jsonEncode(<String, String>{
//           'detail': "Something went wrong",
//         });
//         var responseJson = json.decode(body);
//         return responseJson;
//     }
//   }
// }
