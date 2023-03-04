import 'package:client_repository/src/client/api_wrapper.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  ApiClient({required http.Client httpClient, String? url})
      : _url = url ?? 'localhost:8080',
        _httpWrapper = HttpWrapper(httpClient: httpClient);

  /// The url of api
  final String _url;

  /// HttpWrapper instance
  final HttpWrapper _httpWrapper;

  Future<Map<String, dynamic>> requestMenu() async {
    final res = await _httpWrapper.get(Uri.http(_url, 'request-menu'));
    return res;
  }
}
