import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../res/components/textfield and row/input_text_field.dart';
import '../../../res/components/roundbutton.dart';
import 'forgotpasswordController.dart';

class forgotscreen extends StatefulWidget {
  const forgotscreen({super.key});

  @override
  State<forgotscreen> createState() => _forgotscreenState();
}

class _forgotscreenState extends State<forgotscreen> {
  final _formKey = GlobalKey<FormState>();

  final emailcontroller = TextEditingController();

  final emailfocusnode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailcontroller.dispose();

    emailfocusnode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * .01;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          'Recover Password',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  // Text(
                  //   'Login',
                  //   style: Theme.of(context).textTheme.headline3,
                  // ),
                  Lottie.asset('assets/password.json',
                      width: 200, height: 200, repeat: true),

                  Text(
                    'Enter your email address\nTo recover your password',
                    style: Theme.of(context).textTheme.subtitle1,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
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
                          ],
                        ),
                      )),
                  SizedBox(
                    height: 10,
                  ),

                  SizedBox(
                    height: height * 3,
                  ),
                  ChangeNotifierProvider(
                    create: (_) => forgotpassword(),
                    child: Consumer<forgotpassword>(
                      builder: (context, provider, child) {
                        return Center(
                            child: roundButton(
                          title: 'Recover',
                          onpress: () {
                            if (_formKey.currentState!.validate()) {
                              provider.forgotPassword(
                                  emailcontroller.text, context);
                            }
                          },
                          loading: provider.loading,
                        ));
                      },
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
