//
//  Healthconcern.swift
//  SMTest
//
//  Created by Wai Yan Pyae Sone on 11/12/23.
//

import Foundation

struct DataModel : Codable {
    let data: [Item]?
}

// MARK: - Datum
struct Item : Codable {
    let id: Int?
    let name: String?
}
