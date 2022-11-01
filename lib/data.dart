import 'package:get/get.dart';
import 'dart:math';

import 'package:flutter/material.dart';

class Note{
  final RxString text;
  final RxString title;
  final Rx<Color> color;
  static RxString typed="".obs;
  final RxBool isDone;
  static final RxBool isloading=false.obs;
  final DateTime createdAt;




  Note(String data, this.createdAt, [bool? isDone])
      : isDone = (isDone??false).obs,
        title ="Note ${notes.length+1}".obs,
        color = Colors.accents.elementAt(Random().nextInt(Colors.accents.length)).shade100.obs,
        text =data.obs;

  static RxList<Note> notes=<Note>[].obs;

  makeAsDone(){
    isDone.value = true;
  }

  static add(String note)async{
    isloading.value=true;
    Note data=Note(note,DateTime.now());
    bool isSuccess = await data.sendReguest();
    if(isSuccess){
      notes.add(data);
    }else{
      Get.showSnackbar(GetSnackBar(title: "error",message: "Not saved",duration: Duration(seconds: 2),));
    }

    isloading.value=false;
  }

  Future<bool> sendReguest() async {
    await Future.delayed(Duration(seconds: 2));
    if(typed.value.length <5) return false;
    return true;
  }


    static clear(){
      notes.clear();
    }

}