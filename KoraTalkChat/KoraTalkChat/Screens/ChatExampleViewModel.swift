//
//  KoraTalkChat
//
//  Created by Pavel Mac on 9/11/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import Foundation
import Combine
import ExyteChat

final class KoraTalkChatViewModel: ObservableObject {
    @Published var messages: [Message] = []
    
    var chatTitle: String {
        interactor.otherSenders.count == 1 ? interactor.otherSenders.first!.name : "Group chat"
    }
    var chatStatus: String {
        interactor.otherSenders.count == 1 ? "online" : "\(interactor.senders.count) members"
    }
    var chatCover: URL? {
        interactor.otherSenders.count == 1 ? interactor.otherSenders.first!.avatar : nil
    }

    private let interactor: ChatInteractorProtocol
    private var subscriptions = Set<AnyCancellable>()

    init(interactor: ChatInteractorProtocol = MockChatInteractor()) {
        self.interactor = interactor
    }

    func send(draft: DraftMessage) {
        interactor.send(draftMessage: draft)
    }
    
    func onStart() {
        interactor.messages
            .compactMap { messages in
                messages.map { $0.toChatMessage() }
            }
            .assign(to: &$messages)

        interactor.connect()
    }

    func onStop() {
        interactor.disconnect()
    }

    func loadMoreMessage(before message: Message) {
        interactor.loadNextPage()
            .sink { _ in }
            .store(in: &subscriptions)
    }
}