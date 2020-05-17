  
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServiceUser {

  final String uid;
  DatabaseServiceUser({ this.uid });

  // collection reference
  final CollectionReference userInfo = Firestore.instance.collection('userinfo');

  Future<void> updateUserData(String firstname, String lastname) async {
    return await userInfo.document(uid).setData({
      'firstname': firstname,
      'lastname': lastname
      
    });
  }

}