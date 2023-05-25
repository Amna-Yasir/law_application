import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class reusableRow extends StatelessWidget {
  final String title, value;
  final IconData leadingicon;
  const reusableRow(
      {super.key,
      required this.leadingicon,
      required this.value,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          tileColor: Colors.white,
          title: Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          leading: Icon(leadingicon),
          trailing: Text(
            value,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}
