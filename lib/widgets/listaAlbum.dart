import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../Entity/album_entity.dart';
import '../Entity/song_entity.dart';

List<Widget> Sliders(List<Album> SongList) =>
    SongList.map((item) => Elementi(album: item)).toList();

class AlbumSlider extends StatelessWidget {
  const AlbumSlider({super.key, required this.lista});

  final Future<List<Album>> lista;

  @override
  Widget build(BuildContext context) => FutureBuilder(
        future: lista,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return CarouselSlider(
            options: CarouselOptions(
              height: 190.0,
              viewportFraction: 0.35,
              padEnds: false,
            ),
            items: Sliders(snapshot.data),
          );
        },
      );
}

class Elementi extends StatelessWidget {
  const Elementi({super.key, required this.album});

  final Album album;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: Colors.black,
          shadowColor: Colors.black,
          child: InkWell(
            splashColor: Colors.grey,
            onTap: () {
              print("non funza, I'm sowwy");
            },
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 165, 4, 5),
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  image: NetworkImage(album.image),
                ),
              ),
            ),
          ),
        ),
        Text(
          // ignore: prefer_interpolation_to_compose_strings
          "${album.name} ",
          style: const TextStyle(fontSize: 16.0, color: Colors.white),
        ),
      ],
    );
    ;
  }
}
