//
//  ThirdViewController.m
//  Home Work 40
//
//  Created by Антон Нарижный on 10.09.22.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@property (nonatomic) IBOutlet UILabel *titleLabel;


@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.titleLabel.text = self.screenName;
    
    NSLog(self.ThirdViewModel.name);
}



@end
