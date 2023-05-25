import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:law_application/res/colors.dart';
import 'package:law_application/views/Lawyer/lawyer%20Login/lawyerlogin_controller.dart';
import 'package:law_application/views/client/login/login_controller.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../res/components/input_text_field.dart';
import '../../../res/components/roundbutton.dart';
import '../../../utils/routes/routesname.dart';

class lawyerloginscreen extends StatefulWidget {
  const lawyerloginscreen({super.key});

  @override
  State<lawyerloginscreen> createState() => _lawyerloginscreenState();
}

class _lawyerloginscreenState extends State<lawyerloginscreen> {
  final _formKey = GlobalKey<FormState>();

  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final otpcontroller = TextEditingController();

  final emailfocusnode = FocusNode();
  final passwordfocusnode = FocusNode();
  final otpfocusnode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
    emailfocusnode.dispose();
    passwordfocusnode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * .01;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Login'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Text(
                  //   'Login',
                  //   style: Theme.of(context).textTheme.headline3,
                  // ),
                  Lottie.asset('assets/login.json',
                      width: 200, height: 150, repeat: true),

                  // Text(
                  //   'Enter your credentials\nTo connect to your account',
                  //   style: Theme.of(context).textTheme.subtitle1,
                  //   textAlign: TextAlign.center,
                  // ),
                  SizedBox(
                    height: 5,
                  ),
                  Form(
                      key: _formKey,
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: height * .06, bottom: height * 0.01),
                        child: Column(
                          children: [
                            Inputextfield(
                                mycontoller: emailcontroller,
                                focusnode: emailfocusnode,
                                onFilledSubmittedvalue: (value) {},
                                onValidator: (value) {
                                  return value.isEmpty ? 'Enter Email' : null;
                                },
                                keyboardtype: TextInputType.emailAddress,
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
                                keyboardtype: TextInputType.emailAddress,
                                hint: 'Password',
                                obsecuretext: false),
                          ],
                        ),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: (() {
                        Navigator.pushNamed(context, RouteName.forgotscreen);
                      }),
                      child: Text(
                        'Forgot Password',
                        style: Theme.of(context).textTheme.headline2!.copyWith(
                            fontSize: 15, decoration: TextDecoration.underline),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 3,
                  ),
                  ChangeNotifierProvider(
                    create: (_) => lawyerloginController(),
                    child: Consumer<lawyerloginController>(
                      builder: (context, provider, child) {
                        return Center(
                            child: roundButton(
                          title: 'Login',
                          onpress: () {
                            if (_formKey.currentState!.validate()) {
                              provider.login(context, emailcontroller.text,
                                  passwordcontroller.text);
                            }
                            ;
                          },
                          loading: provider.loading,
                        ));
                      },
                    ),
                  ),
                  SizedBox(
                    height: height * 1,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RouteName.lawyersignupView);
                    },
                    child: Text.rich(
                      TextSpan(
                          text: "Don't have any account? ",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(fontSize: 15),
                          children: [
                            TextSpan(
                              text: 'Signup',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(
                                      fontSize: 15,
                                      decoration: TextDecoration.underline),
                            )
                          ]),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                          context, RouteName.LoginWithPhoneNumber);
                    },
                    child: Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border:
                              Border.all(color: AppColors.primarybuttonColor)),
                      child: Center(child: Text('Login with phone')),
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
