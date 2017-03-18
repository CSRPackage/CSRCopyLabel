//
//  CSRCopyLabel.m
//  ECJia
//
//  Created by mac on 16/8/8.
//  Copyright © 2016年 ECJia. All rights reserved.
//可复制内容的label

#import "CSRCopyLabel.h"

@implementation CSRCopyLabel

-(BOOL)canBecomeFirstResponder
{
    return YES;
}
// 可以响应的方法
-(BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    return (action == @selector(copy:));
}
//UILabel默认是不接收事件的，我们需要自己添加touch事件
-(void)attachTapHandler
{
    self.userInteractionEnabled = YES;  //用户交互的总开关
    //双击
    UITapGestureRecognizer *touch = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    touch.numberOfTapsRequired = 2;
    [self addGestureRecognizer:touch];
    //长按手势
    UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [self addGestureRecognizer:longPressGesture];
}

//绑定事件
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self attachTapHandler];
    }
    return self;
}
//同上
-(void)awakeFromNib
{
    [super awakeFromNib];
    [self attachTapHandler];  
    
}
-(void)handleTap:(UIGestureRecognizer*)recognizer
{
    [self becomeFirstResponder];
    UIMenuItem *copyLink = [[UIMenuItem alloc] initWithTitle:@"复制" action:@selector(copy:)];
    [[UIMenuController sharedMenuController] setMenuItems:[NSArray arrayWithObjects:copyLink, nil]];
    [[UIMenuController sharedMenuController] setTargetRect:self.frame inView:self.superview];
    [[UIMenuController sharedMenuController] setMenuVisible:YES animated: YES];
    
    //加个背景色
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:self.text];
    NSDictionary *dic = @{ NSBackgroundColorAttributeName:GreyTwoLevel, };
    [str addAttributes:dic range:NSMakeRange(0, self.text.length)];
    self.attributedText = str;
    
}
//针对于响应方法的实现
-(void)copy:(id)sender
{
    UIPasteboard *pboard = [UIPasteboard generalPasteboard];
    pboard.string = self.text;
    //取消背景颜色
    [self cancleLabelBackColor];
}
//取消label文字的背景颜色
- (void)cancleLabelBackColor
{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:self.text];
    NSDictionary *dic = @{ NSBackgroundColorAttributeName:[UIColor whiteColor], };
    [str addAttributes:dic range:NSMakeRange(0, self.text.length)];
    self.attributedText = str;
}
+ (void)cancleLabelBackColor
{
    [[self alloc] cancleLabelBackColor];
}

@end
