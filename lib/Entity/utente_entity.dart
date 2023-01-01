import 'dart:convert';

import 'package:flutter_application_1/Entity/interface_model.dart';
import 'package:http/http.dart' as http;

class Utente implements InterfaceModel {
  int id;
  String name;
  String surname;
  int age;
  int phone;

  Utente(this.name, this.surname, this.age, this.phone, this.id);

  factory Utente.fromJson(Map<String, dynamic> json) {
    return Utente(
        json["name"], json["surname"], json["age"], json["phone"], json["id"]);
  }

  factory Utente.fromMap(map) {
    return Utente(
        map['name'], map['surname'], map['phone'], map['age'], map["id"]);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'surname': surname,
      'age': age,
      "phone": phone
    };
  }

  static Future<InterfaceModel> fetchUser(String id) async {
    var url = Uri.parse(
        "https://report-f28dd-default-rtdb.europe-west1.firebasedatabase.app/users/$id.json?");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      Utente user = Utente.fromJson(jsonDecode(response.body));
      return user;
    } else {
      throw Exception('Failed to load user');
    }
  }

  @override
  getAge() {
    return age;
  }

  @override
  getFirstName() {
    return name;
  }

  @override
  getId() {
    return id;
  }

  @override
  getPhoneNumber() {
    return phone;
  }

  @override
  getSurnameName() {
    return surname;
  }

  @override
  getArtista() {
    // TODO: implement getArtista
    throw UnimplementedError();
  }

  @override
  getLink() {
    // TODO: implement getLink
    throw UnimplementedError();
  }

  @override
  getNomeS() {
    // TODO: implement getNomeS
    throw UnimplementedError();
  }
}
