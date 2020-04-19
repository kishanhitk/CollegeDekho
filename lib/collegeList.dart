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
        : ListView.separated(
            separatorBuilder: (context, index) => Divider(
              color: Colors.grey,
              thickness: 0.3,
            ),
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
                child: ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  title: Text(colleges[index].name),
                  subtitle: Text(colleges[index].location),
                  leading: Container(
                    height: 200,
                    width: 140,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        colleges[index].imgUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
  }
}
