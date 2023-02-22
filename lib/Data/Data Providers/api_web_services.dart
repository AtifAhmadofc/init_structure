import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:init_structure/Data/Models/class_model.dart';

import '../../utils/z_imports_utils.dart';
import 'z_imports_services.dart';

class WebServices {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<ClassDataModel?> getClassData(BuildContext context) async {
    try {
      final response = await _helper.get("ApiConstants.classData");
      ClassDataModel apiResponse = ClassDataModel.fromJson(response);
      return apiResponse;
    } catch (error) {
      return null;
    }
  }

  Future<bool?> getClassData2(dynamic body) async {
    final response = await _helper.post(ApiConstants.postAttachment, body,
        isSetToTimeout: false);

    ClassDataModel apiResponse = ClassDataModel.fromJson(response);

    if (kDebugMode) {
      print(apiResponse);
    }
    return true;
  }
}
