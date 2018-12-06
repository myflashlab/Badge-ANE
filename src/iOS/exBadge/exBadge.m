//
//  exBadge.m
//  exBadge
//
//  Created by Hadi Tavakoli on 10/23/16.
//  Copyright © 2016 Hadi Tavakoli. All rights reserved.
//

#import "exBadge.h"
#import "FlashRuntimeExtensions.h"
#import "MyFlashLabsClass.h"
#import "BaseClassBadge.h"
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface exBadge ()

typedef enum
{
    isTestVersion,
    
    registerUserNotification,
    readBadge,
    writeBadge,
    
    defaultEnum
} commandType;

@end

@implementation exBadge

FREContext freContextBadge;
static BaseClassBadge *base = nil;

commandType getEnumTitleBadge(NSString *theType)
{
#define CHECK_ENUM(X)   if([theType isEqualToString:@#X]) return X
    
    CHECK_ENUM(isTestVersion);
    
    CHECK_ENUM(registerUserNotification);
    CHECK_ENUM(readBadge);
    CHECK_ENUM(writeBadge);
    
    return defaultEnum;
    
#undef CHECK_ENUM
}

+ (void) dispatchEventEcode:(NSString *) ecode andElevel:(NSString *) elevel
{
    if (freContextBadge == NULL)
    {
        return;
    }
    
    const uint8_t* enentLevel = (const uint8_t*) [elevel UTF8String];
    const uint8_t* eventCode = (const uint8_t*) [ecode UTF8String];
    FREDispatchStatusEventAsync(freContextBadge, eventCode, enentLevel);
}

// -------------------------------------------------------------------------
FREObject commandBadge(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    FREObject retFREObject = nil;
    
    NSString *command = [MyFlashLabsClass AirToIos_String:argv[0]];
    commandType temp = getEnumTitleBadge(command);
    
    // save the active context from flash
    freContextBadge = ctx;
    
    // make sure the base class is initialized
    if (!base) base = [[BaseClassBadge alloc] init];
    
    UIUserNotificationSettings* notificationSettings;
    
    switch (temp)
    {
        case isTestVersion:
            
            [base isTestVersion];
            
            break;
        case registerUserNotification:
            
            [[MyFlashLabsClass sharedInstance] toTrace:ANE_NAME
                                             className:@"exBadge"
                                                   msg:@"registerUserNotification"];
            
            notificationSettings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound categories:nil];
            
            [[UIApplication sharedApplication] registerUserNotificationSettings:notificationSettings];
            
            break;
        case readBadge:
            
            retFREObject = [MyFlashLabsClass IosToAir_Integer:(int)[UIApplication sharedApplication].applicationIconBadgeNumber];
            
            break;
        case writeBadge:
            
            [UIApplication sharedApplication].applicationIconBadgeNumber = [MyFlashLabsClass AirToIos_Integer:argv[1]];
            
            break;
        default:
            
            retFREObject = [MyFlashLabsClass IosToAir_String:[[MyFlashLabsClass sharedInstance] retriveCommandNotFound]];
            break;
    }
    
    // Return data back to flash
    return retFREObject;
}

void contextInitializerBadge(void* extData, const uint8_t* ctxType, FREContext ctx, uint32_t* numFunctionsToTest, const FRENamedFunction** functionsToSet)
{
    *numFunctionsToTest = 1;
    
    FRENamedFunction* func = (FRENamedFunction*) malloc(sizeof(FRENamedFunction) * *numFunctionsToTest);
    
    func[0].name = (const uint8_t*) "command";
    func[0].functionData = NULL;
    func[0].function = &commandBadge;
    
    *functionsToSet = func;
}

void contextFinalizerBadge(FREContext ctx)
{
    return;
}

void comMyflashlabBadgeExtensionInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet, FREContextFinalizer* ctxFinalizerToSet)
{
    *extDataToSet = NULL;
    *ctxInitializerToSet = &contextInitializerBadge;
    *ctxFinalizerToSet = &contextFinalizerBadge;
}

void comMyflashlabBadgeExtensionFinalizer(void* extData)
{
    return;
}

@end
