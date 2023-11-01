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
        Map<String, dynamic> updatedData = {
          if (newProfile.firstName != null) 'firstName': newProfile.firstName,
          if (newProfile.lastName != null) 'lastName': newProfile.lastName,
          if (newProfile.age != null) 'age': newProfile.age,
          if (newProfile.country != null) 'country': newProfile.country,
          if (newProfile.state != null) 'state': newProfile.state,
          if (newProfile.city != null) 'city': newProfile.city,
          if (newProfile.pincode != null) 'pincode': newProfile.pincode,
        };

        await userDocRef.update(updatedData);

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
          phone: data['phoneNumber'],
          country: data['country'],
          state: data['state'],
          city: data['city'],
          pincode: data['pincode'],
        );
      }
    }
  }
}
