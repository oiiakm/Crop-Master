abstract class BaseApiService {
  Future<dynamic> getAPi(String url);
  Future<dynamic> postApi(dynamic data, String url);
}
