import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_plugin_openwhatsapp/flutter_plugin_openwhatsapp.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controller/Contact_Controller.dart';
import '../../helper/Contact_Helper.dart';

class DetailPage extends StatelessWidget {
  DetailPage({super.key});

  ContactsController contact_controller = Get.put(
    ContactsController(),
  );

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("${contact_controller.allContacts[index].name}"),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
            onPressed: () {
              DBHelper.dbHelper.removeContact(
                cid: int.parse(
                    "${contact_controller.allContacts.value[index].id}"),
              );
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.delete),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: s.height * 0.03,
            ),
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.primaries[index % 18].shade200,
              child: Text(
                "${contact_controller.allContacts[index].name?.substring(0, 1).toUpperCase()}",
                style:
                    const TextStyle(fontSize: 50, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: s.height * 0.01,
            ),
            Text(
              "${contact_controller.allContacts[index].name}",
              style: const TextStyle(fontSize: 34),
            ),
            SizedBox(
              height: s.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "+91 ${contact_controller.allContacts[index].number}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                FloatingActionButton.small(
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
              ],
            ),
            SizedBox(
              height: s.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Message",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                FloatingActionButton.small(
                  shape: CircleBorder(),
                  onPressed: () async {
                    Uri sms = Uri(
                      scheme: 'sms',
                      path: contact_controller.allContacts[index].number,
                    );

                    await launchUrl(sms);
                  },
                  child: Icon(
                    Icons.message,
                    color: Colors.white,
                  ),
                  backgroundColor: Colors.blue,
                ),
              ],
            ),
            SizedBox(
              height: s.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "WhatsApp",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                FloatingActionButton.small(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onPressed: () async {
                    final flutterPlugin = FlutterPluginOpenwhatsapp();
                    flutterPlugin.openWhatsApp(
                      phoneNumber: contact_controller.allContacts[index].number,
                      text: 'Hi, this is a test message!',
                    );
                  },
                  child: FaIcon(
                    FontAwesomeIcons.whatsapp,
                    color: Colors.white,
                  ),
                  backgroundColor: Colors.green,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
