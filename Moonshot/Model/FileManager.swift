//
//  FileManager.swift
//  Moonshot
//
//  Created by Saydulayev on 26.12.24.
//

import Foundation


extension FileManager {
    func decode<T: Codable>(_ fileName: String) -> T {
        let url = Self.documentsDirectory.appendingPathComponent(fileName)
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to locate \(fileName) in documents directory")
        }
        
        let decoder = JSONDecoder()
        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Failed to decode \(fileName) from documents directory: \(error.localizedDescription)")
        }
    }

    func encode<T: Codable>(_ value: T, to fileName: String) {
        let url = Self.documentsDirectory.appendingPathComponent(fileName)
        
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        do {
            let data = try encoder.encode(value)
            try data.write(to: url, options: [.atomic, .completeFileProtection])
        } catch {
            fatalError("Failed to encode \(fileName) to documents directory: \(error.localizedDescription)")
        }
    }

    // Helper property to access the documents directory
    static var documentsDirectory: URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
}
