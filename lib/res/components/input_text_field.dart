import 'package:flutter/material.dart';
import 'package:law_application/res/colors.dart';

class Inputextfield extends StatelessWidget {
  Inputextfield({
    super.key,
    required this.mycontoller,
    required this.focusnode,
    required this.onFilledSubmittedvalue,
    required this.onValidator,
    required this.keyboardtype,
    required this.hint,
    required this.obsecuretext,
    this.autofocus = false,
    this.enable = true,
    this.suffixicon,
  });
  final TextEditingController mycontoller;
  final FocusNode focusnode;
  final FormFieldSetter onFilledSubmittedvalue;
  final FormFieldValidator onValidator;
  final TextInputType keyboardtype;
  final String hint;
  final bool obsecuretext;
  final bool enable, autofocus;
  final Widget? suffixicon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: TextFormField(
          controller: mycontoller,
          focusNode: focusnode,
          obscureText: obsecuretext,
          onFieldSubmitted: onFilledSubmittedvalue,
          validator: onValidator,
          keyboardType: keyboardtype,
          style: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(fontSize: 19, height: 0),
          decoration: InputDecoration(
              suffixIcon: suffixicon,
              contentPadding: EdgeInsets.all(15),
              hintText: hint,
              hintStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                  height: 0,
                  color: AppColors.primaryTextTextColor.withOpacity(0.4)),
              border: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColors.textFieldDefaultFocus),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.secondaryColor),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.alertColor),
                  borderRadius: BorderRadius.all(Radius.circular(10))))),
    );
  }
}
