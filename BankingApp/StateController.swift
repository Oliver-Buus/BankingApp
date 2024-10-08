import Foundation

@Observable class StateController {
    var accounts: [Account] = TestDataAccounts.accounts
    func addAccount(named name: String, withKind kind: Account.Kind){
        accounts.append(Account(name: name, iban: UUID().uuidString, kind: kind))
    }
    func addTransaction(withAmount amount: Int, beneficiary: String, to account: Account) {
        let index = accounts.firstIndex {account.id == $0.id}
        if let index {
            accounts[index].add(Transaction(amount: amount, beneficiary: beneficiary, date: Date()))
        }
        
        //guard let index = accounts.firstIndex(of: account) else {return}
        /// Kan bruges istedet for det ovenstående, mangler self at tilføje transaktionen til array'et
    }
    
    func move(source: IndexSet, destination: Int){
        accounts.move(fromOffsets: source, toOffset: destination)
    }
    
    func delete(at offsets: IndexSet){
        accounts.remove(atOffsets: offsets)
    }
}

extension Account {
    enum Kind: String, CaseIterable, Identifiable {
        var id: Self {self}
        case Checkings
        case Savings
        case Investment
    }
}

extension Date {
    var transactionFormat: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: self)
    }
}
/// anvendelse: transaction.date.transactionFormat

extension String {
    var ibanFormat: String {
        var remaining = Substring(self)
        var chunks: [Substring] = []
        while !remaining.isEmpty {
            chunks.append(remaining.prefix(4))
            remaining = remaining.dropFirst(4)
        }
        return chunks.joined(separator: " ")
    }
}
/// anvendelse: account.iban.ibanFormat.


struct TestDataAccounts {
    static var accounts = [
        Account(name: "Based acc", iban: "DK7550518734756287", kind: .Checkings),
        Account(name: "Boligopsparing", iban: "DK9050513319972256", kind: .Savings),
        Account(name: "To the moon", iban: "DK0450516579497881", kind: .Investment)
    ]
}
