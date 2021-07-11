//
//  Spy.swift
//  ChatBoxTests
//
//  Created by Pawel Szymanski on 11/07/2021.
//

func spy<Params, Output>(of function: (Params) -> Output) -> FunctionSpy<Params> {
    return .init()
}

func spy<Params, Output>(of function: (Params) throws -> Output) -> FunctionSpy<Params> {
    return .init()
}

class FunctionSpy<Params> {
    var calls: [Params] = []
    
    func didCall(params: Params) {
        calls.append(params)
    }
    
    subscript(index: Int) -> Params? {
        guard calls.count > index else { return nil }
        return calls[index]
    }
}

extension FunctionSpy {
    var firstCall: Params? {
        return calls.first
    }
    
    var lastCall: Params? {
        return calls.last
    }
    
    var wasCalled: Bool {
        return !calls.isEmpty
    }
    
    var wasNotCalled: Bool {
        return !wasCalled
    }
}

extension FunctionSpy where Params == Void {
    func didCall() {
        calls.append(())
    }
}
