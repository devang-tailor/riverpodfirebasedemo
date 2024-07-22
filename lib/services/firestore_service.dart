import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpodfirebasedemo/models/user_model.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addUser(UserModel user) async {
    await _firestore.collection('users').add(user.toMap());
  }

  Stream<List<UserModel>> getUsers() {
    return _firestore.collection('users').snapshots().map((querySnapshot) =>
        querySnapshot.docs.map((doc) => UserModel.fromMap(doc.data()!)).toList());
  }
}
