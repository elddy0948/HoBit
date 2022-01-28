import RxSwift

extension Reactive where Base: URLSessionWebSocketTask {
  func send(message: URLSessionWebSocketTask.Message) -> Completable {
    return Completable.create(subscribe: { observer in
      self.base.send(
        message,
        completionHandler: { error in
          if let error = error {
            return observer(.error(error))
          }
          return observer(.completed)
        }
      )
      
      base.resume()
      
      return Disposables.create { self.base.cancel() }
    })
  }
  
  func receive() -> Observable<
    Result<URLSessionWebSocketTask.Message, Error>
  > {
    return Observable.create({ observer in
      self.base.receive(completionHandler: { result in
        switch result {
        case .success(let message):
          return observer.onNext(.success(message))
        case .failure(let error):
          return observer.onNext(.failure(error))
        }
      })
      
      base.resume()
      
      return Disposables.create { self.base.cancel() }
    })
  }
}
