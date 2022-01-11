import 'package:flutter/material.dart';
import 'package:yoroshiku/components/search.dart';
import 'package:yoroshiku/components/watchlist.dart';
import 'package:yoroshiku/navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MangaReader',
      theme: ThemeData.dark(),
      home: const Nav(),
      routes: {
        '/Watched': (context) => const Watched(),
        '/Search': (context) => const SearchScreeen()
      },
    );
  }
}
