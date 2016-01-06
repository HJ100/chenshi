//
//  YGButton.h
//  wisdomTown
//
//  Created by lily on 16/1/6.
//  Copyright © 2016年 ygzy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YGButton : UIButton

+ (instancetype)buttonWithFrame:(CGRect)frame title:(NSString *)title Image:(NSString *)image  backgroundColor:(UIColor *)color clickCallBack:(void(^)(YGButton *button))callBack;




@end
