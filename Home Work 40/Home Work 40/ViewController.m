//
//  ViewController.m
//  Home Work 40
//
//  Created by Антон Нарижный on 10.09.22.
//

#import "ViewController.h"
#import "ViewControllerModel.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (IBAction)didTapOpenNextScreen:(id)sender {
    UIStoryboard *str = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SecondViewController *controller = [str instantiateViewControllerWithIdentifier:@"SecondViewController"];
    
    ViewControllerModel *viewModel = [[ViewControllerModel alloc] init];
    controller.screenName = @"Random Label Name";
    viewModel.name = @"Anton";
    controller.SecondViewModel = viewModel;
    
    [self presentViewController: controller animated: YES completion: nil];
    
    
}

@end
