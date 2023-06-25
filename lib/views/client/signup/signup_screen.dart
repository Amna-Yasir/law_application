// ignore_for_file: prefer_const_constructors, unused_field, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:law_application/res/colors.dart';
import 'package:law_application/views/client/signup/signup_controller.dart';
import 'package:lottie/lottie.dart';
import '../../../res/components/roundbutton.dart';
import '../../../utils/utils.dart';

import '../../../res/components/textfield and row/input_text_field.dart';
import '../../../utils/routes/routesname.dart';
import 'package:provider/provider.dart';

class signUpScreen extends StatefulWidget {
  const signUpScreen({super.key});

  @override
  State<signUpScreen> createState() => _signUpScreenState();
}

class _signUpScreenState extends State<signUpScreen> {
  String userType = 'Client';
  List<String> userTypeList = ['Client', 'lawyer'];
  final _auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();

  final Emailaddresscontroller = TextEditingController();
  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final rolecontroller = TextEditingController();

  final emailfocusnode = FocusNode();
  final passwordfocusnode = FocusNode();
  final usernamefocusnode = FocusNode();
  final rolefocusnode = FocusNode();

  void dispose() {
    super.dispose();
    Emailaddresscontroller.dispose();
    usernamecontroller.dispose();
    passwordcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * .01;
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: ChangeNotifierProvider(
              create: (_) => signupController(),
              child: Consumer<signupController>(
                builder: (context, provider, child) {
                  var center = TextAlign.center;
                  return SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Lottie.asset('assets/signup.json',
                              width: 200, height: 150, repeat: true),
                          // Text(
                          //   'Welcome To The App',
                          //   style: Theme.of(context).textTheme.headline3,
                          // ),
                          SizedBox(
                            height: height * .01,
                          ),
                          // Text(
                          //   'Enter your credentials\nTo connect to your account',
                          //   style: Theme.of(context).textTheme.subtitle1,
                          //   textAlign: center,
                          // ),
                          SizedBox(
                            height: height * 5,
                          ),
                          Form(
                              key: _formKey,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: height * .06, bottom: height * 0.01),
                                child: Column(
                                  children: [
                                    Inputextfield(
                                        mycontoller: usernamecontroller,
                                        focusnode: usernamefocusnode,
                                        onFilledSubmittedvalue: (value) {},
                                        onValidator: (value) {
                                          return value.isEmpty
                                              ? 'Enter Username'
                                              : null;
                                        },
                                        keyboardtype: TextInputType.text,
                                        hint: 'Username',
                                        obsecuretext: false),
                                    Inputextfield(
                                        mycontoller: Emailaddresscontroller,
                                        focusnode: emailfocusnode,
                                        onFilledSubmittedvalue: (value) {
                                          utils.fieldfocus(
                                              context,
                                              emailfocusnode,
                                              passwordfocusnode);
                                        },
                                        onValidator: (value) {
                                          return value.isEmpty
                                              ? 'Enter Email'
                                              : null;
                                        },
                                        keyboardtype:
                                            TextInputType.emailAddress,
                                        hint: 'Email',
                                        obsecuretext: false),
                                    Inputextfield(
                                        mycontoller: passwordcontroller,
                                        focusnode: passwordfocusnode,
                                        onFilledSubmittedvalue: (value) {},
                                        onValidator: (value) {
                                          return value.isEmpty
                                              ? 'Enter Password'
                                              : null;
                                        },
                                        keyboardtype: TextInputType.text,
                                        hint: 'Password',
                                        obsecuretext: true),
                                    DropdownButtonFormField(
                                        validator: (value) {
                                          return value!.isEmpty
                                              ? 'Select your role'
                                              : null;
                                        },
                                        value: userType,
                                        items: userTypeList
                                            .map((e) => DropdownMenuItem(
                                                  child: Text(e),
                                                  value: e,
                                                ))
                                            .toList(),
                                        icon: Icon(
                                          Icons.arrow_drop_down_circle,
                                          color: AppColors.primaryIconColor,
                                        ),
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: AppColors
                                                        .textFieldDefaultFocus),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: AppColors
                                                        .secondaryColor),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                            errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color:
                                                        AppColors.alertColor),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                            labelText: 'Role'),
                                        onChanged: ((value) {
                                          userType = value.toString();
                                        })),
                                  ],
                                ),
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: height * 3,
                          ),
                          Center(
                              child: roundButton(
                            title: 'SignUp',
                            onpress: () async {
                              if (_formKey.currentState!.validate()) {
                                provider.signUp(
                                    context,
                                    usernamecontroller.text,
                                    Emailaddresscontroller.text.trim(),
                                    passwordcontroller.text,
                                    userType);
                              }
                              ;
                            },
                            loading: provider.loading,
                          )),
                          SizedBox(
                            height: height * 1,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, RouteName.loginView);
                            },
                            child: Text.rich(
                              TextSpan(
                                  text: "Already any account? ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(fontSize: 15),
                                  children: [
                                    TextSpan(
                                      text: 'Login',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2!
                                          .copyWith(
                                              fontSize: 15,
                                              decoration:
                                                  TextDecoration.underline),
                                    )
                                  ]),
                            ),
                          )
                        ]),
                  );
                },
              ),
            )),
      ),
    );
  }
}
