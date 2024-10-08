//
//  AccountsDetailView.swift
//  BankingApp
//
//  Created by dmu mac 24 on 11/09/2024.
//

import SwiftUI

struct AccountsDetailView: View {
    var account: Account
    
    @State private var isShowingAddNewTransactionSheet = false
    
    var body: some View {
        List {
            ForEach(account.transactions, id: \.id) { transaction in
                TransactionRowView(transaction: transaction)
            }
            
        }
        Button("Add Transaction") {
            isShowingAddNewTransactionSheet = true
        }
        .sheet(isPresented: $isShowingAddNewTransactionSheet) {
            AddNewTransactionView(account: account, isPresented: $isShowingAddNewTransactionSheet)
                .presentationDetents([.large])
        }
    }
}

#Preview {
    AccountsDetailView(account: TestDataAccounts.accounts[0])
}
