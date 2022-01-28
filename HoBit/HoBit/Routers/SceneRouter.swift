import UIKit

//MARK: - Scene Router
class SceneRouter: Router {
  private var window: UIWindow
  
  init(window: UIWindow) {
    self.window = window
  }
  
  func present(
    _ viewController: UIViewController,
    animated: Bool,
    onDismissed: (() -> Void)?
  ) {
    setupNavigationBarAppearance()
    setupTabBarAppearance()
    
    window.rootViewController = viewController
    window.makeKeyAndVisible()
  }
  
  func dismiss(animated: Bool) { }
}

//MARK: - Setup Navigation and TabBar appearance
extension SceneRouter {
  private func setupNavigationBarAppearance() {
    let appearance = UINavigationBarAppearance()
    appearance.backgroundColor = .systemBackground
    
    UINavigationBar.appearance().standardAppearance = appearance
    UINavigationBar.appearance().scrollEdgeAppearance = appearance
    UINavigationBar.appearance().compactAppearance = appearance
  }
  
  private func setupTabBarAppearance() {
    let appearance = UITabBarAppearance()
    appearance.backgroundColor = .systemBackground
    
    UITabBar.appearance().standardAppearance = appearance
    
    if #available(iOS 15.0, *) {
      UITabBar.appearance().scrollEdgeAppearance = appearance
    }
  }
}
