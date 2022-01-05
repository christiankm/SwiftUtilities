//
//  SKProduct+LocalizedPrice.swift
//  
//
//  Created by Christian Mitteldorf on 05/01/2022.
//

#if canImport(StoreKit)
import StoreKit

extension SKProduct {

    public var localizedPrice: String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = priceLocale
        return formatter.string(from: price)
    }
}
#endif

