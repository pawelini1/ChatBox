//
//  Stub.swift
//  ChatBoxTests
//
//  Created by Pawel Szymanski on 11/07/2021.
//

func stub<T>(of stubbed: T) -> T {
    fatalError()
}

func stubForProperty<T>(_ stubbed: T) -> () -> T {
    fatalError()
}

func softStub<T>(of stubbed: T) -> T? {
    return nil
}
