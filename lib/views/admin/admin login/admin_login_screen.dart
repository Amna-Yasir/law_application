import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:law_application/views/admin/admin%20login/login_controller.dart';

import 'package:provider/provider.dart';

import '../../../res/components/textfield and row/input_text_field.dart';
import '../../../res/components/roundbutton.dart';
import '../../../utils/routes/routesname.dart';

class admin_loginscreen extends StatefulWidget {
  const admin_loginscreen({super.key});

  @override
  State<admin_loginscreen> createState() => _admin_loginscreenState();
}

class _admin_loginscreenState extends State<admin_loginscreen> {
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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
            child: Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi, Welcome Back!👋',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    Text(
                      'Please login to your account',
                      style: Theme.of(context).textTheme.subtitle1,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 30,
                    ),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Email',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: Colors.grey),
                              ),
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
                              Text(
                                'Password',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: Colors.grey),
                              ),
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
                          style: Theme.of(context)
                              .textTheme
                              .headline2!
                              .copyWith(
                                  fontSize: 15,
                                  decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 3,
                    ),
                    ChangeNotifierProvider(
                      create: (_) => admin_loginController(),
                      child: Consumer<admin_loginController>(
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
                        Navigator.pushNamed(context, RouteName.adminsignupView);
                      },
                      child: Center(
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
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
