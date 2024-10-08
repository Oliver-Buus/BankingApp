import SwiftUI

struct AccountsView: View {
    @Environment(StateController.self) private var viewModel: StateController
    
    @State private var deleteOffsets: IndexSet = []
    @State private var isShowingDeleteConfirmation = false
    
    @State private var isAddingAccount = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.accounts, id: \.id) { account in
                    NavigationLink {
                        AccountsDetailView(account: account)
                    } label: {
                        AccountsRow(account: account)
                    }
                    
                }
                .onMove{(source, destination) in
                    viewModel.move(source: source, destination: destination)
                }
                .onDelete{ offsets in
                    deleteOffsets = offsets
                    isShowingDeleteConfirmation = true
                }
            }
            .navigationTitle("Accounts")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    EditButton()
                }
            }
            .sheet(isPresented: $isAddingAccount) {
                AddNewAccountView()
                    .presentationDetents([.large])
            }
            Spacer()
            Button("Add Account") {
                isAddingAccount = true
                
            }
        }
        
    }
}

#Preview {
    AccountsView().environment(StateController())
}
