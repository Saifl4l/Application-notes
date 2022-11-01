
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data.dart';

class MYinputField extends StatelessWidget {
  const MYinputField({
    Key? key,
    required this.myconttroller,
  }) : super(key: key);

  final TextEditingController myconttroller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller:myconttroller,
      onChanged: (x){
        Note.typed.value= x;
      },
      style: const TextStyle(fontSize: 20),
      maxLines: 5,
      minLines: 1,
      textInputAction: TextInputAction.newline,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.black.withOpacity(0.07),
        hintText: 'Type note ...',
        prefixIcon: const Icon(Icons.note_add, color: Colors.grey),
        suffixIcon: TextButton(onPressed: (){
          Note.add(myconttroller.text);
          myconttroller.clear();
        },
            child: Obx(() {
              return Note.isloading.value ?
              SizedBox(width: 20,height: 20,
                  child: CircularProgressIndicator(color: Colors.blue,strokeWidth: 2,))

              :Icon(Icons.send,
                color: Note.typed.isEmpty?Colors.grey:Colors.blue,);
            }
            )),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1,
          ),
        ),
      ),
    );
  }
}