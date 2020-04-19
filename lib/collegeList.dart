import 'package:collegeDekho/model/collegeModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:collegeDekho/collegeDetail.dart';

class CollegeList extends StatefulWidget {
  @override
  _CollegeListState createState() => _CollegeListState();
}

class _CollegeListState extends State<CollegeList> {
  @override
  Widget build(BuildContext context) {
    final colleges = Provider.of<List<College>>(context);

    return colleges.isEmpty
        ? CircularProgressIndicator()
        : ListView.builder(
            itemCount: colleges.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CollegeDetails(
                          name: colleges[index].name,
                          imgUrl: colleges[index].imgUrl,
                          about: colleges[index].about,
                          location: colleges[index].location,
                          website: colleges[index].website,
                          phone: colleges[index].phone,
                          email: colleges[index].email,
                          map: colleges[index].map,
                        ),
                      ));
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20.0, horizontal: 8),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: Text(colleges[index].name),
                        subtitle: Text(colleges[index].location),
                        leading: Container(
                            height: 130,
                            width: 130,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.network(
                                colleges[index].imgUrl,
                                fit: BoxFit.cover,
                              ),
                            )),
                      ),
                      Divider(
                        thickness: 1,
                        height: 10,
                      )
                    ],
                  ),
                ),
              );
            },
          );
  }
}
