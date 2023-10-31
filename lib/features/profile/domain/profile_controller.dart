import 'package:cropmaster/common/snackbar.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cropmaster/features/profile/data/profile_entities.dart';

class ProfileController extends GetxController {
  var userProfile = UserProfileEntities().obs;
  final firestore = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser;

  Future<void> updateUserDetails(UserProfileEntities newProfile) async {
    if (user != null) {
      final userDocRef = firestore.collection('users').doc(user!.uid);

      try {
        await userDocRef.set({
          'firstName': newProfile.firstName,
          'lastName': newProfile.lastName,
          'age': newProfile.age,
          'phone': newProfile.phone,
          'country': newProfile.country,
          'state': newProfile.state,
          'city': newProfile.city,
          'pincode': newProfile.pincode,
        });

        userProfile.value = newProfile;
        MessageDisplay.showMessage("Profile Updated successfully");
      } catch (e) {
        print('Error updating user details: $e');
        MessageDisplay.showMessage("Something went wrong");
      }
    }
  }

  Future<void> fetchUserDetails() async {
    if (user != null) {
      final userDocRef = firestore.collection('users').doc(user!.uid);
      final userData = await userDocRef.get();

      if (userData.exists) {
        final data = userData.data() as Map<String, dynamic>;
        userProfile.value = UserProfileEntities(
          firstName: data['firstName'],
          lastName: data['lastName'],
          age: data['age'],
          phone: data['phone'],
          country: data['country'],
          state: data['state'],
          city: data['city'],
          pincode: data['pincode'],
        );
      }
    }
  }
}
