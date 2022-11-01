
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:textflutter/view/text_field.dart';
import '../data.dart';
import '../main.dart';
import 'Buttons.dart';
import 'list.dart';

class Myhome extends StatelessWidget {
  const Myhome({
    Key? key,
    required this.myconttroller,
  }) : super(key: key);

  final TextEditingController myconttroller;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      MYinputField(myconttroller: myconttroller),
      Bottons(),
      Expanded(
          child: Cardlist()),
    ],);
  }
}

