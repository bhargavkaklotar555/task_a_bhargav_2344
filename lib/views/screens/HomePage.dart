import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:task_a_bhargav_2344/controller/Contact_Controller.dart';
import 'package:task_a_bhargav_2344/helper/Contact_Helper.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // ContactsController contact_controller = Get.find();
  ContactsController contact_controller = Get.put(
    ContactsController(),
  );

  @override
  Widget build(BuildContext context) {
    contact_controller.init();
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Obx(
          () {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: contact_controller.allContacts.value.length,
                    itemBuilder: (context, index) {
                      log("----------------");
                      log("${contact_controller.allContacts.value[index].name}");
                      return Card(
                        child: ListTile(
                          title: Text(
                            contact_controller.allContacts.value[index].name
                                .toString(),
                          ),
                          subtitle: Text(
                            contact_controller.allContacts.value[index].number
                                .toString(),
                          ),
                          leading: CircleAvatar(
                            radius: 22,
                            child: Text(
                                "${contact_controller.allContacts.value[index].id}"),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              DBHelper.dbHelper.removeContact(
                                cid: int.parse(
                                    "${contact_controller.allContacts.value[index].id}"),
                              );
                            },
                            icon: Icon(Icons.delete),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          contact_controller.insert_contact(name: "ved", number: "989654321");
          log("added!!");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
