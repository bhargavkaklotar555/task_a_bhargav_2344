import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:task_a_bhargav_2344/controller/Contact_Controller.dart';
import 'package:task_a_bhargav_2344/helper/Contact_Helper.dart';
import 'package:task_a_bhargav_2344/utils/Routes.dart';

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
        title: const Text("Contacts"),
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
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              MyRoutes.DetailPage,
                              arguments: index,
                            );
                          },
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
                            backgroundColor:
                                Colors.primaries[index % 18].shade200,
                            child: Text(
                              "${contact_controller.allContacts[index].name?.substring(0, 1).toUpperCase()}",
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w400),
                            ),
                          ),
                          trailing: FloatingActionButton.small(
                            shape: CircleBorder(),
                            onPressed: () {
                              FlutterPhoneDirectCaller.callNumber(
                                  "${contact_controller.allContacts[index].number}");
                            },
                            child: Icon(
                              Icons.call,
                              color: Colors.white,
                            ),
                            backgroundColor: Colors.green,
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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(MyRoutes.Add_Contact);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
