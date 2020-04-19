import 'package:collegeDekho/collegeList.dart';
import 'package:collegeDekho/favourite.dart';
import 'package:collegeDekho/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:collegeDekho/model/collegeModel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[CollegeList(), FavouriteColleges()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<College>>.value(
      value: DataBaseService().college,
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            backgroundColor: Colors.transparent,
            elevation: 20,
            iconSize: 25,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.all_inclusive),
                title: Text("top"),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.star),
                title: Text("fav"),
              ),
            ]),
        appBar: AppBar(
          leading: Icon(
            Icons.menu,
            color: Colors.black,
          ),
          actions: <Widget>[
            IconButton(
                color: Colors.black,
                icon: Icon(Icons.search),
                onPressed: () {
                  showSearch(context: context, delegate: null);
                })
          ],
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            "CollegeDekho",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
    );
  }
}
