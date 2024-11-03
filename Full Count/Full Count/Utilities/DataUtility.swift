//
//  Untitled.swift
//  Full Count
//
//  Created by Wesley Chastain on 11/3/24.
//

import Foundation

class DataUtility {
    
    static let shared = DataUtility()
    
    private init() {}
    
    func clearCustomData() {
        let fileManager = FileManager.default
        if let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
            do {
                let files = try fileManager.contentsOfDirectory(at: documentsDirectory, includingPropertiesForKeys: nil)
                for file in files {
                    try fileManager.removeItem(at: file)
                }
            } catch {
                print("Could not clear custom data: \(error)")
            }
        }
    }

    func clearAppCaches() {
        let fileManager = FileManager.default
        if let cacheDirectory = fileManager.urls(for: .cachesDirectory, in: .userDomainMask).first {
            do {
                let files = try fileManager.contentsOfDirectory(at: cacheDirectory, includingPropertiesForKeys: nil)
                for file in files {
                    try fileManager.removeItem(at: file)
                }
            } catch {
                print("Could not clear cache files: \(error)")
            }
        }
    }

    func deleteEverything() {
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
        
        // clear Cache:
        URLCache.shared.removeAllCachedResponses()
        
        clearCustomData()
        clearAppCaches()
    }

}
