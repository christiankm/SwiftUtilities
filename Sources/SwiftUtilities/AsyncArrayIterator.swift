//
//  AsyncArrayIterator.swift
//  
//
//  Created by Christian Mitteldorf on 12/12/2022.
//

import Foundation

struct AsyncArrayIterator<T>: AsyncSequence, AsyncIteratorProtocol {

    typealias Element = T

    let elements: [Element]
    private var index = 0

    init(elements: [T]) {
        self.elements = elements
    }

    @available(macOS 10.15.0, *)
    mutating func next() async throws -> Element? {
        guard !Task.isCancelled,
              index <= elements.count - 1 else { return nil }

        let result = elements[index]
        index += 1
        return result
    }

    func makeAsyncIterator() -> AsyncArrayIterator {
        self
    }
}
