import Foundation

struct Account: Identifiable {
    let name: String
    let iban: String
    let kind: Kind
    private(set) var transactions: [Transaction]
    var id: String { iban }
    var balance: Int {
        var balance = 0;
        for transaction in transactions {
            balance += transaction.amount
        }
        return balance
    }
    
    init(name: String, iban: String, kind: Kind) {
        self.name = name
        self.iban = iban
        self.kind = kind
        self.transactions = [ Transaction(
            amount: 2000,
            beneficiary: "Initial Balance",
            date: Date())]
    }
    
    mutating func add(_ transaction: Transaction) {
        transactions.append(transaction)
    }
}
