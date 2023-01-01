import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Entity/album_entity.dart';
import 'package:flutter_application_1/Pages/home_page.dart';
import 'package:flutter_application_1/Pages/login_page.dart';
import 'package:flutter_application_1/Entity/song_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter_application_1/firebase_options.dart";
import 'package:flutter_application_1/widgets/listaAlbum.dart';
import 'package:flutter_application_1/widgets/listaSong.dart';

import 'Pages/cerca_page.dart';
import 'Pages/libreria_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      runApp(const Login());
    } else {
      runApp(const MyApp());
    }
  });
}

Future<List<Song>>? listSong;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FakeSpotify',
      theme: ThemeData(
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 15,
            color: Colors.white,
            fontFamily: "Century Gothic",
          ),
        ),
        // This is the theme of your application.
      ),
      home: const MyHomePage(
        title: "buonasera",
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

final List<Widget> _buildBody = [
  const PrimaRoute(),
  const SecondaRoute(),
  const TerzaRoute(),
];

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            label: "cerca",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.library_music_rounded,
              color: Colors.white,
            ),
            label: "libreria",
          ),
        ],
        onTap: (x) {
          setState(() {
            _selectedIndex = x;
          });
        },
        currentIndex: _selectedIndex,
      ),
      body: Stack(
        children: [
          _buildBody[_selectedIndex],
          Align(
            alignment: Alignment(
              MediaQuery.of(context).size.height * 0.0001,
              MediaQuery.of(context).size.width * 0.00239,
            ),
            child: Stack(
              children: [
                SizedBox(
                  child: Container(
                    color: Colors.grey,
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: Stack(
                      children: [
                        LayoutBuilder(
                          builder: (BuildContext context,
                              BoxConstraints constraints) {
                            return Padding(
                              padding:
                                  EdgeInsets.all(constraints.maxHeight * 0.11),
                              child: Container(
                                color: Colors.white,
                                width: constraints.maxHeight * 0.7,
                                height: constraints.maxHeight * 0.8,
                              ),
                            );
                          },
                        ),
                        LayoutBuilder(
                          builder: (BuildContext context,
                              BoxConstraints constraints) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                IconButton(
                                  iconSize: 30,
                                  onPressed: () {
                                    print("ciao");
                                  },
                                  icon: const Icon(
                                    Icons.skip_previous_sharp,
                                    color: Colors.black,
                                  ),
                                ),
                                IconButton(
                                  iconSize: 30,
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.play_arrow_rounded,
                                    color: Colors.black,
                                  ),
                                ),
                                IconButton(
                                  iconSize: 30,
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.skip_next_rounded,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ); // This trailing comma makes auto-formatting nicer for ;
  }
}
