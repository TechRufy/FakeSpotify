import 'dart:convert';

import 'package:flutter_application_1/Entity/interface_model.dart';
import 'package:flutter_application_1/Entity/song_entity.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:http/http.dart' as http;

class Album {
  String artista;
  List<dynamic> canzoni;
  String image;
  String name;
  int id;
  get getArtista => this.artista;

  set setArtista(artista) => this.artista = artista;

  get getCanzoni => this.canzoni;

  set setCanzoni(canzoni) => this.canzoni = canzoni;

  get getImage => this.image;

  get getName => this.name;

  set setName(name) => this.name = name;

  get getId => this.id;

  set setId(id) => this.id = id;

  Album(this.artista, this.canzoni, this.image, this.name, this.id);

  String get getimage {
    return this.image;
  }

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(json["artista"], json["canzoni"], json["image"], json["name"],
        json["id"]);
  }

  factory Album.fromMap(map) {
    return Album(
        map['artista'], map['canzoni'], map['image'], map['name'], map["id"]);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'canozni': canzoni,
      'artista': artista,
      "image": image,
    };
  }

  static Future<Album> fetchAlbumFromId(String id) async {
    var url = Uri.parse(
        "https://report-f28dd-default-rtdb.europe-west1.firebasedatabase.app/album/$id.json?");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.body);
      Album a = Album.fromJson(jsonDecode(response.body));
      final gsReference = FirebaseStorage.instance.refFromURL(a.image);
      await gsReference.getDownloadURL().then((value) => a.setImage(value));
      print(a.toString());
      return a;
    } else {
      throw Exception('Failed to load user');
    }
  }

  Future<String> getLink() async {
    final gsReference = FirebaseStorage.instance.refFromURL(image);
    return await gsReference.getDownloadURL();
  }

  setImage(String value) {
    this.image = value;
  }

  static Future<List<Album>> fetchAllAlbum() async {
    List<Album> lista = List.empty(growable: true);
    var url = Uri.parse(
        "https://report-f28dd-default-rtdb.europe-west1.firebasedatabase.app/album.json?");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      for (Map<String, dynamic> c in jsonDecode(response.body)) {
        Album s = Album.fromJson(c);
        final gsReference = FirebaseStorage.instance.refFromURL(s.image);
        await gsReference.getDownloadURL().then((value) => s.setImage(value));
        lista.add(s);
      }
      return lista;
    } else {
      throw Exception('Failed to load user');
    }
  }
}
