import 'dart:convert';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_application_1/Entity/interface_model.dart';
import 'package:http/http.dart' as http;

class Song implements InterfaceModel {
  int id;
  String name;
  String link;
  String artista;
  int album;

  Song(this.id, this.name, this.link, this.artista, this.album);

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
        json["id"], json["name"], json["link"], json["artista"], json["album"]);
  }

  factory Song.fromMap(map) {
    return Song(
        map['id'], map['name'], map['link'], map['artista'], map["album"]);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'link': link,
      'artista': artista,
      "album": album,
    };
  }

  static Future<List<Song>> fetchAllSong() async {
    List<Song> lista = List.empty(growable: true);
    var url = Uri.parse(
        "https://report-f28dd-default-rtdb.europe-west1.firebasedatabase.app/songs.json?");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      for (Map<String, dynamic> c in jsonDecode(response.body)) {
        Song s = Song.fromJson(c);
        final gsReference = FirebaseStorage.instance.refFromURL(s.link);
        await gsReference.getDownloadURL().then((value) => s.setLink(value));
        lista.add(s);
      }
      return lista;
    } else {
      throw Exception('Failed to load user');
    }
  }

  @override
  getAge() {
    // TODO: implement getAge
    throw UnimplementedError();
  }

  @override
  getArtista() {
    // TODO: implement getArtista
    throw UnimplementedError();
  }

  @override
  getFirstName() {
    // TODO: implement getFirstName
    throw UnimplementedError();
  }

  @override
  getId() {
    // TODO: implement getId
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

  @override
  getPhoneNumber() {
    // TODO: implement getPhoneNumber
    throw UnimplementedError();
  }

  @override
  getSurnameName() {
    // TODO: implement getSurnameName
    throw UnimplementedError();
  }

  setLink(String value) {
    this.link = value;
  }
}
