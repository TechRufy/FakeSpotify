import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Entity/album_entity.dart';
import 'package:flutter_application_1/Entity/song_entity.dart';
import 'package:flutter_application_1/widgets/listaAlbum.dart';
import 'package:flutter_application_1/widgets/listaSong.dart';

class PrimaRoute extends StatefulWidget {
  const PrimaRoute({Key? key}) : super(key: key);

  @override
  _ListSong createState() => _ListSong();
}

class _ListSong extends State<PrimaRoute> {
  Future<List<Song>>? listSong = Song.fetchAllSong();
  var c = Song.fetchAllSong();
  @override
  Widget build(BuildContext context) => FutureBuilder<List<Song>>(
        future: listSong,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              backgroundColor: Colors.black,
              appBar: AppBar(
                backgroundColor: Colors.black,
                actions: <Widget>[
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications_none,
                        color: Colors.white),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.watch_later_outlined,
                          color: Colors.white)),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.settings, color: Colors.white)),
                  IconButton(
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                      },
                      icon: const Icon(
                        Icons.logout_outlined,
                        color: Colors.white,
                      ))
                ],
                // Here we take the value from the MyHomePage object that was created by
                // the App.build method, and use it to set our appbar title.
                title: const Text(
                  "buonasera",
                ),
              ),
              body: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: "Garamond",
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          "Tutte le canzoni"),
                    ],
                  ),
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 190.0,
                      viewportFraction: 0.35,
                      padEnds: false,
                    ),
                    items: imageSliders(snapshot.data!),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: "Garamond",
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          "Tutti gli album"),
                    ],
                  ),
                  AlbumSlider(lista: Album.fetchAllAlbum()),
                ],
              ),
            );
          } else {
            return const Scaffold(
              backgroundColor: Colors.black,
            );
          }
        },
      );
}
