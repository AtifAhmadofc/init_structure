

import '../Data Providers/api_web_services.dart';

class ClassRepo {


  Future<bool> submitClassDetails() async {

    try{
      // await WebServices().getClassData();
      return true;
    }
    catch(e){
      return false;
    }
  }

}
