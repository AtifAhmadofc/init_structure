import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Logic/Bloc/forget_password_bloc/forget_password_bloc.dart';
import '../../Logic/Helper/common_helper.dart';
import '../../utils/z_imports_utils.dart';
import 'custom_button.dart';

class ForgetPasswordBottomSheets {
  static final _formKey = GlobalKey<FormState>();

  static bottomSheet1(context, void Function()? onTap) {
    TextEditingController forgetPasswordController = TextEditingController();

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
                      color: ColorConstants.textFieldIconColor,
                      borderRadius: BorderRadius.circular(100)),
                ),
                Text(
                  ConstantStrings.logInForgotPassword,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: ColorConstants.headingColor2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, bottom: 30),
                  child: Text(
                    ConstantStrings.logInForgotPasswordDesc,
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
                        return "Please enter email";
                      }
                      return null;
                    },
                    controller: forgetPasswordController,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      label: Text(
                        ConstantStrings.logInEmail,
                        style: TextStyle(
                          color: ColorConstants.textFieldHintColor,
                          fontSize: 16,
                        ),
                      ),
                      border: Styles.textFieldBorderStyle2,
                      errorBorder: Styles.textFieldBorderStyle2,
                      enabledBorder: Styles.textFieldBorderStyle2,
                      focusedBorder: Styles.textFieldBorderStyle2,
                      focusedErrorBorder: Styles.textFieldBorderStyle2,
                    ),
                  ),
                ),
                BlocConsumer<ForgetPasswordBloc, ForgetPasswordState>(
                  listener: (context, state) {
                    if (state.isSuccessState) {
                      Navigator.pop(context);
                      bottomSheet2(context);
                    } else if (state.isFailedState) {
                      Navigator.pop(context);
                      forgetPasswordController.clear();
                      CommonHelper.showSnackBar(context, state.errorMessage);
                    }
                  },
                  builder: (context, state) {
                    return (state.isInitStateState || state.isSuccessState)
                        // && false
                        ? CustomButton(
                            onChanged: () {
                              CommonHelper.unFocusTextField(context);

                              if (_formKey.currentState!.validate()) {
                                BlocProvider.of<ForgetPasswordBloc>(context)
                                    .add(
                                  ForgetPasswordEvent(
                                    email: forgetPasswordController.text.trim(),
                                  ),
                                );
                              }
                            },
                            btnText: ConstantStrings.logInContinue,
                            margin: EdgeInsets.zero,
                          )
                        : const Center(
                            child: CircularProgressIndicator(),
                          );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static bottomSheet2(context) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.fromLTRB(35, 0, 35, 50),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
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
                  bottom: 40,
                ),
                height: 5,
                decoration: BoxDecoration(
                    color: ColorConstants.textFieldIconColor,
                    borderRadius: BorderRadius.circular(100)),
              ),
              Text(
                ConstantStrings.logInEmailSent,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: ColorConstants.headingColor2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0, bottom: 30),
                child: Text(
                  ConstantStrings.logInEmailSentDesc,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: ColorConstants.headingColor2,
                      height: 1.7),
                ),
              ),
              CustomButton(
                onChanged: () {
                  Navigator.pop(context);
                },
                btnText: ConstantStrings.logInClose,
                margin: const EdgeInsets.only(top: 30),
              )
            ],
          ),
        );
      },
    );
  }
}
