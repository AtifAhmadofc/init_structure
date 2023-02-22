import 'package:flutter/material.dart';
import 'package:init_structure/utils/constants/z_import_constants.dart';

class BottomSheets {
  static final _formKey = GlobalKey<FormState>();

  static showBottomSheet(
    context,
    TextEditingController deletePasswordController,
    // ParentDataModel parentDataModel,
  ) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          margin:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          padding: const EdgeInsets.fromLTRB(35, 0, 35, 50),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * 0.2,
                      left: MediaQuery.of(context).size.width * 0.2,
                      top: 20,
                      bottom: 40),
                  height: 5,
                  decoration: BoxDecoration(
                      color:ColorConstants. textFieldIconColor,
                      borderRadius: BorderRadius.circular(100)),
                ),
                Text(
                  ConstantStrings.profileDeleteAccount,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: ColorConstants.deleteColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, bottom: 30),
                  child: Text(
                    ConstantStrings.profileDeleteAccountDesc,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: ColorConstants.headingColor2,
                        height: 1.7),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  child: TextFormField(
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Please enter password";
                      }
                      // else if (val != paren) {
                      //   return "Please enter password";
                      // }
                      return null;
                    },
                    controller: deletePasswordController,
                    cursorColor: Colors.black,
                    obscureText: true,
                    decoration: InputDecoration(
                      label: Text(
                        ConstantStrings.profilePassword,
                        style: TextStyle(
                          color:ColorConstants. textFieldHintColor,
                          fontSize: 16,
                        ),
                      ),
                      border:Styles. textFieldBorderStyle2,
                      errorBorder: Styles.textFieldBorderStyle2,
                      enabledBorder:Styles. textFieldBorderStyle2,
                      focusedBorder:Styles. textFieldBorderStyle2,
                      focusedErrorBorder:Styles. textFieldBorderStyle2,
                    ),
                  ),
                ),
                // BlocConsumer<ParentBloc, ParentState>(
                //   listener: (context, state) {
                //     if (state.isSuccessState) {
                //       // FirebaseAuth.instance.signOut();
                //       Navigator.pushNamedAndRemoveUntil(
                //           context, "/", (Route<dynamic> route) => false);
                //     } else if (state.isFailedState) {
                //       Navigator.pop(context);
                //       deletePasswordController.clear();
                //       CommonHelper.showSnackBar(context, state.errorMessage);
                //     }
                //   },
                //   builder: (context, state) {
                //     return (state.isInitStateState || state.isSuccessState)
                //         // && false
                //         ? CustomButton(
                //             onChanged: () {
                //               CommonHelper.unFocusTextField(context);
                //
                //               if (_formKey.currentState!.validate()) {
                //                 BlocProvider.of<ParentBloc>(context).add(
                //                   DeleteParentEvent(
                //                       parentsDataModel: parentDataModel,
                //                       enteredPassword:
                //                           deletePasswordController.text.trim()),
                //                 );
                //               }
                //             },
                //             btnText: ConstantStrings.profileDelete,
                //             margin: EdgeInsets.zero,
                //             color: deleteColor,
                //           )
                //         : const Center(
                //             child: CircularProgressIndicator(),
                //           );
                //   },
                // )
              ],
            ),
          ),
        );
      },
    );
  }
}
