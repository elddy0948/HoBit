import UIKit

class CryptoListCellView: UIStackView {
  
  //MARK: - Views
  lazy var symbolLabel: UILabel = {
    let label = UILabel()
    label.textColor = .label
    label.textAlignment = .center
    label.font = .preferredFont(forTextStyle: .body)
    return label
  }()
  
  lazy var changeRateLabel: UILabel = {
    let label = UILabel()
    label.textColor = .label
    label.textAlignment = .center
    label.font = .preferredFont(forTextStyle: .body)
    return label
  }()
  
  lazy var valueLabel: UILabel = {
    let label = UILabel()
    label.textColor = .label
    label.textAlignment = .center
    label.font = .preferredFont(forTextStyle: .body)
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupStackView()
    setupSubViews()
  }
  
  required init(coder: NSCoder) {
    super.init(coder: coder)
    setupStackView()
    setupSubViews()
  }
  
  func configureLabels(content: TickerContent) {
    DispatchQueue.main.async { [weak self] in
      guard let self = self else { return }
      self.symbolLabel.text = content.symbol
      self.changeRateLabel.text = content.changedRate
      self.valueLabel.text = content.value
    }
  }
}

//MARK: - UI Setup / Layout
extension CryptoListCellView {
  private func setupStackView() {
    axis = .horizontal
    distribution = .fillEqually
    backgroundColor = .systemBackground
  }
  
  private func setupSubViews() {
    addArrangedSubview(symbolLabel)
    addArrangedSubview(changeRateLabel)
    addArrangedSubview(valueLabel)
  }
}
