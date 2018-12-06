//
//  exBadge.h
//  exBadge
//
//  Created by Hadi Tavakoli on 10/23/16.
//  Copyright © 2016 Hadi Tavakoli. All rights reserved.
//

#import <Foundation/Foundation.h>


#define ANE_NAME @"com.myflashlab.air.extensions.badge"

@interface exBadge : NSObject

+ (void) dispatchEventEcode:(NSString *) ecode andElevel:(NSString *) elevel;

@end
