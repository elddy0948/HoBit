import UIKit

class HomeCoordinator: Coordinator {
  var children: [Coordinator] = []
  var router: Router
  
  init(router: Router) {
    self.router = router
  }
  
  func present(
    animated: Bool,
    onDismissed: (() -> Void)?
  ) {
    let viewController = CryptoCurrencyListViewController()
    router.present(
      viewController,
      animated: animated,
      onDismissed: onDismissed
    )
  }
  
  func dismiss(animated: Bool) {
  }
}
