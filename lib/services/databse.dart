import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffe_type/models/brow.dart';
import 'package:coffe_type/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  //collection reference
  final CollectionReference browCollection =
      Firestore.instance.collection('brows');

  Future updateUserData(String sugars, String name, int strength) async {
    return await browCollection.document(uid).setData({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

  //brow list from snapshot
  List<Brow> _browListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Brow(
        name: doc.data['name'] ?? '',
        strength: doc.data['strength'] ?? 0,
        sugars: doc.data['sugars'] ?? '0',
      );
    }).toList();
  }

  UserDATA _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserDATA(
      uid: uid,
      name: snapshot.data['name'],
      sugars: snapshot.data['sugars'],
      strength: snapshot.data['strength'],
    );
  }

  // get brews stream
  Stream<List<Brow>> get brows {
    return browCollection.snapshots().map(_browListFromSnapshot);
  }

  // get user doc stream
  Stream<UserDATA> get userDATA {
    return browCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }
}
