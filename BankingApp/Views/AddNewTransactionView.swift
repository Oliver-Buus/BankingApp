//
//  AddNewTransactionView.swift
//  BankingApp
//
//  Created by dmu mac 24 on 11/09/2024.
//

import SwiftUI

struct AddNewTransactionView: View {
    @Environment(StateController.self) private var viewModel: StateController
    @State var account: Account
    @Binding var isPresented: Bool
    
    @State private var amount = 0
    @State private var beneficiary = ""

    var body: some View {
        Form {
            HStack {
                Text("Amount:")
                
                TextField("0", value: $amount, format: .number)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
            }
            TextField("Beneficiary", text: $beneficiary)
            Button("Add transaction") {
                viewModel.addTransaction(withAmount: amount, beneficiary: beneficiary, to: account)
                isPresented = false
            }
        }
    }
}

#Preview {
    AddNewTransactionView(account: TestDataAccounts.accounts[0], isPresented: .constant(true))
        .environment(StateController())
}
