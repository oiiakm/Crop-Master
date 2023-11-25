import 'package:cropmaster/common/snackbar.dart';
import 'package:cropmaster/features/market/domain/market_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class MarketDialogueWidget extends StatelessWidget {
  final MarketDialogueController controller =
      Get.put(MarketDialogueController());

  MarketDialogueWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Market',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            Obx(
              () => DropdownButtonFormField<String>(
                value: controller.selectedMarket.value,
                onChanged: (value) {
                  controller.selectMarket(value!);
                },
                items: controller.marketList.map<DropdownMenuItem<String>>(
                  (String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(color: Colors.black),
                      ),
                    );
                  },
                ).toList(),
                decoration: InputDecoration(
                  labelText: 'Market Name',
                  labelStyle: const TextStyle(color: Colors.blue),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Obx(
              () => DropdownButtonFormField<String>(
                value: controller.selectedCrop.value,
                onChanged: (value) {
                  controller.selectCrop(value!);
                },
                items: controller.cropList.map<DropdownMenuItem<String>>(
                  (String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(color: Colors.black),
                      ),
                    );
                  },
                ).toList(),
                decoration: InputDecoration(
                  labelText: 'Crop Name',
                  labelStyle: const TextStyle(color: Colors.blue),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            GestureDetector(
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: controller.selectedDate.value,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                  builder: (BuildContext context, Widget? child) {
                    return Theme(
                      data: ThemeData.light().copyWith(
                        primaryColor: Colors.blue,
                        hintColor: Colors.blue,
                        colorScheme:
                            const ColorScheme.light(primary: Colors.blue),
                        buttonTheme: const ButtonThemeData(
                            textTheme: ButtonTextTheme.primary),
                      ),
                      child: child!,
                    );
                  },
                );
                if (pickedDate != null) {
                  controller.selectDate(pickedDate);
                }
              },
              child: AbsorbPointer(
                child: Obx(() => TextFormField(
                      controller: TextEditingController(
                        text: DateFormat('dd-MM-yyyy')
                            .format(controller.selectedDate.value),
                      ),
                      decoration: InputDecoration(
                        labelText: 'Date',
                        labelStyle: const TextStyle(color: Colors.blue),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.red,
          ),
          onPressed: () {
            controller.clearFields();
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.blue,
          ),
          onPressed: () {
            if (controller.selectedMarket.value == 'Select Market' ||
                controller.selectedCrop.value == 'Select Crop') {
              MessageDisplay.showMessage('Please select market and crop');
              return;
            }
            sendPredictRequest(controller.selectedMarket.value,
                controller.selectedCrop.value, controller.selectedDate.value);
            print('Selected Market: ${controller.selectedMarket.value}');
            print('Selected Crop: ${controller.selectedCrop.value}');
            print(
                'Selected Date: ${DateFormat('dd-MM-yyyy').format(controller.selectedDate.value)}');

            Navigator.of(context).pop();
            controller.clearFields();
          },
          child: const Text('Submit'),
        ),
      ],
    );
  }

  Future<void> sendPredictRequest(
      String marketName, String cropName, DateTime date) async {
    String formattedDate = DateFormat('dd-MM-yyyy').format(date);
    final Map<String, String> data = {
      'marketname': marketName,
      'commodity': cropName,
      'Date': formattedDate,
    };

    final response = await http.post(
      Uri.parse('http://10.0.2.2:5000/predict'),
      body: data,
    );

    if (response.statusCode == 200) {
      print('Response from server: ${response.body}');
      Get.toNamed('/market', arguments: {
        'marketName': marketName,
        'cropName': cropName,
        'formattedDate': formattedDate,
        'predictionData': response.body,
      });
    } else {
      print(
          'Failed to connect to the server. Status code: ${response.statusCode}');
      Get.toNamed('/market_error');
    }
  }
}
