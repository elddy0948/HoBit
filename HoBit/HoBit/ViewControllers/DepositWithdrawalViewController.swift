import UIKit

class DepositWithdrawalViewController: UIViewController {
  
  //MARK: - Initializer
  init() {
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  //MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .systemBlue
  }
}
