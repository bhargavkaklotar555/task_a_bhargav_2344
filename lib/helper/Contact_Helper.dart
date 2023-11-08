import 'dart:developer';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../modals/Contact_Modal.dart';

class DBHelper {
  DBHelper._();

  static final DBHelper dbHelper = DBHelper._();

  late Database database;

  String contactsTable = "Contacts3";

  String C_id = "id";
  String C_name = "name";
  String C_number = "number";

  init_DB() async {
    String dbPath = await getDatabasesPath();
    String dbName = "contact3.db";

    String finalPath = join(dbPath, dbName);

    database = await openDatabase(
      finalPath,
      version: 1,
      onCreate: (db, version) {
        db
            .execute(
                'CREATE TABLE $contactsTable($C_id INTEGER PRIMARY KEY AUTOINCREMENT , $C_name TEXT , $C_number TEXT)')
            .then(
              (value) => log("contact Table are Created : DONE "),
            );
      },
    );
  }

  insert_contacts({required String name, required String number}) async {
    String query = "INSERT INTO $contactsTable(name,number) VALUES(?,?)";

    List args = [name, number];

    int contact = await database.rawInsert(query, args);

    return contact;
  }

  displayContacts() async {
    String query = "SELECT * FROM $contactsTable";

    List contacts = await database.rawQuery(query);
    log(contacts.toString());

    List<Contactmodal> allcontacts =
        contacts.map((e) => Contactmodal.fromMap(data: e)).toList();

    return allcontacts;
  }

  Future<int> removeContact({required int cid}) async {
    String sql = "DELETE FROM $contactsTable WHERE id = $cid";
    return database.rawDelete(sql);
  }
}
