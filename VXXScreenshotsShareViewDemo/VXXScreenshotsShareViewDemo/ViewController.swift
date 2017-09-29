//
//  ViewController.swift
//  VXXScreenshotsShareViewDemo
//
//  Created by 小星 on 2017/9/29.
//  Copyright © 2017年 小星. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        VXXScreenshotsManager.instance.startScreenshotsListening()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

