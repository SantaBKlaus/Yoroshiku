import 'package:flutter/material.dart';
import 'package:yoroshiku/components/home.dart';
import 'package:yoroshiku/components/lists.dart';
import 'package:yoroshiku/components/news.dart';
import 'package:yoroshiku/components/reviews.dart';

class Nav extends StatefulWidget {
  const Nav({Key? key}) : super(key: key);

  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _navindex = 0;
  void _changeState(int index) {
    setState(() {
      _navindex = index;
    });
  }

  PageController _pageController = PageController(initialPage: 0);
  static const List<Widget> _widgets = <Widget>[
    Home(),
    Collections(),
    News(),
    Reviews()
  ];

  final List<BottomNavigationBarItem> _botitems =
      const <BottomNavigationBarItem>[
    BottomNavigationBarItem(label: 'Films', icon: Icon(Icons.movie)),
    BottomNavigationBarItem(label: 'Lists', icon: Icon(Icons.list_alt)),
    BottomNavigationBarItem(label: 'News', icon: Icon(Icons.info)),
    BottomNavigationBarItem(label: 'Reviews', icon: Icon(Icons.people)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextButton(
          child: const Text(
            'Popular',
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/Search');
              },
              icon: const Icon(Icons.search))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Container(
                  color: Colors.black38,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 8, 8, 8.0),
                        child: Material(
                          color: Colors.grey,
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.person,
                              size: 40.0,
                            ),
                          ),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
                        child: Text(
                          'User',
                          style: _whiteFont,
                        ),
                      ),
                    ],
                  ),
                )),
            ListTile(
              title: Text(
                'Watchlist',
                style: _whiteFont,
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/Watched');
              },
              leading: const Icon(Icons.access_time_filled),
            ),
            ListTile(
              title: Text(
                'Search',
                style: _whiteFont,
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/Search');
              },
              leading: const Icon(Icons.search),
            )
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _changeState,
        children: _widgets,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _botitems,
        onTap: (index) {
          _pageController.animateToPage(index,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeOutSine);
        },
        currentIndex: _navindex,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  final _whiteFont = const TextStyle(fontSize: 20, color: Colors.white);
}
