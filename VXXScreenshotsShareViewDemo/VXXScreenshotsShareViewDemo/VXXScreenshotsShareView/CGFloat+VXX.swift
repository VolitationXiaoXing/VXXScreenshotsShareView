//
//  CGFloat+VXX.swift
//  shikee
//
//  Created by Volitation小星 on 17/7/27.
//  Copyright © 2017年 shikee. All rights reserved.
//   x : self = x : p6

import UIKit

extension CGFloat{
    
    func autoFit()->CGFloat{
        
        let max = UIScreen.main.bounds.height > UIScreen.main.bounds.width ? UIScreen.main.bounds.height :UIScreen.main.bounds.width
        
        return max / 667 * self
        
    }
}

func CGFloatAutoFit(_ float:CGFloat)->CGFloat {
    let max = UIScreen.main.bounds.height > UIScreen.main.bounds.width ? UIScreen.main.bounds.height :UIScreen.main.bounds.width
    return max / 667 * float
}

class VXXFloat: NSObject {
   
    class func CGFloatAutoFit(_ float:CGFloat)->CGFloat {
        let max = UIScreen.main.bounds.height > UIScreen.main.bounds.width ? UIScreen.main.bounds.height :UIScreen.main.bounds.width
        
        return max / 667 * float
    }
}
