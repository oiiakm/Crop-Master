import 'package:cropmaster/features/profile/data/profile_entities.dart';
import 'package:cropmaster/features/profile/domain/profile_controller.dart';
import 'package:cropmaster/features/profile/presentation/widgets/profile_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();

  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.fetchUserDetails();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ProfileHeaderWidget(),
            SizedBox(
              height: 30.h,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20.h),
                  buildUpdateForm(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildUpdateForm() {
    return Column(
      children: [
        buildTextField('First Name', firstNameController),
        buildTextField('Last Name', lastNameController),
        buildTextField('Age', ageController),
        buildTextField('Phone', phoneController),
        buildTextField('Country', countryController),
        buildTextField('State', stateController),
        buildTextField('City', cityController),
        buildTextField('Pincode', pincodeController),
        ElevatedButton(
          onPressed: () {
            final newProfile = UserProfileEntities(
              firstName: firstNameController.text,
              lastName: lastNameController.text,
              age: ageController.text,
              phone: phoneController.text,
              country: countryController.text,
              state: stateController.text,
              city: cityController.text,
              pincode: pincodeController.text,
            );
            controller.updateUserDetails(newProfile);
          },
          child: const Text('Save'),
        ),
      ],
    );
  }

  Widget buildTextField(String label, TextEditingController controller) {
    return Container(
      width: 0.8.sw,
      margin: EdgeInsets.symmetric(vertical: 10.sp),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
        ),
      ),
    );
  }
}
