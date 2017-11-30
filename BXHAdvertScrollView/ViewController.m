//
//  ViewController.m
//  BXHAdvertScrollView
//
//  Created by gg on 2017/11/29.
//  Copyright © 2017年 JayS. All rights reserved.
//

#import "ViewController.h"

#import "TestTImerViewController.h"

#import "BXHAdvertScrollView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    TestTImerViewController *testVC  = [TestTImerViewController new];
//    [self.navigationController pushViewController:testVC animated:YES];
//
    BXHAdvertScrollView *bxhAdScrollView = [[BXHAdvertScrollView alloc] init];
    bxhAdScrollView.frame = CGRectMake(0, 100,self.view.frame.size.width, 20);
    
    //push到下一个vc 计时器并没有停止，需要手动调用方法和置为nil
//    [bxhAdScrollView removeTimer];
    
    [self.view addSubview:bxhAdScrollView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
