//
//  RLGalleryController.m
//  VC
//
//  Created by Rafael Lopez on 3/3/17.
//  Copyright © 2017 Rflpz. All rights reserved.
//

#import "RLGalleryController.h"
#import "RLManager.h"
@interface RLGalleryController ()

@end

@implementation RLGalleryController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view layoutIfNeeded];
    self.title = @"GALERIA";
    self.navigationController.navigationBar.barTintColor = [[RLManager sharedInstance] colorFromHexString:@"#FFFFFF"];
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[[RLManager sharedInstance]  colorFromHexString:@"#212121"], NSForegroundColorAttributeName, [UIFont fontWithName:@"Roboto-Regular" size:16], NSFontAttributeName, nil];
}

@end
