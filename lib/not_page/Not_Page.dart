
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:textflutter/data.dart';
import 'package:get/get.dart';
class NotPages extends StatefulWidget {
  const NotPages({Key? key, required this.note}) : super(key: key);
  final Note note;

  @override
  State<NotPages> createState() => _NotPagesState();
}

class _NotPagesState extends State<NotPages> {
  final TextEditingController title=TextEditingController();
  final TextEditingController body=TextEditingController();

  @override
  void initState() {
    title.text=widget.note.title.value;
    body.text=widget.note.text.value;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // elevation: 1,
        title: Text("Note",style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
        ),
        automaticallyImplyLeading: false,
        actions: [TextButton(onPressed: (){
          widget.note.title.value=title.text;
          widget.note.text.value=body.text;
          Get.back();
        }, child: Text("save"))],
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              controller: title,
              decoration: InputDecoration(
                hintText: "title"
              ),
            ),
            TextField(
              controller: body,
              maxLines: 10,
              decoration: InputDecoration(
                  hintText: "Type some thing",
                border: OutlineInputBorder(
                  borderSide: BorderSide.none
                ),
                focusedBorder:OutlineInputBorder(
                    borderSide: BorderSide.none
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none
                ),
              ),
            ),
          ],
        )
      )
    );
  }
}
