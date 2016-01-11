//
//  YGLifeIcon.m
//  wisdomTown
//
//  Created by lily on 16/1/7.
//  Copyright © 2016年 ygzy. All rights reserved.
//

#import "YGLifeIcon.h"

@interface YGLifeIcon ()

/**图标*/
@property (nonatomic,strong)UIImageView *imageIcon;
/**文字*/
@property (nonatomic,strong)UILabel *title;


@end

@implementation YGLifeIcon

-(void)setIconColor:(UIColor *)color ImageIcon:(NSString *)imageIcon title:(NSString *)title
{
    
        self.imageIcon.backgroundColor = color;
        
        self.imageIcon.image = [UIImage imageNamed:imageIcon];
        
        self.title.text = title;

}


-(UIImageView *)imageIcon
{
    if (!_imageIcon) {
        _imageIcon =[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetWidth(self.frame))];
        _imageIcon.layer.cornerRadius = CGRectGetWidth(self.frame)/2.f;
        _imageIcon.clipsToBounds = YES;

        [self addSubview:_imageIcon];
    }
    return _imageIcon;
}

-(UILabel *)title
{
    if (!_title) {
        _title =[[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.imageIcon.frame)+5, CGRectGetWidth(self.imageIcon.frame), 20)];
        _title.font = [UIFont boldSystemFontOfSize:15];
        _title.textAlignment = NSTextAlignmentCenter;
        _title.textColor = [UIColor blackColor];
        [self addSubview:_title];
    }
    return _title;
}




@end
