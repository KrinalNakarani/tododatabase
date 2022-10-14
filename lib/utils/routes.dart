import 'package:get/get.dart';
import 'package:tododatabase/view/screen/insertScreen.dart';
import '../view/screen/homescreen.dart';

List<GetPage> getpage = [
  GetPage(name: '/', page: ()=>HomeScreen()),
  GetPage(name: '/insert', page: ()=>InsertScreen()),


];
