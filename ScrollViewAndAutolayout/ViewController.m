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
//    __weak IBOutlet UIView *outerView;
    UIView *contentView;
    
    NSLayoutConstraint *widthConstraint;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initContentView];
}

-(void)viewDidLayoutSubviews{
    NSLog(@"view did layout subviews");
    widthConstraint.constant=scrollView.frame.size.width;
    
    //为了兼容iOS7，http://stackoverflow.com/questions/15490140/auto-layout-error
    //iOS8下无需这句话
    [self.view layoutSubviews];
}

-(void)initContentView{
    contentView=[[[NSBundle mainBundle] loadNibNamed:@"ContentView" owner:self options:nil] objectAtIndex:0];
    [scrollView addSubview:contentView];
    
    scrollView.translatesAutoresizingMaskIntoConstraints=NO;
    contentView.translatesAutoresizingMaskIntoConstraints=NO;
    
    //top
    [scrollView addConstraint:[NSLayoutConstraint constraintWithItem:contentView
                                                           attribute:NSLayoutAttributeTop
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:scrollView
                                                           attribute:NSLayoutAttributeTop
                                                          multiplier:1.0
                                                            constant:0]];
    
    //bottom
    [scrollView addConstraint:[NSLayoutConstraint constraintWithItem:contentView
                                                           attribute:NSLayoutAttributeBottom
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:scrollView
                                                           attribute:NSLayoutAttributeBottom
                                                          multiplier:1.0
                                                            constant:0]];
    
    //left
    [scrollView addConstraint:[NSLayoutConstraint constraintWithItem:contentView
                                                           attribute:NSLayoutAttributeLeading
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:scrollView
                                                           attribute:NSLayoutAttributeLeading
                                                          multiplier:1.0
                                                            constant:0]];
    
    //right
    [scrollView addConstraint:[NSLayoutConstraint constraintWithItem:contentView
                                                           attribute:NSLayoutAttributeTrailing
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:scrollView
                                                           attribute:NSLayoutAttributeTrailing
                                                          multiplier:1.0
                                                            constant:0]];
    
    //content.width
    widthConstraint=[NSLayoutConstraint constraintWithItem:contentView
                                                 attribute:NSLayoutAttributeWidth
                                                 relatedBy:NSLayoutRelationEqual
                                                    toItem:nil
                                                 attribute:NSLayoutAttributeNotAnAttribute
                                                multiplier:1.0
                                                  constant:scrollView.frame.size.width];
    [contentView addConstraint:widthConstraint];
    
    //content.height
    [contentView addConstraint:[NSLayoutConstraint constraintWithItem:contentView
                                                            attribute:NSLayoutAttributeHeight
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:nil
                                                            attribute:NSLayoutAttributeNotAnAttribute
                                                           multiplier:1.0
                                                             constant:contentView.frame.size.height]];
}

@end
