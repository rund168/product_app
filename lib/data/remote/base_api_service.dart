abstract class BaseApiServer{
  Future<dynamic> getApi(String url);
  Future<dynamic> postApi(String url, dynamic requestBody);

  Future<dynamic> LoginApi(String url, dynamic requestBody);
}