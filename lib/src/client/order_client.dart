import 'dart:convert';

import 'package:client_repository/client_repository.dart';
import 'package:web_socket_client/web_socket_client.dart';

class OrderClient {
  /// {@macro client_repository}
  OrderClient({WebSocket? socket})
      : _ws = socket ??
            WebSocket(Uri.parse(
                'wss://oyster-app-urtgv.ondigitalocean.app/ws-order'));

  final WebSocket _ws;

  /// Place order to the server.
  void checkOut(Map<String, dynamic> data) {
    final message = jsonEncode({'type': Message.prepareOrder.value, ...data});
    _ws.send(message);
  }

  /// Delivery orders
  void delivery(Map<String, dynamic> data) {
    final message = jsonEncode({'type': Message.deliveryOrder.value, ...data});
    _ws.send(message);
  }

  /// Return a stream of real-time [Invoice]
  Stream<Invoice?> get invoice => _ws.messages.cast<String>().map((message) {
        final data = jsonDecode(message) as Map<String, dynamic>;
        if (data['type'] == Message.prepareOrder.value) {
          final invoice =
              Invoice.fromJson(data['invoice'] as Map<String, dynamic>);
          return invoice;
        } else {
          return null;
        }
      });

  /// Return a stream of prepare [InvoiceDish].
  Stream<List<InvoiceDish>> get prepareDishes =>
      _ws.messages.cast<String>().map((message) {
        final data = jsonDecode(message) as Map<String, dynamic>;
        if (data['type'] == Message.prepareOrder.value) {
          final invoiceDishes = fromJson<InvoiceDish>(
            InvoiceDish.fromJson,
            data['invoice_dishes'],
          );
          return invoiceDishes;
        } else {
          return [];
        }
      });

  /// Return a stream of delivery [InvoiceDish].
  Stream<List<InvoiceDish>> get deliveryDishes =>
      _ws.messages.cast<String>().map((message) {
        final data = jsonDecode(message) as Map<String, dynamic>;
        if (data['type'] == Message.deliveryOrder.value) {
          final invoiceDishes = fromJson<InvoiceDish>(
            InvoiceDish.fromJson,
            data['invoice_dishes'],
          );
          return invoiceDishes;
        } else {
          return [];
        }
      });

  /// Return a stream of review [InvoiceDish].
  Stream<List<String>> get reviewDishes =>
      _ws.messages.cast<String>().map((message) {
        final data = jsonDecode(message) as Map<String, dynamic>;
        if (data['type'] == Message.reviewOrder.value) {
          return (data['invoice_dishes_id'] as List<dynamic>)
              .map((e) => e as String)
              .toList();
        } else {
          return [];
        }
      });

  /// Return a stream of connection updates from the server.
  Stream<ConnectionState> get connection => _ws.connection;

  /// Close the connection.
  void close() => _ws.close();
}
