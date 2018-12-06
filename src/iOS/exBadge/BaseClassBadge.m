//
//  BaseClassBadge.m
//  badge
//
//  Created by Hadi Tavakoli on 10/23/16.
//  Copyright © 2016 Hadi Tavakoli. All rights reserved.
//

#import "BaseClassBadge.h"
#import "MyFlashLabsClass.h"
#import "exBadge.h"

@implementation BaseClassBadge

@synthesize okIsTouch;

- (void) isTestVersion
{
    // If we know at least one ANE is DEMO, we don't need to show demo dialog again. It's already shown once.
    if([[MyFlashLabsClass sharedInstance] hasAnyDemoAne]) return;
    
    // Check if this ANE is registered?
    if([[MyFlashLabsClass sharedInstance] isAneRegistered:ANE_NAME]) return;
    
    // Otherwise, show the demo dialog.
    
    self.okIsTouch = NO;
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"DEMO ANE!"
                                                    message:[NSString stringWithFormat:@"The library '%@' is not registered!", ANE_NAME]
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        self.okIsTouch = YES;
    }
}

@end
