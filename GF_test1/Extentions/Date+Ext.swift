//
//  Date+Ext.swift
//  GF_test1
//
//  Created by Abdusalom Hojiev on 3/29/21.
//  Copyright © 2021 Abdusalom Hojiev. All rights reserved.
//

import Foundation


extension Date {
    
    
    func convertToMonthYear() -> String {
        
        let dataFomatter = DateFormatter()
        dataFomatter.dateFormat = "MMM d, yyyy"
        return dataFomatter.string(from: self)

    }
  
}
