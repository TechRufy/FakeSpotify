import 'dart:convert';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart' as http;

class Song {
  int? id;
  String name;
  String link;
  String artista;
  int album;
  String genere;

  Song(this.name, this.link, this.artista, this.album, this.genere);

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(json["Nome"], json["Link"], json["Artista"], json["Album"],
        json["Genere"]);
  }

  factory Song.fromMap(map) {
    return Song(
        map['name'], map['link'], map['artista'], map["album"], map["Genere"]);
  }

  Map<String, dynamic> toMap() {
    return {
      'Nome': name,
      'Link': link,
      'Artista': artista,
      "Album": album,
      "Genere": genere,
    };
  }

  setLink(String value) {
    this.link = value;
  }
}
