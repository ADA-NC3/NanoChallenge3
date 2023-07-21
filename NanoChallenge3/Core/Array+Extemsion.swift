//
//  Array+Extemsion.swift
//  NanoChallenge3
//
//  Created by Falah Hasbi Assidiqi on 19/07/23.
//

import Foundation

extension Array {
    subscript(safe index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
