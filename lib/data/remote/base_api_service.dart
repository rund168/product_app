abstract class BaseApiServer{
  Future<dynamic> getApi(String url);
  Future<dynamic> postApi(String url, requestBody);
}