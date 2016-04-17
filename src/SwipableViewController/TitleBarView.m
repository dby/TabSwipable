//
//  TitleBarView.m
//
//  modified by dby 2016-04-03.
//
//

#import "TitleBarView.h"
#import "SwipableConfig.h"

@interface TitleBarView ()

@end

@implementation TitleBarView

- (instancetype)initWithFrame:(CGRect)frame andTitles:(NSArray *)titles
{
    self = [super initWithFrame:frame];
    
    if (self) {
        _currentIndex = 0;
        _titleButtons = [NSMutableArray new];
        
        CGFloat buttonWidth     = frame.size.width / titles.count;
        CGFloat buttonHeight    = frame.size.height;
        
        [titles enumerateObjectsUsingBlock:^(NSString *title, NSUInteger idx, BOOL *stop) {
            
            UIButton *button        = [UIButton buttonWithType:UIButtonTypeCustom];
            button.backgroundColor  = [UIColor whiteColor];
            button.titleLabel.font  = [UIFont systemFontOfSize:15];
            
            [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            [button setTitle:title forState:UIControlStateNormal];
            
            button.frame    = CGRectMake(buttonWidth * idx, 0, buttonWidth, buttonHeight);
            button.tag      = idx;
            
            [button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
            
            [_titleButtons addObject:button];
            [self addSubview:button];
            [self sendSubviewToBack:button];
        }];
        
        self.contentSize    = CGSizeMake(frame.size.width, 25);
        self.showsHorizontalScrollIndicator = NO;
        
        UIButton *firstTitle    = _titleButtons[0];
        [firstTitle setTitleColor:[UIColor colorWithRed:TitleColorValue*0 green:TitleColorValue blue:TitleColorValue*0 alpha:1]
                         forState:UIControlStateNormal];
        firstTitle.transform = CGAffineTransformMakeScale(1.20, 1.20);
    }
    
    return self;
}

- (void)onClick:(UIButton *)button
{
    if (_currentIndex != button.tag) {

        UIButton *preTitle              = _titleButtons[_currentIndex];
        preTitle.transform              = CGAffineTransformIdentity;
        preTitle.titleLabel.textColor   = [UIColor grayColor];
        
        button.transform    = CGAffineTransformMakeScale(1.2, 1.2);
        
        [button setTitleColor:[UIColor colorWithRed:TitleColorValue*0 green:TitleColorValue blue:TitleColorValue*0 alpha:1] forState:UIControlStateNormal];
        
        _currentIndex       = button.tag;
        _titleButtonClicked(button.tag);
    }
}

- (void)setTitleButtonsColor
{
    for (UIButton *button in self.subviews) {
        button.backgroundColor = [UIColor clearColor];
    }
}

@end