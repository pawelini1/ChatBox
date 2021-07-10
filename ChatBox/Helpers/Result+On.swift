//
//  Result+On.swift
//  ChatBox
//
//  Created by Pawel Szymanski on 10/07/2021.
//

import Foundation

extension Result {
    func onSuccess(execute: (Success) throws -> Void) rethrows {
        switch self {
        case .success(let wrapped):
            try execute(wrapped)
        case .failure:
            return
        }
    }
    
    func onFailure(execute: (Failure) throws -> Void) rethrows {
        switch self {
        case .success:
            return
        case .failure(let error):
            try execute(error)
        }
    }
}
