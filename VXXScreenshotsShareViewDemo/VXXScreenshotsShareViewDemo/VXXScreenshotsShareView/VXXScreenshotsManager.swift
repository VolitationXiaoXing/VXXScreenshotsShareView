//
//  VXXScreenshotsManager.swift
//  shikee
//
//  Created by Volitation小星 on 17/7/27.
//  Copyright © 2017年 shikee. All rights reserved.
//

import UIKit


protocol VXXScreenshotsDelegate:NSObjectProtocol {
    
    func shareBtnClicked(index:Int,image:UIImage)
    
}

class VXXScreenshotsManager: NSObject {
    
    static let instance = VXXScreenshotsManager()
    
    var image = UIImage()
    
    weak var delegate:VXXScreenshotsDelegate?
    
   private override init() {
        super.init()
    

    }
    
    var screenshots:VXXScreenshotsView?
    
    //截屏
    var superView:UIView?
    
    //开启截屏监听
    func startScreenshotsListening(){
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.changeRotate(noti:)), name: NSNotification.Name.UIApplicationDidChangeStatusBarFrame, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(VXXScreenshotsManager.userDidTakeScreenshot(notification:)), name: NSNotification.Name.UIApplicationUserDidTakeScreenshot, object: nil)
    }
    
    //关闭截屏监听
    func stopScreenshotsListening(){
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func userDidTakeScreenshot(notification:Notification){
        
        let image = ScreenShotsTool.imageWithCurrentScreenshot()
        
        let window = UIApplication.shared.keyWindow
        
        let shareBtns = [VXXShareBtn(name: "微信好友", icon: "fx_weixinhaoyou"),VXXShareBtn(name: "朋友圈", icon: "fx_weixinpengyouquan"),VXXShareBtn(name: "QQ", icon: "fx_qqhaoyou"),VXXShareBtn(name: "微博", icon: "fx_xinlangweibo")]
        
        var index = 0
        for btn in shareBtns {
            btn.tag = index + 100
            btn.addTarget(self, action: #selector(self.shareBtnClicked(sender:)), for: .touchUpInside)
            index += 1
        }
        
        var screenshots = VXXScreenshotsView(superV: window!, shareBtns: shareBtns)
        
        self.screenshots = screenshots
        
        if superView != nil {
            screenshots = VXXScreenshotsView(superV: superView!, shareBtns: shareBtns)
        }
        
        if UIDevice.current.orientation == .portrait || UIDevice.current.orientation == .portraitUpsideDown {
            //竖屏
            screenshots.isPortrait = true
            screenshots.imageView.image = image
        }else{
            //横屏
            screenshots.isPortrait = false
            self.image = (image?.imageRotated(byDegrees: 90))!
            screenshots.imageView.image = image?.imageRotated(byDegrees: 90)
        }
        
        //重新布局
        screenshots.setUI()
        
        window?.addSubview(screenshots)
        
    }
    
    @objc func changeRotate(noti:NSNotification){
       
        if UIDevice.current.orientation == .portrait || UIDevice.current.orientation == .portraitUpsideDown {
            //竖屏
            self.screenshots?.isPortrait = true
            UIView.animate(withDuration: 0.25, animations: {
                self.screenshots?.setUI()
            })
            
            
        }else{
            //横屏
            self.screenshots?.isPortrait = false
            UIView.animate(withDuration: 0.25, animations: {
                self.screenshots?.setUI()
            })
        }
        
    }
    
    @objc func shareBtnClicked(sender:VXXShareBtn){
        
        delegate?.shareBtnClicked(index: sender.tag - 100, image: self.image)
        
    }

}
