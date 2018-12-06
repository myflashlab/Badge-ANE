//
//  BaseClassBadge.h
//  badge
//
//  Created by Hadi Tavakoli on 10/23/16.
//  Copyright © 2016 Hadi Tavakoli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BaseClassBadge : NSObject <UIAlertViewDelegate>
{
    BOOL okIsTouch;
}

@property (nonatomic) BOOL okIsTouch;

- (void) isTestVersion;

@end
