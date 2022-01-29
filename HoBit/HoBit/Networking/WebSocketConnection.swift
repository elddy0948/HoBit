import Foundation

protocol WebSocketConnection {
  func send(text: String)
  func send(data: Data)
  func connect()
  func disconnect()
  var delegate: WebSocketConnectionDelegate? { get set }
}

protocol WebSocketConnectionDelegate: AnyObject {
  func onConnect(connection: WebSocketConnection)
  func onDisconnected(
    connection: WebSocketConnection,
    error: Error?
  )
  func onError(
    connection: WebSocketConnection,
    error: Error
  )
  func onMessage(
    connection: WebSocketConnection,
    text: String
  )
  func onMessage(
    connection: WebSocketConnection,
    data: Data
  )
}
