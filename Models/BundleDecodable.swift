//
//  File.swift
//  
//
//  Created by Euan on 2024/2/15.
//

import Foundation

extension Bundle {
    func decode(_ file: String) -> [CosmeticModel] {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle")
        }
        
        let decoder = JSONDecoder()
        
        guard let loaded = try? decoder.decode([ CosmeticModel].self, from: data) else {
            fatalError("Failed to decode \(file) from bundle")
        }
        
        return loaded
    }
}
