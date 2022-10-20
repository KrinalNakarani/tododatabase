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
  TextEditingController note = TextEditingController();

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
          title: Text(
            "Notes",
            style: TextStyle(fontSize: 25),
          ),
          backgroundColor: Colors.orange.shade700,
          actions: [
            IconButton(
                onPressed: () {
                  Get.toNamed("/insert");
                },
                icon: Icon(Icons.add)),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Obx(
            () => ListView.builder(
                itemCount: hmc.l1.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      note = TextEditingController(text: hmc.l1[index]['note']);
                      update(hmc.l1[index]['id']);
                    },
                    child: Card(
                      elevation: 3,
                      child: Container(
                        color: Colors.yellow.shade50,
                        child: ListTile(
                          leading: Text("${hmc.l1[index]['id']}"),
                          title: Text("${hmc.l1[index]['note']}"),
                          trailing: IconButton(
                              onPressed: () {
                                DBHelper.inte.deleteDB(hmc.l1[index]['id']);
                                hmc.getData();
                              },
                              icon: Icon(Icons.delete)),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }

  void update(int id) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actions: [
              Card(
                elevation: 2,
                child: TextField(
                  controller: note,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "     Note..",
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  DBHelper.inte.updateDB(note.text, id);
                  hmc.getData();
                },
                child: Text("edit"),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange.shade700),
              ),
            ],
          );
        });
  }
}
