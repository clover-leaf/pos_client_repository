import 'package:client_repository/src/client/api_wrapper.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  ApiClient({required http.Client httpClient, String? url})
      : _url = url ?? 'seal-app-a59wt.ondigitalocean.app',
        _httpWrapper = HttpWrapper(httpClient: httpClient);

  /// The url of api
  final String _url;

  /// HttpWrapper instance
  final HttpWrapper _httpWrapper;

  Future<Map<String, dynamic>> getRfid() async {
    final res = await _httpWrapper.get(Uri.https(_url, 'get-rfid'));
    return res;
  }

  Future<Map<String, dynamic>> requestMenu() async {
    final res = await _httpWrapper.get(Uri.https(_url, 'request-menu'));
    return res;
  }

  Future<Map<String, dynamic>> review(String dishId, int rating) async {
    final res = await _httpWrapper
        .get(Uri.https(_url, 'review', {'id': dishId, 'rating': '$rating'}));
    return res;
  }

  Future<Map<String, dynamic>> getReview() async {
    final res = await _httpWrapper.get(Uri.https(_url, 'get-review'));
    return res;
  }
}
