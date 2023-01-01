import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

import '../Entity/album_entity.dart';
import '../Entity/song_entity.dart';

List<Widget> imageSliders(List<Song> SongList) =>
    SongList.map((item) => AlbumData(data: item)).toList();

class AlbumData extends StatefulWidget {
  const AlbumData({super.key, required this.data});

  final Song data;

  @override
  _AlbumData createState() => _AlbumData();
}

class _AlbumData extends State<AlbumData> {
  late Future<Album> _album;

  @override
  void initState() {
    super.initState();
    _album = Album.fetchAlbumFromId(widget.data.album.toString());
  }

  @override
  Widget build(BuildContext context) => FutureBuilder(
        future: _album,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
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
                          image: NetworkImage(snapshot.data!.image),
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  // ignore: prefer_interpolation_to_compose_strings
                  "${widget.data.name} ",
                  style: const TextStyle(fontSize: 16.0, color: Colors.white),
                ),
              ],
            );
          } else {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: const Text(
                "",
                style: TextStyle(fontSize: 16.0),
              ),
            );
          }
        },
      );
}
