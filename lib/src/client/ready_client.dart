import 'package:pos_server/pos_server.dart';
import 'package:web_socket_client/web_socket_client.dart';

class ReadyClient {
  /// {@macro client_repository}
  ReadyClient({WebSocket? socket})
      : _ws = socket ??
            WebSocket(
                Uri.parse('wss://seal-app-a59wt.ondigitalocean.app/ready'));

  final WebSocket _ws;

  /// Return a stream of real-time [Invoice]
  Stream<bool> get isReady => _ws.messages
      .cast<String>()
      .map((message) => message.toLowerCase() == 'true');

  /// Return a stream of connection updates from the server.
  Stream<ConnectionState> get connection => _ws.connection;

  /// Close the connection.
  void close() => _ws.close();
}
