import Foundation

struct SubscriptionForm: Encodable {
  let type: String
  let symbols: [String]
  let tickTypes: [String]?
}
