//
//  Array+Extension.swift
//  SuperLigApp
//
//  Created by Hakan Adanur on 17.11.2022.
//

import Foundation

extension Array where Element: Equatable {
    var unique: [Element] {
        var uniqueValues: [Element] = []
        forEach { item in
            guard !uniqueValues.contains(item) else { return }
            uniqueValues.append(item)
        }
        return uniqueValues
    }
}
