import UIKit

class DepositWithdrawalCoordinator: Coordinator {
  var children: [Coordinator] = []
  var router: Router
  
  init(router: Router) {
    self.router = router
  }
  
  func present(
    animated: Bool,
    onDismissed: (() -> Void)?
  ) {
    let viewController = DepositWithdrawalViewController()
    router.present(
      viewController,
      animated: animated,
      onDismissed: onDismissed
    )
  }
  
  func dismiss(animated: Bool) {
  }
}
