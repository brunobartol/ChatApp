//
//  ChatScrollView.swift
//  CrossTalk
//
//  Created by Bruno  Bartol on 26/05/2020.
//  Copyright © 2020 Bruno  Bartol. All rights reserved.
//

import SwiftUI

struct ChatScrollView: View {
    @EnvironmentObject private var viewModel: ChatViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(viewModel.messages) { message in
                    MessageView(message: message)
                }
            }
        }
    }
}

struct ChatScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ChatScrollView()
    }
}
