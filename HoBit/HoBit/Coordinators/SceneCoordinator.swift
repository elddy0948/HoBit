import UIKit

final class SceneCoordinator: Coordinator {
  var children: [Coordinator] = []
  var router: Router
  
  
  init(router: Router) {
    self.router = router
  }
  
  func present(animated: Bool, onDismissed: (() -> Void)?) {
    let tabBarController = UITabBarController()
    
    router.present(
      tabBarController,
      animated: true
    )
  }
  
  func dismiss(animated: Bool) {
  }
}
