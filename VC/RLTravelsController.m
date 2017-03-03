//
//  RLTravelsController.m
//  VC
//
//  Created by Rafael Lopez on 3/2/17.
//  Copyright © 2017 Rflpz. All rights reserved.
//

#import "RLTravelsController.h"
#import "RLManager.h"
#import "RLTravelsCell.h"
@interface RLTravelsController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation RLTravelsController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view layoutIfNeeded];
    self.title = @"VIAJES";
    self.navigationController.navigationBar.barTintColor = [[RLManager sharedInstance] colorFromHexString:@"#ffffff"];
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[[RLManager sharedInstance]  colorFromHexString:@"#212121"], NSForegroundColorAttributeName, [UIFont fontWithName:@"Avenir-Medium" size:16], NSFontAttributeName, nil];
    
    NSArray *fontFamilies = [UIFont familyNames];
    
    for (int i = 0; i < [fontFamilies count]; i++)
    {
        NSString *fontFamily = [fontFamilies objectAtIndex:i];
        NSArray *fontNames = [UIFont fontNamesForFamilyName:[fontFamilies objectAtIndex:i]];
        NSLog (@"%@: %@", fontFamily, fontNames);
    }
    _tableView.backgroundColor = [UIColor clearColor];
}
#pragma mark - Delegates table view
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifierCustom = @"RLTravelsCell";
    RLTravelsCell *cell = (RLTravelsCell *)[tableView dequeueReusableCellWithIdentifier:identifierCustom];
    if (cell == nil){
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:identifierCustom owner:self options:nil];
        cell = [nib objectAtIndex:0];
        cell.backgroundColor = [UIColor clearColor];
    }
    if (indexPath.row % 2 == 0) {
        cell.lblPlaceName.text = @"ISLAS\nCOCINAS";
        cell.imgPlace.image = [UIImage imageNamed:@"Spla3.png"];
    }else{
        cell.lblPlaceName.text = @"MARUATA";
        cell.imgPlace.image = [UIImage imageNamed:@"Spla2.png"];
    }
    return cell;
}
@end
