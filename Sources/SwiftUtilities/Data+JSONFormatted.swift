//
//  Data+JSONFormatted.swift
//  SwiftUtilities
//
//  Created by Christian Mitteldorf on 4/4/2023.
//

import Foundation

extension Data {
    var jsonFormatted: NSString? {
        guard let jsonObject = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(
                  withJSONObject: jsonObject,
                  options: [.prettyPrinted]
              ),
              let prettyJSON = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else {
                  return nil
               }

        return prettyJSON
    }
}
