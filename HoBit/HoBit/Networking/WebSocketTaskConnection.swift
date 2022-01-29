import Foundation

class WebSocketTaskConnection: NSObject {
  //MARK: - Properties
  var delegate: WebSocketConnectionDelegate?
  var webSocketTask: URLSessionWebSocketTask?
  var urlSession: URLSession?
  let delegateQueue = OperationQueue()
  
  //MARK: - Initializer
  init(url: URL) {
    super.init()
    
    var request = URLRequest(url: url)
    request.timeoutInterval = 5
    
    urlSession = URLSession(
      configuration: .default,
      delegate: self,
      delegateQueue: delegateQueue
    )
    
    guard let urlSession = urlSession else {
      return
    }
    
    webSocketTask = urlSession.webSocketTask(with: request)
  }
}

//MARK: - WebSocketConnection
extension WebSocketTaskConnection: WebSocketConnection {
  
  func send(text: String) {
    guard let webSocketTask = webSocketTask else { return }
    webSocketTask.send(URLSessionWebSocketTask.Message.string(text)) { error in
      if let error = error {
        self.delegate?.onError(connection: self, error: error)
      }
    }
  }
  
  func send(data: Data) {
    guard let webSocketTask = webSocketTask else { return }
    webSocketTask.send(URLSessionWebSocketTask.Message.data(data)) { error in
      if let error = error {
        self.delegate?.onError(connection: self, error: error)
      }
    }
  }
  
  func connect() {
    webSocketTask?.resume()
    listen()
  }
  
  func listen() {
    guard let webSocketTask = webSocketTask else {
      return
    }
    
    webSocketTask.receive { result in
      switch result {
      case .failure(let error):
        self.delegate?.onError(connection: self, error: error)
      case .success(let message):
        switch message {
        case .string(let text):
          self.delegate?.onMessage(connection: self, text: text)
        case .data(let data):
          self.delegate?.onMessage(connection: self, data: data)
        @unknown default:
          fatalError()
        }
        
        self.listen()
      }
    }
  }
  
  func disconnect() {
    webSocketTask?.cancel(with: .goingAway, reason: nil)
  }
}

//MARK: - URLSessionWebSocketDelegate
extension WebSocketTaskConnection: URLSessionWebSocketDelegate {
  func urlSession(
    _ session: URLSession,
    webSocketTask: URLSessionWebSocketTask,
    didOpenWithProtocol protocol: String?
  ) {
    self.delegate?.onConnect(connection: self)
  }
  
  func urlSession(
    _ session: URLSession,
    webSocketTask: URLSessionWebSocketTask,
    didCloseWith closeCode: URLSessionWebSocketTask.CloseCode,
    reason: Data?
  ) {
    self.delegate?.onDisconnected(
      connection: self,
      error: nil
    )
  }
}

