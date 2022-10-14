import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tododatabase/controller/dbHelper.dart';

import '../../controller/homecontroller.dart';

class InsertScreen extends StatefulWidget {
  const InsertScreen({Key? key}) : super(key: key);

  @override
  State<InsertScreen> createState() => _InsertScreenState();
}

class _InsertScreenState extends State<InsertScreen> {
  HomeController hmc = Get.put(HomeController());
  TextEditingController note = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: note,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Note..",
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () {
                    DBHelper.inte.insertDB(note.text);
                  },
                  child: Text("Add"),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.orange.shade700),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}