//
//  TestRecorder.swift
//  ChatBoxUITests
//
//  Created by Pawel Szymanski on 12/07/2021.
//

import XCTest
import MobileCoreServices
import ImageIO

class TestRecorder {
    private var timer: Timer?
    private var screenShots: [XCUIScreenshot] = []
    private let fps: Int
    private lazy var frameInterval: TimeInterval  = 1.0/Double(fps)
    
    init(fps: Int = 12) {
        self.fps = fps
    }
    
    deinit {
        timer?.invalidate()
        timer = nil
    }
    
    func startRecording() {
        self.timer = Timer.scheduledTimer(withTimeInterval: frameInterval, repeats: true, block: { [weak self] timer in
            guard let self = self else { return }
            let screenShot = XCUIScreen.main.screenshot()
            guard screenShot.pngRepresentation != self.screenShots.last?.pngRepresentation else { return }
            self.screenShots.append(screenShot)
        })
    }
    
    func stopRecording(savingIn testCase: XCTestCase) throws {
        invalidate()
        guard let gifData = createGIF(from: screenShots) else { return }
        testCase.add(XCTAttachment(data: gifData, uniformTypeIdentifier: kUTTypeGIF as String ))
    }
}

private extension TestRecorder {
    func invalidate() {
        timer?.invalidate()
        timer = nil
    }
    
    func createGIF(from screenshots: [XCUIScreenshot]) -> Data? {
        guard let mutableData = CFDataCreateMutable(nil, 0),
              let destination = CGImageDestinationCreateWithData(mutableData, kUTTypeGIF, screenshots.count, nil) else {
            return nil
        }
        
        screenshots
            .map { CGImageSourceCreateWithData($0.pngRepresentation as CFData, nil)! }
            .forEach { CGImageDestinationAddImageFromSource(destination, $0, 0, nil) }

        return mutableData as Data
    }
}
