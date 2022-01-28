import UIKit

class TabBarRouter: Router {
  private var tabBarController: UITabBarController
  
  init(tabBarController: UITabBarController) {
    self.tabBarController = tabBarController
  }
  
  func present(
    _ viewController: UIViewController,
    animated: Bool,
    onDismissed: (() -> Void)?
  ) { }
  
  func present(
    _ viewControllers: [UIViewController],
    animated: Bool,
    onDismissed: (() -> Void)?
  ) {
    tabBarController.setViewControllers(
      viewControllers,
      animated: animated
    )
  }
  
  func dismiss(animated: Bool) { }
}
