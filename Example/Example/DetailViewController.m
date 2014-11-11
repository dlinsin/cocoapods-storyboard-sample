//
//  DetailViewController.m
//  Example
//
//  Created by David Linsin on 11/11/14.
//  Copyright (c) 2014 furryfishapps. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)press:(id)sender {
    // Note that we don't directly pull the storyboard here. Instead, we pull the bundle our storyboard
    // is in our of the main bundle, then retrieve the storyboard from that inner bundle.
    NSString *samplePodBundlePath = [[NSBundle mainBundle] pathForResource:@"storyboards-sample" ofType:@"bundle"];
    NSBundle *sampleBundle = [NSBundle bundleWithPath:samplePodBundlePath];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"TestLocalization" bundle:sampleBundle];
    UIViewController *testController = [storyboard instantiateInitialViewController];
    [self presentViewController:testController animated:YES completion:nil];
}

@end
