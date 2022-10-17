import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tododatabase/controller/dbHelper.dart';
import 'package:tododatabase/controller/homecontroller.dart';
import 'package:tododatabase/view/screen/insertScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController hmc = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    hmc.getData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Notes"),
          backgroundColor: Colors.orange.shade700,
          actions: [
            IconButton(
                onPressed: () {
                  Get.toNamed("/insert");
                },
                icon: Icon(Icons.add)),
          ],
        ),
        body: Obx(
          () => ListView.builder(
              itemCount: hmc.l1.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 3,
                  child: ListTile(
                    leading: Text("${hmc.l1[index]['id']}"),
                    title: Text("${hmc.l1[index]['note']}"),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
