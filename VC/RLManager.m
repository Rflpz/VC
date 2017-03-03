//
//  RLManager.m
//  RJ
//
//  Created by Rafael Lopez on 11/8/16.
//  Copyright © 2016 Rflpz. All rights reserved.
//

#import "RLManager.h"
#import <UIKit/UIKit.h>

@implementation RLManager
#pragma mark - General RLManager
+ (RLManager *)sharedInstance{
    static RLManager *_sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[RLManager alloc] init];
        
    });
    return _sharedInstance;
}
-(Boolean)isLogged{
    _user = [NSUserDefaults standardUserDefaults];
    if ([_user valueForKey:@"isLogged"] && [[_user valueForKey:@"isLogged"]isEqualToString:@"1"]) {
        return true;
    }
    return false;
}
- (void)loginUser:(BOOL)shouldLogin{
    _user = [NSUserDefaults standardUserDefaults];
    if (shouldLogin) {
        [_user setObject:@"1" forKey:@"isLogged"];
    }else{
        [_user setObject:@"0" forKey:@"isLogged"];
    }
    [_user synchronize];
}
- (UIColor *)colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}
- (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
- (void)applyMotionEffectToView:(UIView *)view withMagnitude:(NSNumber *)magnitude{
    UIInterpolatingMotionEffect *xMotion = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    xMotion.maximumRelativeValue = @(magnitude.doubleValue);
    xMotion.minimumRelativeValue = @(- magnitude.doubleValue);
    
    UIInterpolatingMotionEffect *yMotion = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    yMotion.maximumRelativeValue = @(magnitude.doubleValue);
    yMotion.minimumRelativeValue = @(- magnitude.doubleValue);
    
    UIMotionEffectGroup *group = [[UIMotionEffectGroup alloc]init];
    group.motionEffects = @[xMotion, yMotion];
    
    [view addMotionEffect:group];
}
- (void)handlerErrorWithIdentifier:(NSString *)errorTitle withAlert:(void (^)(UIAlertController *))successAlert{
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"Oops!"
                                          message:errorTitle
                                          preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:@"Ok"
                               style:UIAlertActionStyleCancel
                               handler:nil];
    
    [alertController addAction:okAction];
    successAlert(alertController);
}
-(NSString *)getValueOfObjectWithKey:(NSString *)key withSubKey:(NSString *)subKey {
    _user = [NSUserDefaults standardUserDefaults];
    if (![[_user objectForKey:key]  isEqual: @""]) {
        return [_user valueForKeyPath:[NSString stringWithFormat:@"%@.%@",key,subKey]];
    }
    return @"";
}
-(void)saveObject:(NSDictionary *)object inKey:(NSString *)key{
    _user = [NSUserDefaults standardUserDefaults];
    [_user setObject:object forKey:key];
    [_user synchronize];
}

@end
