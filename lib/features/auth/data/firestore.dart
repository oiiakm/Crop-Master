import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  Future<void> addUserDetail( String mobile) async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final String uid = user.uid;
      try {
        final userDoc =
            await FirebaseFirestore.instance.collection('users').doc(uid).get();
        if (!userDoc.exists) {
          await FirebaseFirestore.instance.collection('users').doc(uid).set({
            'fullName':'',
            'phoneNumber': mobile,
            'email': '',
            'userName': '',
            'address': '',
            'selectedLanguage': '',
          });
          print('User added to Firestore.');
        } else {
          print('User already exists in Firestore.');
        }
      } catch (error) {
        print('Error updating Firestore: $error');
      }
    } else {
      print('No user is currently logged in.');
    }
  }

 

  Future<Map<String, dynamic>> getUserDetail() async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final String uid = user.uid;
      try {
        DocumentSnapshot snapshot =
            await FirebaseFirestore.instance.collection('users').doc(uid).get();
        if (snapshot.exists) {
          Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
          return data;
        } else {
          print('User Document does not exist');
          return {};
        }
      } catch (e) {
        print('Error getting user details: $e');
        return {};
      }
    } else {
      print('No user is currently logged in');
      return {};
    }
  }
}
