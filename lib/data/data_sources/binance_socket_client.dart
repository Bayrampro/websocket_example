import 'dart:async';

import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:websocket_example/core/constants/constants.dart';

abstract interface class BinanceSocketClient {
  void connectToStream(String stream, {bool isSingle = true});
  Stream<String> get stream;
  void disconnect();
  bool get isConnected;
}

class BinanceSocketClientImpl implements BinanceSocketClient {
  WebSocketChannel? _channel;
  StreamController<String>? _controller;

  @override
  void connectToStream(String stream, {bool isSingle = true}) {
    final url = isSingle
        ? "${Constants.singleStreamUrl}$stream"
        : "${Constants.multiStreamUrl}$stream";

    _channel = WebSocketChannel.connect(Uri.parse(url));
    _controller = StreamController<String>();

    _channel?.stream.listen(
      (message) {
        _controller?.add(message);
      },
      onError: (error) {
        _controller?.addError(error);
      },
      onDone: () {
        _controller?.close();
      },
      cancelOnError: true,
    );
  }

  @override
  Stream<String> get stream => _controller!.stream;

  @override
  void disconnect() {
    _channel?.sink.close();
    _controller?.close();
    _channel = null;
    _controller = null;
  }

  @override
  bool get isConnected => _channel != null;
}
