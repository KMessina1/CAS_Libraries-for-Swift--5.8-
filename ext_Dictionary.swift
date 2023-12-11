//
//--------------------------------------------------------------------------------------------------------------------------
//     File: ext_Dictionary.swift
//   Author: Kevin Messina
//  Created: 6/5/21
// Modified:
// 
// ©2021-2022 Creative App Solutions, LLC. - All Rights Reserved.
//--------------------------------------------------------------------------------------------------------------------------
// NOTES:
//--------------------------------------------------------------------------------------------------------------------------
//

import Foundation

extension Dictionary where Key == String, Value == Any {
    mutating func append(anotherDict:[String:Any]) {
        for (key, value) in anotherDict {
            self.updateValue(value, forKey: key)
        }
    }
}
