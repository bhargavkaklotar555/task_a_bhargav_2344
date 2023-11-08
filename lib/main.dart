import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:task_a_bhargav_2344/helper/Contact_Helper.dart';
import 'package:task_a_bhargav_2344/utils/Routes.dart';
import 'package:task_a_bhargav_2344/views/screens/DetailPage.dart';
import 'package:task_a_bhargav_2344/views/screens/HomePage.dart';
import 'package:task_a_bhargav_2344/views/screens/Splash_Screen.dart';
import 'package:task_a_bhargav_2344/views/screens/Add_contact_page.dart';
import 'package:task_a_bhargav_2344/views/screens/chek_internet_page.dart';

import 'controller/Contact_Controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DBHelper.dbHelper.init_DB();
  ContactsController contact_controller = Get.put(
    ContactsController(),
  );
  contact_controller.init();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Contact",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: MyRoutes.Splash_Screen,
      routes: {
        MyRoutes.HomePage: (context) => HomePage(),
        MyRoutes.Splash_Screen: (context) => const Splash_Screen(),
        MyRoutes.Add_Contact: (context) => Add_Contact(),
        MyRoutes.DetailPage: (context) => DetailPage(),
        MyRoutes.Check_Network_Page: (context) => Check_Network_Page(),
      },
    );
  }
}
