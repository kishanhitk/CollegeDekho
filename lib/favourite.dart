import 'package:flutter/material.dart';

class FavouriteColleges extends StatefulWidget {
  @override
  _FavouriteCollegesState createState() => _FavouriteCollegesState();
}

class _FavouriteCollegesState extends State<FavouriteColleges> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
                child: Text(
                  "Favourite Colleges",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w100),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
