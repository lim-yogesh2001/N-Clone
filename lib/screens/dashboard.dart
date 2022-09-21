import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/home.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  var _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: _index == 0
              ? const HomeScreen()
              : _index == 1
                  ? const Text("Search")
                  : _index == 2
                      ? const Text("Comming Soon")
                      : _index == 3
                          ? const Text("Downloads")
                          : const Text("More")),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 18.0,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12.0,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white,
        onTap: (value) {
          setState(() {
            _index = value;
          });
        },
        // fixedColor: Colors.white70,
        currentIndex: _index,
        backgroundColor: Colors.black,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.video_library), label: "Coming"),
          BottomNavigationBarItem(
              icon: Icon(Icons.download), label: "Downloads"),
          BottomNavigationBarItem(
              icon: Icon(Icons.more_rounded), label: "More"),
        ],
      ),
    );
  }
}
