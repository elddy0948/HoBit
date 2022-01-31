import Foundation

struct Symbols {
  let symbolDictionary: [String : String] = [
    "BTC_KRW" : "비트코인",
    "ETH_KRW" : "이더리움",
    "XRP_KRW" : "리플",
    "DOGE_KRW" : "도지코인",
    "SOL_KRW" : "솔라나",
    "DOT_KRW" : "폴카닷",
  ]
  
  let toSubscribe: [String] = [
    "BTC_KRW", "ETH_KRW", "XRP_KRW", "DOGE_KRW",
    "SOL_KRW", "DOT_KRW"
  ]
}
