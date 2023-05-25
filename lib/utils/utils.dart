import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../res/colors.dart';

class utils {
  static void fieldfocus(
      BuildContext context, FocusNode currentfocus, FocusNode nextFocus) {
    currentfocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastmessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        fontSize: 15,
        backgroundColor: AppColors.primaryColor,
        textColor: AppColors.whiteColor);
  }
}
