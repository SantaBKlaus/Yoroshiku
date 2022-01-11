import 'package:flutter/material.dart';

class SearchScreeen extends StatelessWidget {
  const SearchScreeen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Search();
  }
}

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          decoration: const InputDecoration(hintText: 'Search for film...'),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.close))
        ],
      ),
    );
  }
}
