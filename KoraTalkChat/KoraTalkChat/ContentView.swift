//
//  KoraTalkChat
//
//  Created by Pavel Mac on 11/11/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import SwiftUI
import ExyteMediaPicker

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Section {
                    NavigationLink("Active chat example") {
                        KoraTalkChatView(
                            viewModel: KoraTalkChatViewModel(interactor: MockChatInteractor(isActive: true)),
                            title: "Active chat example"
                        )
                    }
                    
                    NavigationLink("Simple chat example") {
                        KoraTalkChatView(title: "Simple example")
                    }

                    NavigationLink("Simple comments example") {
                        CommentsExampleView()
                    }
                } header: {
                    Text("Basic examples")
                }
            }
            .navigationTitle("Chat examples")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(.stack)
        
        .mediaPickerTheme(
            main: .init(
                text: .white,
                albumSelectionBackground: .examplePickerBg,
                fullscreenPhotoBackground: .examplePickerBg
            ),
            selection: .init(
                emptyTint: .white,
                emptyBackground: .black.opacity(0.25),
                selectedTint: .exampleBlue,
                fullscreenTint: .white
            )
        )
    }
}
