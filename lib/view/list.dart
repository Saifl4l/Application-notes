
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data.dart';
import 'card.dart';


class Cardlist extends StatelessWidget {
  const Cardlist({
    Key? key,}) : super(key: key);
  static PageController controller=PageController();
  static RxInt currentpage=0.obs;
  @override
  Widget build(BuildContext context) {
    return Obx((){
      return PageView(
        onPageChanged:(x){
          currentpage.value=x;
        } ,
        controller: controller,
        children: [
          AnimatedSwitcher(duration: Duration(seconds:2),
            child:Note.notes.isNotEmpty? ListView(
              controller: ScrollController(),
              children:Note.notes.where((e) =>!e.isDone.value ).map((e) =>Mycard(note: e,)).toList(),
            )
                :Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.note_add,color: Colors.grey.withOpacity(0.1),size: 110,),
                Text(" add first note",style: TextStyle(fontSize: 20,color: Colors.grey.withOpacity(0.9)),)
              ],
            ),
          ),


          ListView(
            controller: ScrollController(),
            children:Note.notes.where((e) => e.isDone.value).map((e) =>Mycard(note: e,)).toList(),
          ),
        ],
      );
    }
    );
  }
}