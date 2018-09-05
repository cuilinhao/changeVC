//
//  MOBView.m
//  MOBTT
//
//  Created by 崔林豪 on 2018/9/4.
//  Copyright © 2018年 崔林豪. All rights reserved.
//

#import "MOBView.h"

#import "Masonry.h"


@interface MOBView ()

@property (nonatomic, strong)UIView *bottomLine;
@property (nonatomic, strong) UIButton *currentSelectedBtn;
@property (nonatomic, assign) NSInteger currentOrderType;
@property (nonatomic, assign) NSInteger currentSelectType;



@end

@implementation MOBView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self _initUI];
        self.userInteractionEnabled = YES;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


- (void)_initUI
{
    
    NSArray *titlesArr = @[@"最新",@"热门",@"精华",@"置顶"];
    UIView *lastView = nil;
    CGFloat width = ([UIScreen mainScreen].bounds.size.width - 276)/4;
    for (NSInteger i = 0; i < 3; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:btn];
        [self.buttonsArr addObject:btn];
       
        [btn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        [btn setTitle:titlesArr[i] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(typeClick:) forControlEvents:UIControlEventTouchUpInside];
        
        btn.tag = 20 + i;
        if (i == 0) {
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(78);
                make.top.bottom.mas_equalTo(-2);
            }];
        }else {
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(lastView.mas_right).mas_equalTo(width);
                make.top.bottom.mas_equalTo(-2);
            }];
        }
        lastView = btn;
    }
    UIButton *btn = [self viewWithTag:20];
    
    
    //下划线
    UIView *bottomLine = [[UIView alloc] init];
    [self addSubview:bottomLine];
    [bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lastView.mas_bottom).offset(0);
        make.centerX.mas_equalTo(lastView);
        make.size.mas_equalTo(CGSizeMake(30, 2));
    }];
    bottomLine.backgroundColor = [UIColor orangeColor];
    
    self.bottomLine = bottomLine;
    
    self.bottomLine.hidden = YES;
    
    
    [self typeClick:btn];
    
}

- (void)typeClick:(UIButton *)sender
{
    _currentSelectedBtn.selected = NO;
    sender.selected = YES;
    _currentSelectedBtn = sender;
    
    [self.bottomLine mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(_currentSelectedBtn);
        make.top.mas_equalTo(_currentSelectedBtn.mas_bottom).mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(30, 2));
    }];
    
    self.currentSelectType = sender.tag - 20;
    switch (sender.tag) {
        case 20://最新
        {
            [self.delegate selectSegementType:0];
        }
            break;
        case 21://热门
        {
            [self.delegate selectSegementType:1];
        }
            break;
        case 22://精华
        {
            [self.delegate selectSegementType:2];
        }
            break;
        case 23://置顶
        {
            [self.delegate selectSegementType:3];
        }
            break;
            
        default:
            break;
    }
}

@end
