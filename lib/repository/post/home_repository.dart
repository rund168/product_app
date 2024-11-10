import 'package:product_app/data/remote/network_api_service.dart';

class HomeRepository {
  final NetworkApiService _apiService = NetworkApiService();

  Future fetchData() async {
    // Add your network call or data fetching logic here
    // return _apiService.getData('your_endpoint_here');
  }
}
