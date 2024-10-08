//
//  AccountsRow.swift
//  BankingApp
//
//  Created by dmu mac 24 on 11/09/2024.
//

import SwiftUI

struct AccountsRow: View {
    let account: Account
    
    var body: some View {
        VStack {
            HStack {
                Text(account.name)
                    .font(.headline.bold())
                Spacer()
                Text("$ \(account.balance)")
                    .font(.headline.bold())
            }
            HStack {
                Text("\(account.kind) account")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                Spacer()
                
            }
            HStack {
                Text("\(account.iban)")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                Spacer()
            }

        }
    }
}

#Preview {
    AccountsRow(account: TestDataAccounts.accounts[0])
}
