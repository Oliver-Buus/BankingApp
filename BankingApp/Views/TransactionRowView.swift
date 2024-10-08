//
//  TransactionRowView.swift
//  BankingApp
//
//  Created by dmu mac 24 on 11/09/2024.
//

import SwiftUI

struct TransactionRowView: View {
    let transaction: Transaction
    var body: some View {
        VStack {
            HStack {
                Text(transaction.beneficiary)
                    .font(.headline.bold())
                Spacer()
                Text("$ \(transaction.amount)")
                    .font(.headline.bold())
            }
            HStack {
                Text("\(transaction.date.transactionFormat)")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                Spacer()
                
            }
        }
    }
}

#Preview {
    TransactionRowView(transaction: TestDataAccounts.accounts[0].transactions[0])
}
