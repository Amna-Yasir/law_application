import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class verifycode extends StatefulWidget {
  String verificaionid;
  verifycode({super.key, required this.verificaionid});

  @override
  State<verifycode> createState() => _verifycodeState();
}

class _verifycodeState extends State<verifycode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify Code'),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
