import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tododatabase/utils/routes.dart';
void main(){
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false ,
      getPages: getpage,
    ),
  );
}