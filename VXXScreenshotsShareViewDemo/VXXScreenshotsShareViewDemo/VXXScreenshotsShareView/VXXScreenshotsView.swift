//
//  VXXScreenshotsView.swift
//  shikee
//
//  Created by Volitation小星 on 17/7/27.
//  Copyright © 2017年 shikee. All rights reserved.
//

import UIKit

class VXXScreenshotsView: UIView {
    
    var mainView = UIView()
    var imageView = UIImageView()
    var shareview = UIView()
    var superV:UIView
    var closeBtn = UIButton()
    var shareBtns:[VXXShareBtn]
    var line = UIView()
    var label = UILabel()

    init(superV:UIView,shareBtns:[VXXShareBtn]) {
        self.superV = superV
        self.shareBtns = shareBtns
        super.init(frame: superV.bounds)
        
        self.imageView.contentMode = .scaleAspectFill
        self.imageView.layer.cornerRadius = 5
        self.imageView.layer.masksToBounds = true
        self.imageView.backgroundColor = UIColor.red
        
        self.mainView.backgroundColor = UIColor.white
        
        self.mainView.layer.cornerRadius = 8
        self.mainView.layer.masksToBounds = true
        self.closeBtn.setImage(UIImage(named: "close_w"), for: .normal)
        self.closeBtn.addTarget(self, action: #selector(VXXScreenshotsView.closeView), for: .touchUpInside)
        
        self.backgroundColor = UIColor(white: 0, alpha: 0.3)
        
        self.addSubview(mainView)
        self.addSubview(closeBtn)
        self.mainView.addSubview(imageView)
        self.mainView.addSubview(shareview)
        
        for btn in shareBtns {
            self.shareview.addSubview(btn)
        }
        
        self.label.font = UIFont.systemFont(ofSize: 12)
        self.label.textColor = UIColor(hexString: "999999")
        self.label.text = "分享到"
        self.label.backgroundColor = UIColor.white
        
        self.line.backgroundColor = UIColor(hexString: "EEEEEE")
        self.mainView.addSubview(line)
        self.mainView.addSubview(label)
        
        self.setUI()
    }
    
    @objc func closeView(){
        self.removeFromSuperview()
    }
    
    func setUI(){
        
        self.mainView.height = CGFloatAutoFit(320)
        self.mainView.width = VXXFloat.CGFloatAutoFit(370)
        self.mainView.center = CGPoint(x: self.superV.width * 0.5, y: self.superV.height * 0.5)
        
        self.imageView.height = VXXFloat.CGFloatAutoFit(190)
        self.imageView.width = VXXFloat.CGFloatAutoFit(350)
        self.imageView.x = VXXFloat.CGFloatAutoFit(10)
        self.imageView.y = VXXFloat.CGFloatAutoFit(10)
        
        self.shareview.x = 0
        self.shareview.y = self.imageView.height + self.imageView.y + 20
        
        self.shareview.height = (self.mainView.height - self.imageView.height) as CGFloat - VXXFloat.CGFloatAutoFit(30)
        self.shareview.width = self.mainView.width
        
        self.closeBtn.height = VXXFloat.CGFloatAutoFit(25)
        self.closeBtn.width = VXXFloat.CGFloatAutoFit(25)
        
        self.closeBtn.x = self.mainView.x + self.mainView.width - self.closeBtn.width * 0.5
        self.closeBtn.y = self.mainView.y - self.closeBtn.height * 0.5
        
        self.line.width = self.imageView.width - CGFloatAutoFit(40)
        self.line.height = VXXFloat.CGFloatAutoFit(0.5)
        self.line.x = VXXFloat.CGFloatAutoFit(30)
        self.line.y = self.shareview.y - CGFloatAutoFit(0.5)
        
        self.label.sizeToFit()
        self.label.width = label.width + CGFloatAutoFit(20)
        self.label.centerY = self.line.centerY
        self.label.centerX = self.line.centerX
        self.label.textAlignment = .center
        
        var index:CGFloat = 0
        for btn in self.shareBtns {
            btn.width = self.mainView.width/4
            btn.height = shareview.height
            btn.x = index * btn.width
            btn.y = 0
            btn.setNeedsLayout()
            index += 1
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


class VXXShareBtn: UIButton {
    
    init(name:String,icon:String) {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        self.setImage(UIImage(named: icon), for: .normal)
        self.setTitle(name, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        self.setTitleColor(UIColor.init(hexString: "999999"), for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews(){
        super.layoutSubviews()

        self.imageView?.width = VXXFloat.CGFloatAutoFit(40)
        self.imageView?.height = VXXFloat.CGFloatAutoFit(40)
        self.imageView?.x = (self.width - self.imageView!.width) * 0.5
        self.imageView?.y = VXXFloat.CGFloatAutoFit(20)
        
        self.titleLabel?.sizeToFit()
        let yy = self.imageView!.y + self.imageView!.height
        let y = VXXFloat.CGFloatAutoFit(8) + yy
        self.titleLabel?.y = y
        self.titleLabel?.x = (self.width - self.titleLabel!.width) * 0.5
    
    }
    
}
