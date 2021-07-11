# ChatBox by Paweł Szymański

## Architecture

In general application follows the priniciples of [Clean Swift (VIP)](https://clean-swift.com/handbook/) architecture. 

## Unit Tests

I've added only tests for ChatInteractor, but this should present nicely the full concept I usually follow. Utilisning spy's and stub's to mock helps customise all preconditions before running the tested function and later helps asserting the expected results. 

```swift
class MessagesServiceMock: MessagesService {
    lazy var getMessagesSpy = spy(of: getMessages(completion:))
    lazy var getMessagesStub = softStub(of: getMessages(completion:))
    func getMessages(completion: @escaping (Result<[Message], Error>) -> Void) {
        getMessagesSpy.didCall(params: completion)
        getMessagesStub?(completion)
    }
    
    lazy var sendMessageSpy = spy(of: sendMessage(text:completion:))
    lazy var sendMessageStub = softStub(of: sendMessage(text:completion:))
    func sendMessage(text: String, completion: @escaping (Result<Message, Error>) -> Void) {
        sendMessageSpy.didCall(params: (text, completion))
        sendMessageStub?(text, completion)
    }
}
```

Besides that the rest of the code should be easly testable

## UI Tests

I've added one UI test that checks the happy path and demonstrates the concept of robots which make testing logic highly reusable and significantly simplifies the actual test source code.

```swift
    func testSendingNewMessage() throws {
        chat {
            $0.enterChatMessage(text: "Some Test Message.")
            $0.tapSendButton()
            $0.isMessageViewVisible(with: "Some Test Message.")
        }
    }
```

## Possible improvements

 - View layer implemented with UITableView/UICollectionView to improve performance when dealing with multiple messages.
 - Unit Tests implemented for other classes.
 - UI Tests implemenetd for other user journeys.
 - iPad layouts experiencing some layout issues (to investigate)
