
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'list.dart';

class Bottons extends StatefulWidget {
  const Bottons({Key? key}) : super(key: key);

  @override
  State<Bottons> createState() => _BottonsState();
}

class _BottonsState extends State<Bottons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(onPressed: (){
          Cardlist.controller.animateToPage(0, duration:Duration(milliseconds: 300), curve:Curves.linear);
        },
            child: Obx( () {
                return Text("All Tasks",
                style: TextStyle(
                  color: Cardlist.currentpage==0?Colors.blue:Colors.grey,
                ),);
              }
            )),
        TextButton(onPressed: (){
          Cardlist.controller.animateToPage(1, duration:Duration(milliseconds: 300), curve:Curves.linear);
        },
            child: Obx(() {
                return Text("Done",style: TextStyle(
    color: Cardlist.currentpage==1?Colors.blue:Colors.grey,
    ),);
              }
            )),
      ],
    );
  }
}
