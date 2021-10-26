/*
https://florianschulz.info/stt/
Simple WebSocketServer example that can receive voice transcripts from Chrome
Requires WebSockets Library: https://github.com/alexandrainst/processing_websockets
*/

import websockets.*;

WebsocketServer socket;
int port = 1337;
String channel = "/p5websocket";
String message;

void setupSttReceiver() {
  socket = new WebsocketServer(this, port, channel);
}

void setupSttReceiver(int _port, String _channel) {
  port = _port;
  channel = _channel;
  socket = new WebsocketServer(this, port, channel);
}

void webSocketServerEvent(String msg) {
  message = msg;
  println(msg);
}
