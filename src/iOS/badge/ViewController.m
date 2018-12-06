//
//  ViewController.m
//  badge
//
//  Created by Ali Tavakoli on 10/23/16.
//  Copyright © 2016 Ali Tavakoli. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    UIUserNotificationSettings* notificationSettings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound categories:nil];
    
    [[UIApplication sharedApplication] registerUserNotificationSettings:notificationSettings];
    
    
    
    
    
    NSInteger badge = [UIApplication sharedApplication].applicationIconBadgeNumber;
    
    NSLog(@"badge = %d", badge);
    
    [UIApplication sharedApplication].applicationIconBadgeNumber = 1;
    
    NSLog(@"badge = %d", badge);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
