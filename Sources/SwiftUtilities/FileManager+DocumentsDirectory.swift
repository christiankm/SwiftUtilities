//
//  FileManager+DocumentsDirectory.swift
//  
//
//  Created by Christian Mitteldorf on 10/04/2020.
//

import Foundation

extension FileManager {

    public func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }

    public func removeItemIfExists(atPath path: URL) throws {
        if fileExists(atPath: path.absoluteString) {
            try removeItem(at: path)
        }
    }
}
