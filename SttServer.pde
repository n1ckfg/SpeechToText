/*
https://florianschulz.info/stt/
Simple WebSocketServer example that can receive voice transcripts from Chrome
Requires WebSockets Library: https://github.com/alexandrainst/processing_websttSockets
*/

import websockets.*;

WebsocketServer sttSocket;
String sttMessage;
String sttUrl = "stt_client.html";
boolean sttReady = false;
boolean sttLaunchClient = false;

void setupSttReceiver() {
  initSttReceiver(1337, "/p5websocket");
}

void setupSttReceiver(int _port, String _channel) {
  initSttReceiver(_port, _channel);
}

void initSttReceiver(int _port, String _channel) {
  sttSocket = new WebsocketServer(this, _port, _channel);
  
  if (sttLaunchClient) {
    String os = System.getProperty("os.name").toLowerCase();
    println("OS is " + os);
    String[] args = new String[2];
    if (os.startsWith("win")) {
      args[0] = "C:\\Program Files (x86)\\Google\\Chrome\\Application\\chrome.exe";
    } else if (os.startsWith("mac")) {
      args[0] = "/Applications/Chrome.app";
    } else {
      args[0] = "google-chrome --app-url ";
    }
    
    args[1] = sketchPath("") + sttUrl;
    launch(args);
  }
}

void webSocketServerEvent(String msg) {
  if (!sttReady) sttReady = true;
  
  sttMessage = msg;
  println(msg);
}
