//
//  YGConstant.h
//  wisdomTown
//
//  Created by lily on 15/12/30.
//  Copyright © 2015年 ygzy. All rights reserved.
//

#ifndef YGConstant_h
#define YGConstant_h

#define ios7_or_later  [UIDevice currentDevice].systemVersion.floatValue>=7.0

#define ios8_or_later  [UIDevice currentDevice].systemVersion.floatValue>=8.0

#define UIColorRGBA(_r,_g,_b,_a) [UIColor colorWithRed:_r/255.f green:_g/255.f blue:_b/255.f alpha:_a]

#define UIColorRGB(_r,_g,_b) UIColorRGBA(_r,_g,_b,1)


#define SCR_W [UIScreen mainScreen].bounds.size.width

#define SCR_H [UIScreen mainScreen].bounds.size.height


#endif /* YGConstant_h */
