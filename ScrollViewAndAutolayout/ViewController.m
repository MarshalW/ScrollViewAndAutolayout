//
//  ViewController.m
//  ScrollViewAndAutolayout
//
//  Created by Marshal Wu on 14-10-16.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    __weak IBOutlet UIScrollView *scrollView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initContentView];
}

-(void)initContentView{
    UIView *contentView=[[[NSBundle mainBundle] loadNibNamed:@"ContentView" owner:self options:nil] objectAtIndex:0];
    contentView.frame=CGRectMake(0, 0, scrollView.bounds.size.width, contentView.bounds.size.height);
    [scrollView addSubview:contentView];
    scrollView.contentSize=contentView.bounds.size;
}

@end
