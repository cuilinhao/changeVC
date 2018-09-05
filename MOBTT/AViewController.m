//
//  AViewController.m
//  MOBTT
//
//  Created by 崔林豪 on 2018/9/4.
//  Copyright © 2018年 崔林豪. All rights reserved.
//

#import "AViewController.h"
#import "MOBView.h"


@interface AViewController ()<iBBSUISegmentViewDelegate>

@end

@implementation AViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, 100, 50)];
    [self.view addSubview:btn];
    
    btn.backgroundColor = [UIColor yellowColor];
    [btn setTitle:@"A" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    self.view.backgroundColor = [UIColor greenColor];
    
    _bView = [[MOBView alloc] initWithFrame:CGRectMake(0, 200, [UIScreen mainScreen].bounds.size.width, 50)];
    
    [self.view addSubview:_bView];
    
    _bView.delegate = self;
    
    
}



#pragma mark - Segement delegate

- (void)selectSegementType:(NSInteger)index
{
    NSLog(@"---- 控制器-AAA----%ld", (long)index);
    
    if ([self.tagType isEqualToString:@"AA"] )
    {
        [self.adelegate atestviewControllerType:index];
    }
    else if ([self.tagType isEqualToString:@"BB"] )
    {
         [self.adelegate btestviewControllerType:index];
    }
    else if ([self.tagType isEqualToString:@"CC"] )
    {
         [self.adelegate ctestviewControllerType:index];
    }
    
}





- (void)btnClicked:(UIButton *)sender
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */


@end
