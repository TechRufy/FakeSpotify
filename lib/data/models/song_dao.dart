import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_application_1/Entity/song_entity.dart';

FirebaseFirestore database = FirebaseFirestore.instance;

class SongDAO {
  static Future<List<Song>> fetchAllSong() async {
    var ref = database.collection("Canzoni");

    List<Song> lista = List.empty(growable: true);

    var u = await ref.get().then((value) async {
      for (var c in value.docs) {
        Song ut = Song.fromJson(c.data());

        if (ut.link.startsWith("http") || ut.link.startsWith("gs://")) {
          final gsReference = FirebaseStorage.instance.refFromURL(ut.link);
          await gsReference.getDownloadURL().then((value) => ut.link = value);
        }

        lista.add(ut);
      }

      return lista;
    });

    return u;
  }
}
