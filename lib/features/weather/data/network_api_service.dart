import 'dart:convert';
import 'package:cropmaster/features/weather/domain/base_api_service.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiService {
  @override
  Future getAPi(String url) async {
    dynamic responseJson;

    final response =
        await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
    responseJson = returnResponse(response);
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        print("Invalid Response");
      default:
        print("Invalid Reponse");
    }
  }

  @override
  Future postApi(data, String url) async {}
}
