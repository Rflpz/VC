//
//  RLManager.h
//  RJ
//
//  Created by Rafael Lopez on 11/8/16.
//  Copyright © 2016 Rflpz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface RLManager : NSObject
#pragma mark - General RLManager
@property NSUserDefaults *user;

+ (RLManager *)sharedInstance;
-(Boolean)isLogged;
- (void)loginUser:(BOOL)shouldLogin;
- (UIColor *)colorFromHexString:(NSString *)hexString;
- (UIImage *)imageWithImage:(UIImage *)image
               scaledToSize:(CGSize)newSize;
- (void)applyMotionEffectToView:(UIView *)view
                  withMagnitude:(NSNumber *)magnitude;
- (void)handlerErrorWithIdentifier:(NSString *)errorTitle
                         withAlert:(void (^)(UIAlertController *alert))successAlert;
-(NSString *)getValueOfObjectWithKey:(NSString *)key
                          withSubKey:(NSString *)subKey;
- (void)saveObject:(NSDictionary *)object
             inKey:(NSString *)key;
@end
