//
//  ScreenShotsTool.h
//  shikee
//
//  Created by Volitation小星 on 17/7/27.
//  Copyright © 2017年 shikee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScreenShotsTool : NSObject

/**
 *  截取当前屏幕
 *
 *  @return NSData *
 */
+ (NSData *)dataWithScreenshotInPNGFormat;


/**
 *  返回当前页面截取到的图片
 *
 *  @return UIImage *
 */
+ (UIImage *)imageWithCurrentScreenshot;


@end
