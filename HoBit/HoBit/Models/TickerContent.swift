import Foundation

struct TickerContent: Decodable {
  let symbol: String
  let closePrice: String
  let changedRate: String
  let changedAmount: String
}

extension TickerContent {
  enum CodingKeys: String, CodingKey {
    case symbol, closePrice
    case changedRate = "chgRate"
    case changedAmount = "chgAmt"
  }
}
