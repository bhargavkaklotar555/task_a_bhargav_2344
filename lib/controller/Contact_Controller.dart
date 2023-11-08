import 'dart:developer';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:task_a_bhargav_2344/helper/Contact_Helper.dart';
import '../modals/Contact_Modal.dart';

class ContactsController extends GetxController {
  RxList<Contactmodal> allContacts = <Contactmodal>[].obs;

  // Contacts_Controller() {
  //   init();
  // }

  init() async {
    allContacts(await DBHelper.dbHelper.displayContacts());
    allContacts.value.forEach((element) {
      log("Data: ${element.id} => ${element.name}");
    });
  }

  // insert_contact({required String name, required String number}) {
  //   DBHelper.dbHelper.insert_contacts(name: name, number: number);
  //   log("inserted");
  // }

  Future<int> insert_contact(
      {required String name, required String number}) async {
    log("${name} or ${number}");
    return await DBHelper.dbHelper.insert_contacts(name: name, number: number);
  }

  Future<List<Contactmodal>> display_Contacts() async {
    allContacts(await DBHelper.dbHelper.displayContacts());
    log("getAllContacts - ${allContacts.toString()}");
    return allContacts;
  }
}
