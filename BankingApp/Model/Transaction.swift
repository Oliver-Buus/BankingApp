import Foundation

struct Transaction: Identifiable {
    var id = UUID()
    let amount: Int
    let beneficiary: String
    let date: Date
}
