import UIKit

//MARK: - Router Protocol
protocol Router: AnyObject {
  func present(
    _ viewController: UIViewController,
    animated: Bool
  )
  
  func present(
    _ viewController: UIViewController,
    animated: Bool,
    onDismissed: (() -> Void)?
  )
  
  func dismiss(animated: Bool)
}

//MARK: - Protocol extension 
extension Router {
  func present(
    _ viewController: UIViewController,
    animated: Bool
  ) {
    present(
      viewController,
      animated: animated,
      onDismissed: nil
    )
  }
}
