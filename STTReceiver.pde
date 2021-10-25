/*
  https://florianschulz.info/stt/
  Simple WebSocketServer example that can receive voice transcripts from Chrome
  Requires WebSockets Library: https://github.com/alexandrainst/processing_websockets
 */

import websockets.*;

class STTReceiver {
  
  PApplet parent;
  WebsocketServer socket;
  int port = 1337;
  String channel = "/p5websocket";
  String msg;
  
  STTReceiver(PApplet _parent) {
    parent = _parent;
    socket = new WebsocketServer(parent, port, channel);
  }
  
  STTReceiver(PApplet _parent, int _port, String _channel) {
    parent = _parent;
    port = _port;
    channel = _channel;
    socket = new WebsocketServer(parent, port, channel);
  }
  
  void webSocketServerEvent(String _msg){
    msg = _msg;
    println("Received: " + msg);
  }

}
