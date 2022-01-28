import UIKit

//MARK: - Core screen coordinator
class CoreScreenCoordinator: Coordinator {
  var children: [Coordinator] = []
  var router: Router
  private var navigationControllers: [UINavigationController] = []
  
  init(router: Router) {
    self.router = router
  }
  
  func present(
    animated: Bool,
    onDismissed: (() -> Void)?
  ) {
    guard let router = router as? TabBarRouter else {
      return
    }
    
    createRootNavigationControllers()
    
    let homeCoordinator = createHomeCoordinator(
      router: createNavigationRouter(
        navigationController: navigationControllers[0])
    )
    let depositWithdrawalCoordinator = createDepositWithdrawalCoordinator(
      router: createNavigationRouter(
        navigationController: navigationControllers[1])
    )
    
    router.present(
      navigationControllers,
      animated: true,
      onDismissed: nil
    )
    
    presentChild(
      homeCoordinator,
      animated: true,
      onDismissed: nil
    )
    
    presentChild(
      depositWithdrawalCoordinator,
      animated: true,
      onDismissed: nil
    )
  }
  
  func dismiss(animated: Bool) { }
}

extension CoreScreenCoordinator {
  private func createRootNavigationControllers() {
    navigationControllers = [
      UINavigationController(),
      UINavigationController()
    ]
    
    navigationControllers[0].tabBarItem = UITabBarItem(
      title: "거래소",
      image: UIImage(named: SystemImage.chartImageAsset.rawValue),
      selectedImage: nil
    )
    
    navigationControllers[1].tabBarItem = UITabBarItem(
      title: "입출금",
      image: UIImage(named: SystemImage.arrowLeftRight.rawValue),
      selectedImage: nil
    )
  }
  
  private func createNavigationRouter(
    navigationController: UINavigationController
  ) -> NavigationRouter {
    let router = NavigationRouter(
      navigationController: navigationController
    )
    return router
  }
  
  private func createHomeCoordinator(router: Router) -> HomeCoordinator {
    let coordinator = HomeCoordinator(router: router)
    return coordinator
  }
  
  private func createDepositWithdrawalCoordinator(
    router: Router
  ) -> DepositWithdrawalCoordinator {
    let coordinator = DepositWithdrawalCoordinator(router: router)
    return coordinator
  }
}
