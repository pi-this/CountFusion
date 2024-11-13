//
//  RedZoneUtility.swift
//  Full Count
//
//  Created by Wesley Chastain on 11/4/24.
//

import LocalAuthentication


class RedZoneUtility {
    
    static let shared = RedZoneUtility()
    
    private init() {}
    
    func authenticateUser(completion: @escaping (Bool) -> Void) {
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: "Please authenticate to delete all items") { success, authenticationError in
                DispatchQueue.main.async {
                    completion(success)
                }
            }
        } else {
            // No biometry
            DispatchQueue.main.async {
                completion(false)
            }
        }
    }


}
