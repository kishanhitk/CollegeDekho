import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collegeDekho/model/collegeModel.dart';

class DataBaseService {
  final CollectionReference collegeCollection =
      Firestore.instance.collection("engineering");
  List<College> _collegeListFromFirestore(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return College(
          about: doc.data["about"],
          email: doc.data["email"],
          name: doc.data["name"],
          imgUrl: doc.data["imgUrl"],
          phone: doc.data["phone"],
          location: doc.data["location"],
          website: doc.data["website"],
          map: doc.data["map"]);
    }).toList();
  }

  Stream<List<College>> get college {
    return collegeCollection.snapshots().map(_collegeListFromFirestore);
  }
}
