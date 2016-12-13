//
//  Swift3Base64.swift
//  SofibMobile
//
//  Created by JUAN CAMILO PUENTE RIASCOS on 12/7/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import Foundation

extension String {
    //: ### Base64 encoding a string
    func base64Encoded() -> String? {
        if let data = self.data(using: .utf8) {
            return data.base64EncodedString()
        }
        return nil
    }
    
    //: ### Base64 decoding a string
    func base64Decoded() -> String? {
        if let data = Data(base64Encoded: self) {
            return String(data: data, encoding: .utf8)
        }
        return nil
    }
    
}
