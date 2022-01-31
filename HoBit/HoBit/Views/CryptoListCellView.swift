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
      self.checkLabelColor(content.changedRate)
      self.symbolLabel.text = content.symbol
      self.changeRateLabel.text = "\(content.changedRate)%"
      self.valueLabel.text = self.formatValue(content.value)
    }
  }
  
  private func checkLabelColor(_ changedRate: String) {
    let rate = Double(changedRate) ?? 0.0
    
    if rate > 0.0 {
      setupLabelColor(to: .systemRed)
    } else if rate == 0.0 {
      setupLabelColor()
    } else {
      setupLabelColor(to: .systemBlue)
    }
  }
  
  private func setupLabelColor(to color: UIColor = .label) {
    changeRateLabel.textColor = color
    //TODO: Close Price도 넣기
  }
  
  private func formatValue(_ value: String) -> String {
    var doubleValue = Double(value) ?? 0.0
    doubleValue = ceil(doubleValue)
    print("Double: ", doubleValue)
    let intValue = Int(doubleValue)
    print("Int: ", intValue)
    let formattedValue = intValue.divideByMillions()
    return formattedValue
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
