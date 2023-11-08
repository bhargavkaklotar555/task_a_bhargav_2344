import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/Contact_Controller.dart';

class Add_Contact extends StatelessWidget {
  Add_Contact({super.key});

  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();
  ContactsController contact_controller = Get.put(
    ContactsController(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Contact"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextFormField(
              controller: name,
              decoration: const InputDecoration(
                hintText: "Enter The Name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: number,
              maxLength: 10,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                hintText: "Enter Mobile Number",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {
                contact_controller.insert_contact(
                    name: name.text, number: number.text);
                log("*added!!");
                Navigator.of(context).pop();
              },
              child: Container(
                height: 50,
                width: 100,
                alignment: Alignment.center,
                child: Text(
                  "Add",
                  style: TextStyle(color: Colors.white),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
