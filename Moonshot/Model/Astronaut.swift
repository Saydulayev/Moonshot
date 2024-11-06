//
//  Astronaut.swift
//  Moonshot
//
//  Created by Saydulayev on 02.11.24.
//

import Foundation


struct Astronaut: Codable, Identifiable, Hashable {
    let id: String
    let name: String
    let description: String
}
