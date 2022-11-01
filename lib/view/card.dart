
import 'package:flutter/material.dart';
import 'package:textflutter/data.dart';
import 'package:textflutter/not_page/Not_Page.dart';
import 'package:get/get.dart';
class Mycard extends StatelessWidget {
  const Mycard({
    Key? key, required this.note,
  }) : super(key: key);
  final Note note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(NotPages(note: note,));
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 10,right: 5,left: 5),
        padding: EdgeInsets.only(top: 10,bottom: 20,left: 20),
        decoration: BoxDecoration(
            color: note.color.value,
            borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() {
                    return Text(
                        note.title.value,style: TextStyle(
                        fontSize: 18,
                        color: Colors.black.withOpacity(0.8),
                        fontWeight: FontWeight.bold));
                  }
                ),
                TextButton(onPressed: (){
                  note.makeAsDone();
                }, child: Icon(Icons.check,color: Colors.black,))
              ],
            ),
            const SizedBox(height: 5),
            Obx(() {
                return Text(
                  note.text.value,
                  style: const TextStyle(
                      fontSize: 16, color: Colors.black54),
                );
              }
            )
          ],
        ),
      ),
    );
  }
}