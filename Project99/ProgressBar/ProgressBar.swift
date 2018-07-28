//
//  ProgressBarShow.swift
//  Project99
//
//  Created by Dixit, Arun on 28/07/18.
//  Copyright © 2018 Dixit, Arun. All rights reserved.
//

import UIKit

class ProgressBar: NSObject {
    static var myView: P99ProgressLoader?

    class func showProgress() {
        
        myView = UINib.init(nibName: "P99ProgressLoader", bundle: nil).instantiate(withOwner: self)[0] as? P99ProgressLoader
        myView?.center = CGPoint(x: (UIApplication.shared.keyWindow?.frame.size.width)!  / 2,
                                 y: (UIApplication.shared.keyWindow?.frame.size.height)! / 2)
        myView?.layer.cornerRadius = 5
        UIApplication.shared.keyWindow?.addSubview(myView!)
    }
    
    class func hideProgress () {
        myView?.removeFromSuperview()
    }
    
    
}
