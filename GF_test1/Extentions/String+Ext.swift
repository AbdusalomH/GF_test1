//
//  String+Ext.swift
//  GF_test1
//
//  Created by Abdusalom Hojiev on 3/29/21.
//  Copyright © 2021 Abdusalom Hojiev. All rights reserved.
//

import Foundation


extension String{
    
    func convertDate() -> Date? {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale        = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone      = .current
    
    
        return dateFormatter.date(from: self)
    }
    
    func displayDateFormat() -> String {
        
        guard let date = self.convertDate() else {return "N?A"}
        
        return date.convertToMonthYear()
 
    }
}
