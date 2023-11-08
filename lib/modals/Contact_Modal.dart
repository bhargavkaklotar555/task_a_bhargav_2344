import 'dart:developer';

class Contactmodal {
  int? id;
  String? name;
  String? number;

  Contactmodal(
    this.id,
    this.name,
    this.number,
  );

  Contactmodal.init() {
    log("name Modal Initialized...");
  }

  factory Contactmodal.fromMap({required Map data}) {
    return Contactmodal(
      data['id'],
      data['name'],
      data['number'],
    );
  }
}
