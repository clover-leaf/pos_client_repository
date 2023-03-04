import 'dart:convert';

import 'package:client_repository/client_repository.dart';
import 'package:pos_server/pos_server.dart';
import 'package:web_socket_client/web_socket_client.dart';

class OrderClient {
  /// {@macro client_repository}
  OrderClient({WebSocket? socket})
      : _ws = socket ?? WebSocket(Uri.parse('ws://localhost:8080/ws-order'));

  final WebSocket _ws;

  /// Place order to the server.
  void checkOut(Map<String, dynamic> data) {
    final message = jsonEncode({'type': Message.prepareOrder.value, ...data});
    _ws.send(message);
  }

  /// Return a stream of real-time [Invoice] that match with tableId.
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

  /// Return a stream of real-time [InvoiceDish] that match with tableId.
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

  /// Return a stream of connection updates from the server.
  Stream<ConnectionState> get connection => _ws.connection;

  /// Close the connection.
  void close() => _ws.close();
}
