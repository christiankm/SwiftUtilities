//
//  AsyncArrayIterator.swift
//  
//
//  Created by Christian Mitteldorf on 12/12/2022.
//

import Foundation

public struct AsyncArrayIterator<T>: AsyncSequence, AsyncIteratorProtocol {

    public typealias Element = T

    public let elements: [Element]
    private var index = 0

    public init(elements: [T]) {
        self.elements = elements
    }

    @available(macOS 10.15.0, *)
    public mutating func next() async throws -> Element? {
        guard !Task.isCancelled,
              index <= elements.count - 1 else { return nil }

        let result = elements[index]
        index += 1
        return result
    }

    public func makeAsyncIterator() -> AsyncArrayIterator {
        self
    }
}
