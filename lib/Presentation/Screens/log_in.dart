import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:init_structure/Logic/Bloc/signup_login_bloc/signup_login_bloc.dart';

import '../../Logic/Helper/common_helper.dart';
import '../../utils/z_imports_utils.dart';
import '../Widgets/custom_button.dart';
import '../Widgets/custom_drop_down_widget.dart';
import '../Widgets/custom_text_form_field.dart';
import '../Widgets/forget_password_bottom_sheet.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController forgetPasswordController = TextEditingController();

  bool obscureText = true;
  final _formKey = GlobalKey<FormState>();
  List<DropdownMenuItem<dynamic>> institutesList =
      <DropdownMenuItem<dynamic>>[
        const DropdownMenuItem(value: "a",child: Text("a"),),
        const DropdownMenuItem(value: "b",child: Text("b"),),
        const DropdownMenuItem(value: "c",child: Text("c"),),
      ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.fromLTRB(
            35,
            MediaQuery.of(context).padding.top + 30,
            35,
            44,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 40.0),
                  child: Text(
                    ConstantStrings.logInTitle,
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: ColorConstants.headingColor1,
                    ),
                  ),
                ),
                CustomDropDownWidget(
                  dropdownList: institutesList,
                  icon: "assets/icons/institute-icon.png",
                  hintString: ConstantStrings.logInSelectInstitute,
                  onChanged: (val) {

                  },
                  validator: (val) {
                    if (val == null) {
                      return "Please select an institute first";
                    }
                    return null;
                  },
                ),
                CustomTextFormField(
                  controller: emailController,
                  icon: "assets/icons/Iconly-Curved-Message.png",
                  hintString: ConstantStrings.logInEmailId,
                  validator: (val) {
                    bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(val.toString());
                    if (!emailValid) {
                      return "Please enter a valid email";
                    }
                    return null;
                  },
                ),
                CustomTextFormField(
                  controller: passwordController,
                  icon: "assets/icons/Iconly-Curved-Lock.png",
                  hintString: ConstantStrings.logInPassword,
                  obscureText: obscureText,
                  validator: (val) {
                    if (val!.length < 4) {
                      return "Please enter a valid password";
                    }
                    return null;
                  },
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    child: Icon(
                      Icons.remove_red_eye,
                      size: 16,
                      color:  ColorConstants.textFieldHintColor,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      ForgetPasswordBottomSheets.bottomSheet1(
                        context,
                        () {},
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Text(
                        ConstantStrings.logInForgotPassword,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color:  ColorConstants.headingColor2,
                        ),
                      ),
                    ),
                  ),
                ),
                BlocConsumer<SignUpLogInBloc, SignUpLogInState>(
                  listener: (context, state) {
                    if (state.isSuccessState) {
                      // Navigator.pushNamedAndRemoveUntil(context, "/HomeScreen",(Route<dynamic> route) => false);
                    } else if (state.isFailedState) {
                      CommonHelper.showSnackBar(
                          context, state.errorMessage);
                    }
                  },
                  builder: (context, state) {
                    return (state.isInitStateState || state.isSuccessState)
                        ? CustomButton(
                            onChanged: () {
                              CommonHelper.unFocusTextField(context);

                              if (_formKey.currentState!.validate()) {
                                BlocProvider.of<SignUpLogInBloc>(context).add(
                                  LogInEvent(
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim(),
                                    instituteId: "",
                                  ),
                                );
                              }

                            },
                            btnText: ConstantStrings.logInTitle,
                          )
                        : Padding(
                            padding: const EdgeInsets.only(top: 40.0),
                            child: Center(
                                child: CircularProgressIndicator(
                              color:  ColorConstants.themeColor1,
                            )),
                          );
                  },
                ),
                const Spacer(),
                Center(
                  child: RichText(
                    text: TextSpan(
                        text: "${ConstantStrings.logInNotHaveAccount} ",
                        style: TextStyle(
                          color:  ColorConstants.textColor1,
                          fontSize: 16,
                        ),
                        children: [
                          WidgetSpan(
                            child: InkWell(
                              child: Text(
                                ConstantStrings.logInSignUp,
                                style: TextStyle(
                                    color:  ColorConstants.textColor1,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              onTap: () {
                                // Navigator.popAndPushNamed(context, "/SignUp");
                              },
                            ),
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
