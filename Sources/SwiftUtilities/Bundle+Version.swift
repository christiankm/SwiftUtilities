//
//  Bundle+VersionNumber.swift
//
//
//  Created by Christian Mitteldorf on 14/01/2020.
//

import Foundation

extension Bundle {

    public var releaseVersionNumber: String {
        infoDictionary!["CFBundleShortVersionString"] as! String
    }

    public var buildVersionNumber: String {
        infoDictionary!["CFBundleVersion"] as! String
    }
}
