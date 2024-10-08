import SwiftUI

struct AddNewAccountView: View {
    @Environment(StateController.self) private var viewModel: StateController
    @Environment(\.dismiss) private var dismiss

    
    @State private var name = ""
    @State private var selectedKind = Account.Kind.Checkings
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Account name", text: $name)
                Picker("Kind", selection: $selectedKind) {
                    ForEach(Account.Kind.allCases) { kind in
                        Text(kind.rawValue).tag(kind)
                    }
                }.pickerStyle(.segmented)
            }.toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel", role: .cancel) {
                        dismiss()
                    }
                }
            }
            Button("Add Account") {
                viewModel.addAccount(named: name, withKind: selectedKind)
                dismiss()
            }
        }
    }
}

#Preview {
    AddNewAccountView().environment(StateController())
}
