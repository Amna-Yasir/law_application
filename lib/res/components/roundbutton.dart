import 'package:flutter/material.dart';

import '../colors.dart';

class roundButton extends StatelessWidget {
  final String title;
  final VoidCallback onpress;
  final Color color, textcolor;
  final bool loading;
  roundButton(
      {super.key,
      required this.title,
      required this.onpress,
      this.color = AppColors.primaryColor,
      this.textcolor = AppColors.whiteColor,
      this.loading = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: loading ? null : onpress,
      child: Container(
        height: 50,
        width: 200,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(50)),
        child: Center(
          child: loading
              ? CircularProgressIndicator(
                  color: Colors.white,
                )
              : Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(fontSize: 16, color: textcolor),
                ),
        ),
      ),
    );
  }
}
