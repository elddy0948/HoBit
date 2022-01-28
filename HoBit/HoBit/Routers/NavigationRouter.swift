import UIKit

//MARK: - Navigation router
class NavigationRouter: Router {
  var navigationController: UINavigationController
  
  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
  func present(
    _ viewController: UIViewController,
    animated: Bool,
    onDismissed: (() -> Void)?
  ) {
    navigationController.pushViewController(
      viewController,
      animated: animated
    )
  }
  
  func dismiss(animated: Bool) {
  }
}
