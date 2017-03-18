//
//  ViewController.m
//  CSRCopyLabel
//
//  Created by 曹书润 on 2017/3/18.
//  Copyright © 2017年 LeoAiolia. All rights reserved.
//

#import "ViewController.h"
#import "CSRCopyLabel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CSRCopyLabel *label = [[CSRCopyLabel alloc] init];
    label.text = @"长按或双击复制文本";
    label.bounds = CGRectMake(0, 0, 200, 50);
    label.center = self.view.center;
    [self.view addSubview:label];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
