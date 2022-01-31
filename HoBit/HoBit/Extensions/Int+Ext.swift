import Foundation

extension Int {
  func divideByMillions() -> String {
    if self >= 1_000_000 {
      let prefixNumber = self / 1_000_000
      let number = NSNumber(integerLiteral: prefixNumber)
      
      let formatter = NumberFormatter()
      formatter.groupingSize = 3
      formatter.groupingSeparator = ","
      
      return "\(formatter.string(from: number) ?? "")백만"
    } else {
      let number = NSNumber(integerLiteral: self)
      let formatter = NumberFormatter()
      
      formatter.groupingSize = 3
      formatter.groupingSeparator = ","
      return formatter.string(from: number) ?? ""
    }
  }
}
