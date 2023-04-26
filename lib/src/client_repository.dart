import 'package:client_repository/client_repository.dart';
import 'package:client_repository/src/client/client.dart';
import 'package:client_repository/src/client/ready_client.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';

/// {@template client_repository}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class ClientRepository {
  /// {@macro client_repository}
  ClientRepository({
    ApiClient? apiClient,
    OrderClient? orderClient,
    ReadyClient? readyClient,
  })  : _apiClient = apiClient ?? ApiClient(httpClient: http.Client()),
        _orderClient = orderClient ?? OrderClient(),
        _readyClient = readyClient ?? ReadyClient();

  final ApiClient _apiClient;

  final OrderClient _orderClient;

  final ReadyClient _readyClient;

  /// Request menu from the server.
  Future<Map<String, dynamic>> requestMenu() async => _apiClient.requestMenu();

  /// Place order to the server.
  void checkout(Map<String, dynamic> order) => _orderClient.checkOut(order);

  /// Delivery orders
  void delivery(Map<String, dynamic> data) => _orderClient.delivery(data);

  /// Return a stream of real-time [Invoice]
  Stream<Invoice?> get invoice => _orderClient.invoice;

  /// Return a stream of prepare [InvoiceDish].
  Stream<List<InvoiceDish>> get prepareDishes => _orderClient.prepareDishes;

  /// Return a stream of delivery [InvoiceDish].
  Stream<List<InvoiceDish>> get deliveryDishes => _orderClient.deliveryDishes;

  /// Return a stream of review [InvoiceDish].
  Stream<List<String>> get reviewDishes => _orderClient.reviewDishes;

  final _shouldNotifyDelivering = BehaviorSubject<bool>.seeded(false);
  final _shouldNotifyDelivered = BehaviorSubject<bool>.seeded(false);

  Stream<bool> getShouldNotifyDelivering() =>
      _shouldNotifyDelivering.asBroadcastStream();

  Stream<bool> getShouldNotifyDelivered() =>
      _shouldNotifyDelivered.asBroadcastStream();

  void updateShouldNotifyDelivering({required bool shouldNotify}) =>
      _shouldNotifyDelivering.add(shouldNotify);

  void updateShouldNotifyDelivered({required bool shouldNotify}) =>
      _shouldNotifyDelivered.add(shouldNotify);

  /// Return a stream of real-time [Invoice]
  Stream<bool> get isReady => _readyClient.isReady;

  // /// Return a stream of connection updates from the server.
  Stream<ConnectionState> get connection => _orderClient.connection;

  // /// Close the connection.
  void close() {
    // _menuClient.close();
    _orderClient.close();
    _readyClient.close();
  }
}
