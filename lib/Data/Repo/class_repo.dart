
import 'package:init_structure/Data/Models/class_model.dart';

class ClassRepo {


  Future<bool> submitClassDetails(ClassDataModel classDataModel) async {

    try{
      // await studentCheckoutCollectionRef.doc(classDataModel.id).set(classDataModel.toJson());
      return true;
    }
    catch(e){
      return false;
    }
  }

}
