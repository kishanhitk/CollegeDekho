import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CollegeDetails extends StatefulWidget {
  final String name, map;
  final String imgUrl, about, email, phone, website, location;
  CollegeDetails(
      {this.name,
      this.about,
      this.email,
      this.imgUrl,
      this.location,
      this.phone,
      this.website,
      this.map});
  @override
  _CollegeDetailsState createState() => _CollegeDetailsState();
}

class _CollegeDetailsState extends State<CollegeDetails> {
  bool isSaved = false;
  Widget saveIcon(bool isSaved) {
    if (isSaved)
      return Icon(Icons.star);
    else
      return Icon(Icons.star_border);
  }

  Widget fabIconNotSaved = Icon(Icons.star_border);
  Widget fabIconSaved = Icon(Icons.star);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.pinkAccent,
          child: saveIcon(isSaved),
          onPressed: () {
            setState(() {
              isSaved ? isSaved = false : isSaved = true;
            });
            print("Add To fav");
          }),
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          widget.name,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(widget.imgUrl)),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.web),
                    onPressed: () {
                      launch(widget.website);
                    }),
                IconButton(
                  icon: Icon(Icons.phone),
                  onPressed: widget.phone != null
                      ? () {
                          launch("tel:${widget.phone}");
                        }
                      : null,
                ),
                IconButton(
                  icon: Icon(Icons.email),
                  onPressed: widget.email != null
                      ? () {
                          launch("mailto:${widget.email}");
                        }
                      : null,
                ),
                IconButton(
                  icon: Icon(Icons.navigation),
                  onPressed: widget.map != null
                      ? () {
                          launch(widget.map);
                        }
                      : null,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                widget.name,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              widget.location,
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 20),
            Card(
              elevation: 1,
              margin: EdgeInsets.symmetric(horizontal: 25),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 25.0, horizontal: 50),
                child: Text(
                  widget.about,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(height: 100)
          ],
        ),
      )),
    );
  }
}
