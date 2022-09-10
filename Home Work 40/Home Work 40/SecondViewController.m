//
//  SecondViewController.m
//  Home Work 40
//
//  Created by Антон Нарижный on 10.09.22.
//

#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "ViewControllerModel.h"

@interface SecondViewController ()

@property (nonatomic) IBOutlet UILabel *titleLabel;
@property (nonatomic) NSMutableString *name2;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.titleLabel.text = self.screenName;
    
    NSLog(self.SecondViewModel.name);
}

- (IBAction)didTapOpenNextScreen:(id)sender {
    UIStoryboard *str = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ThirdViewController *controller = [str instantiateViewControllerWithIdentifier:@"ThirdViewController"];
    
    controller.screenName = self.screenName;
    controller.ThirdViewModel = self.SecondViewModel;
    
    [self presentViewController: controller animated: YES completion: nil];
}

@end
