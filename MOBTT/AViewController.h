//
//  AViewController.h
//  MOBTT
//
//  Created by 崔林豪 on 2018/9/4.
//  Copyright © 2018年 崔林豪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MOBView.h"



@protocol AtestviewControllerDelegate <NSObject>

- (void)atestviewControllerType:(NSInteger)index;

- (void)btestviewControllerType:(NSInteger)index;

- (void)ctestviewControllerType:(NSInteger)index;

@end




@interface AViewController : UIViewController

@property (nonatomic, strong) MOBView *bView;

@property (nonatomic, strong) NSString *tagType;

@property (nonatomic, weak) id<AtestviewControllerDelegate> adelegate;

//@property (nonatomic, weak) id<BtestviewControllerDelegate> bdelegate;
//
//@property (nonatomic, weak) id<CtestviewControllerDelegate> cdelegate;
//


@end
