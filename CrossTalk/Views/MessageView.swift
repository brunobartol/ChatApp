//
//  MessageView.swift
//  CrossTalk
//
//  Created by Bruno  Bartol on 26/05/2020.
//  Copyright © 2020 Bruno  Bartol. All rights reserved.
//

import SwiftUI

struct MessageView: View {
    let message: Message
    
    var body: some View {
        VStack {
            Text(self.caption(for: message))
                    .font(.caption)
                    .foregroundColor(.gray)
                
                HStack {
                    if message.isFromLocalUser {
                        Spacer()
                    }
                    
                    Text(message.value)
                        .foregroundColor(.white)
                        .font(.body)
                        .padding()
                        .background(message.isFromLocalUser ? Color.blue : Color.gray)
                        .cornerRadius(20)
                        .padding(.leading, message.isFromLocalUser ? 20 : 8)
                        .padding(.trailing, message.isFromLocalUser ? 8 : 20)
                        .padding(.vertical, 5)
                    
                    if message.isFromLocalUser == false {
                        Spacer()
                    }
                }
            }
        }
    
    private func caption(for message: Message) -> String {
        (message.isFromLocalUser ? "" : "\(message.username)") + "\(message.timestamp)"
    }
}
