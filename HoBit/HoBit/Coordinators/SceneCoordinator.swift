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
    
    let tabBarRouter = TabBarRouter(
      tabBarController: tabBarController
    )
    
    let coreScreenCoordinator = CoreScreenCoordinator(
      router: tabBarRouter
    )
    
    presentChild(
      coreScreenCoordinator,
      animated: true,
      onDismissed: nil
    )
  }
  
  func dismiss(animated: Bool) {
  }
}
