//
//  MessengerListView.swift
//  SwiftUIMessenger
//
//  Created by Nika Jamatashvili on 06.12.23.
//

import SwiftUI

struct ChatItem: Identifiable {
    let id = UUID()
    let name: String
    let message: String
    let time: String
    let imageName: String
}

struct MessengerListView: View {
    @State var chatData: [ChatItem] = [
        ChatItem(name: "Alice Johnson", message: "Hello there!", time: "18:14", imageName: "image1"),
        ChatItem(name: "Bob Smith", message: "How are you?", time: "Yesterday", imageName: "image2"),
        ChatItem(name: "Emma Williams", message: "Nice to meet you!", time: "15:30", imageName: "image3"),
        ChatItem(name: "James Brown", message: "What's up?", time: "10:45", imageName: "image4"),
        ChatItem(name: "Olivia Davis", message: "How's it going?", time: "Yesterday", imageName: "image5"),
        ChatItem(name: "William Taylor", message: "Good morning!", time: "09:00", imageName: "image6"),
        ChatItem(name: "Sophia Anderson", message: "Great to see you!", time: "17:20", imageName: "image7"),
        ChatItem(name: "Michael Martinez", message: "Hi!", time: "16:00", imageName: "image8"),
        ChatItem(name: "Emily Garcia", message: "Long time no see.", time: "Yesterday", imageName: "image9"),
        ChatItem(name: "Jacob Rodriguez", message: "How have you been?", time: "14:00", imageName: "image10"),
    ]
    
    @State var backupData: [ChatItem] = []
    
    init() {
        configureNavigationBar()
    }
    
    var body: some View {
            NavigationStack {
                ZStack {
                    Color.black.opacity(0.8).edgesIgnoringSafeArea(.all)
                    VStack {
                        if chatData.isEmpty {
                            Spacer()
                        } else {
                            chatListView
                        }
                        actionButtons
                    }
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            Text("Chat")
                                .font(Font.title2.weight(.bold))
                                .foregroundColor(.white)
                        }
                    }
                }
            }
        }
    
        private var chatListView: some View {
            List(chatData) { chat in
                chatRow(for: chat)
                    .listRowBackground(Color(UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)))
                    .listRowSeparatorTint(Color.gray)
            }
            .listStyle(.grouped)
            .scrollContentBackground(.hidden)
        }
    
    private func chatRow(for chat: ChatItem) -> some View {
        HStack(spacing: 16) {
            Image(chat.imageName)
                .resizable()
                .frame(width: 40, height: 40)
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
            VStack(alignment: .leading, spacing: 8) {
                Text(chat.name)
                    .font(.headline)
                    .foregroundColor(.white)
                Text(chat.message)
                    .lineLimit(1)
                    .foregroundColor(.gray)
            }
            Spacer()
            Text(chat.time)
                .font(.caption)
                .foregroundColor(.gray)
        }
    }
    
    private var actionButtons: some View {
            HStack(spacing: 12) {
                Button("Clear Chat") {
                    backupData = chatData
                    chatData.removeAll()
                }
                .buttonStyle(CustomButtonStyle(buttonWidth: 120, buttonHeight: 24))

                Button("Reset") {
                    chatData = backupData
                }
                .buttonStyle(CustomButtonStyle(buttonWidth: 120, buttonHeight: 24))
            }
            .frame(height: 48)
            .padding()
        }

    private func configureNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(Color(UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)))
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}

struct CustomButtonStyle: ButtonStyle {
        var buttonWidth: CGFloat
        var buttonHeight: CGFloat

        func makeBody(configuration: Self.Configuration) -> some View {
            configuration.label
                .foregroundColor(.white)
                .frame(width: buttonWidth, height: buttonHeight)
                .padding()
                .background(Color.blue)
                .cornerRadius(8)
                .font(Font.title3.weight(.semibold))
        }
    }

struct MessengerListView_Previews: PreviewProvider {
    static var previews: some View {
        MessengerListView()
    }
}
