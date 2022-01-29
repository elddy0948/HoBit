import Foundation

struct TickerContent: Decodable {
  let symbol: String
  let value: String
  let closePrice: String
  let changedRate: String
  let changedAmount: String
}

extension TickerContent {
  enum CodingKeys: String, CodingKey {
    case symbol, closePrice, value
    case changedRate = "chgRate"
    case changedAmount = "chgAmt"
  }
}
