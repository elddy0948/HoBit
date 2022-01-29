import UIKit

class CryptoListCell: UITableViewCell {
  static let reuseIdentifier = String(describing: CryptoListCell.self)
  
  lazy var cryptoListCellView = CryptoListCellView()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    setupSubViews()
    layout()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    
    setupSubViews()
    layout()
  }
  
  func configureView(content: TickerContent) {
    cryptoListCellView.configureLabels(content: content)
  }
}

//MARK: - UI Setup / Layout
extension CryptoListCell {
  private func setupSubViews() {
    contentView.addSubview(cryptoListCellView)
    cryptoListCellView.translatesAutoresizingMaskIntoConstraints = false
  }
  
  private func layout() {
    NSLayoutConstraint.activate([
      cryptoListCellView.topAnchor.constraint(
        equalTo: contentView.topAnchor
      ),
      cryptoListCellView.leadingAnchor.constraint(
        equalTo: contentView.leadingAnchor
      ),
      cryptoListCellView.trailingAnchor.constraint(
        equalTo: contentView.trailingAnchor
      ),
      cryptoListCellView.bottomAnchor.constraint(
        equalTo: contentView.bottomAnchor
      ),
    ])
  }
}
