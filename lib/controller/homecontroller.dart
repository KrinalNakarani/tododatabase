import 'package:get/get.dart';
import 'package:tododatabase/controller/dbHelper.dart';

class HomeController extends GetxController {
  RxList l1 = [].obs;

  // void onInit() {
  //   getData();
  // }

  void getData() async {
    l1.value = await DBHelper.inte.readDB();
  }

}
