//
//  ViewController.m
//  MOBTT
//
//  Created by 崔林豪 on 2018/9/4.
//  Copyright © 2018年 崔林豪. All rights reserved.
//

#import "ViewController.h"
#import "AViewController.h"
#import "MOBView.h"



#define DZSUIScreen_width [UIScreen mainScreen].bounds.size.width
#define DZSUIScreen_height [UIScreen mainScreen].bounds.size.height



@interface ViewController ()<AtestviewControllerDelegate>


@property (nonatomic, strong)UIViewController *  currentVC ;

@property (nonatomic, strong) AViewController *avc ;

@property (nonatomic, strong) AViewController *bvc ;

@property (nonatomic, strong) AViewController *cvc ;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [ self  test];
}

- (IBAction)ABtn:(id)sender {
    
    
}

- (IBAction)BBtn:(id)sender {
    
    
}

- (IBAction)CBtn:(id)sender {
    
   
}


- (void)test
{
    //在ViewController 中添加其他UIViewController，currentVC是一个UIViewController变量，存储当前显示的viewcontroller
    _avc = [[AViewController alloc] init];
    [self addChildViewController:_avc];
    //addChildViewController 会调用 [child willMoveToParentViewController:self] 方法，但是不会调用 didMoveToParentViewController:方法，官方建议显示调用
    [_avc didMoveToParentViewController:self];
    [_avc.view setFrame:CGRectMake(0, 0, DZSUIScreen_width, DZSUIScreen_height)];
    _avc.view.backgroundColor = [UIColor greenColor];

    _currentVC = _avc;
    [self.view addSubview:_currentVC.view];
    
    
    //这里没有其他addSubview:方法了，就只有一个，而且可以切换视图，是不是很神奇？
    _bvc = [[AViewController alloc] init];
    [_bvc.view setFrame:CGRectMake(0, 0, DZSUIScreen_width, DZSUIScreen_height)];
     [self addChildViewController:_bvc];
    _bvc.view.backgroundColor = [UIColor orangeColor];
    
    _cvc = [[AViewController alloc] init];
    [_cvc.view setFrame:CGRectMake(0, 0, DZSUIScreen_width, DZSUIScreen_height)];
    [self addChildViewController:_cvc];
    _cvc.view.backgroundColor = [UIColor purpleColor];
    
    _avc.adelegate = self;
    _avc.tagType = @"AA";

    _bvc.adelegate = self;
    _bvc.tagType = @"BB";

    _cvc.adelegate = self;
    _cvc.tagType = @"CC";
    

}


#pragma mark - test delegate
- (void)atestviewControllerType:(long)index
{
     [self changeVCWitholdVC:_avc index:index];
}

- (void)btestviewControllerType:(long)index
{
    [self changeVCWitholdVC:_bvc index:index];
}

- (void)ctestviewControllerType:(long)index
{
    [self changeVCWitholdVC:_cvc index:index];
}



- (void)changeVCWitholdVC:(UIViewController *)oldVC  index:(NSInteger)index
{
    switch (index) {
        case 0:
        {
            [self changeControllerFromOldController:oldVC toNewController:_avc];
        }
            break;
        case 1:
        {
            [self changeControllerFromOldController:oldVC toNewController:_bvc];
        }
            break;
        case 2:
        {
            [self changeControllerFromOldController:oldVC toNewController:_cvc];
        }
            break;
        default:
            break;
    }
}


#pragma mark - 切换viewController
- (void)changeControllerFromOldController:(UIViewController *)oldController toNewController:(UIViewController *)newController
{
    if (_currentVC == newController) {
        return;
    }
    [self addChildViewController:newController];
    /**
     *  切换ViewController
     */
    [self transitionFromViewController:oldController toViewController:newController duration:0.3 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        //做一些动画
        
    } completion:^(BOOL finished) {
        
        if (finished) {
            
            //移除oldController，但在removeFromParentViewController：方法前不会调用willMoveToParentViewController:nil 方法，所以需要显示调用
            [newController didMoveToParentViewController:self];
            [oldController willMoveToParentViewController:nil];
            [oldController removeFromParentViewController];
            self.currentVC = newController;
            
        }
        else
        {
            self.currentVC = oldController;
        }
        
    }];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
