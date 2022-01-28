import RxSwift

enum NetworkError: Error {
  case invalidURL
  case encodingError
  case invalidMessage
}

class NetworkingService {
  private let session: URLSession
  
  init(session: URLSession = URLSession.shared) {
    self.session = session
  }
  
  func fetchCurrencyList(
    url: String,
    message: SubscriptionForm
  ) -> Completable {
    guard let url = URL(string: url) else {
      return Completable.error(NetworkError.invalidURL)
    }
    
    let stringMessage: String?
    
    do {
      let encoder = JSONEncoder()
      let data = try encoder.encode(message)
      stringMessage = String(data: data, encoding: .utf8)
    } catch {
      return Completable.error(NetworkError.encodingError)
    }
    
    guard let stringMessage = stringMessage else {
      return Completable.error(NetworkError.invalidMessage)
    }
    
    return session.webSocketTask(with: url)
      .rx
      .send(message: .string(stringMessage))
  }
  
  func setupReceive(
    url: String
  ) -> Observable<Result<URLSessionWebSocketTask.Message, Error>> {
    guard let url = URL(string: url) else {
      return Observable.error(NetworkError.invalidURL)
    }
    
    return session.webSocketTask(with: url)
      .rx
      .receive()
  }
}
