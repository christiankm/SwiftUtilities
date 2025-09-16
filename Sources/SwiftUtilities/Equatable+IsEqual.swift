//  MIT License
//
//  Copyright (c) 2025 Christian Mitteldorf
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import Foundation

extension Equatable {

    /// Compares any ``Equatable`` type to any other ``Equatable`` type.
    ///
    /// This extension on ``Equatable`` takes advantage of Swift 5.7's ability to
    /// automatically "open" an existential type when you pass it as an argument of
    /// a generic type.
    ///
    /// As an example, this allows comparing any two ``Error``s which conform to
    /// ``Equatable`` but would otherwise need to be unwrapped to the real identity before they
    /// can be compared to each other.
    ///
    ///     ```
    ///     enum NetworkError: Error, Equatable {
    ///         case unreachable
    ///     }
    ///
    ///     let isNetworkError = someError.isEqual(to: NetworkError.unreachable)
    ///     ```
    ///
    /// - Parameter other: Any ``Equatable`` type that should be compared.
    /// - Returns: Whether the other value is of the same type, and equal to ``self``.
    func isEqual<T: Equatable>(to other: T) -> Bool {
        other as? Self == self
    }
}
