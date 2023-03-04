import 'package:client_repository/src/client/client.dart';
import 'package:http/http.dart' as http;
import 'package:pos_server/pos_server.dart';

/// {@template client_repository}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class ClientRepository {
  /// {@macro client_repository}
  ClientRepository({
    ApiClient? apiClient,
    OrderClient? orderClient,
  })  : _apiClient = apiClient ?? ApiClient(httpClient: http.Client()),
        _orderClient = orderClient ?? OrderClient();

  final ApiClient _apiClient;

  final OrderClient _orderClient;

  /// Request menu from the server.
  Future<Map<String, dynamic>> requestMenu() async => _apiClient.requestMenu();

  /// Place order to the server.
  void checkout(Map<String, dynamic> order) => _orderClient.checkOut(order);

  /// Return a stream of real-time [Invoice] that match with tableId.
  Stream<Invoice?> get invoice => _orderClient.invoice;

  /// Return a stream of real-time [InvoiceDish] that match with tableId.
  Stream<List<InvoiceDish>> get prepareDishes => _orderClient.prepareDishes;

  // /// Return a stream of connection updates from the server.
  // Stream<ConnectionState> get connection => _menuClient.connection;

  // /// Close the connection.
  void close() {
    // _menuClient.close();
    // _orderClient.close();
  }
}
