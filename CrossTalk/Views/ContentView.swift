import SwiftUI
import MultipeerConnectivity

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @EnvironmentObject private var viewModel: ChatViewModel
    @State private var showActionSheet = false
    
    private let formatter = DateFormatter(dateStyle: .short, timeStyle: .short)
    
    var body: some View {
        NavigationView {
            VStack {
                ReversibleChatScrollView(colorScheme: colorScheme, reversed: true, scrollToEnd: true)
                    .offset(y: viewModel.keyboardOffset + ChatViewModel.safeAreaInsetBottom)
                    .navigationBarTitle(Text(viewModel.appState.rawValue), displayMode: .inline)
                
                ToolbarView(showActionSheet: $showActionSheet)
                    .padding(.bottom, ChatViewModel.safeAreaInsetBottom)
                    .background(colorScheme == .dark ? Color.black : Color.white)
                    .offset(y: viewModel.keyboardOffset + ChatViewModel.safeAreaInsetBottom)
                    .animation(.easeInOut(duration: viewModel.keyboardAnimationDuration))
                
            }
            .animation(.easeInOut)
            .onTapGesture {
                UIApplication.shared.windows
                    .first { $0.isKeyWindow }?
                    .endEditing(true)
            }
        }
        .actionSheet(isPresented: $showActionSheet) {
            ActionSheet(title: Text(viewModel.actionSheetTitle), message: nil, buttons: actionSheetButtons())
        }
    }
    
    private func actionSheetButtons() -> [ActionSheet.Button] {
        var buttons = [ActionSheet.Button]()
        
        switch viewModel.appState {
        case .inactive:
            buttons += [
                .default(Text("Host chat")) {
                    self.viewModel.startAdvertising()
                },
                .default(Text("Join chat")) {
                    self.viewModel.startBrowsing()
                }
            ]
        default:
            buttons += [
                .default(Text("Disconnect")) {
                    self.viewModel.disconnect()
                }
            ]
        }
        
        buttons.append(.cancel())
        return buttons
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
