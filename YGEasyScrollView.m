//
//  YGEasyScrollView.m
//  wisdomTown
//
//  Created by lily on 15/12/30.
//  Copyright © 2015年 ygzy. All rights reserved.
//

#import "YGEasyScrollView.h"

@interface YGEasyScrollView ()<UIScrollViewDelegate>

@property (nonatomic,strong) NSArray *images;

@property (nonatomic,strong) NSTimer *timer;

@end



@implementation YGEasyScrollView

-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.isCircle =NO;
        self.rollingInterval=3.5;
        self.scrV.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        self.scrV.pagingEnabled=YES;
        self.scrV.showsHorizontalScrollIndicator=NO;
        self.scrV.bounces =NO;
        self.pageControol.frame =CGRectMake(0, frame.size.height-30, frame.size.width, 30);
        
    }
    return self;
}

- (void)setIsCircle:(BOOL)isCircle
{
    _isCircle = isCircle;
    [self createGuideViewWithImages:self.images];
}

- (void)setIsAutoRolling:(BOOL)isAutoRolling
{
    _isAutoRolling = isAutoRolling;
    [self createGuideViewWithImages:self.images];
}

- (void)createGuideViewWithImages:(NSArray *)images
{
    self.images = images;
    
    if (self.isCircle == NO) {
        for (int i=0; i<images.count; i++) {
            UIImageView *imagV = [[UIImageView alloc] initWithFrame:CGRectMake(i *(self.frame.size.width), 0, self.frame.size.width, self.frame.size.height-10)];
            imagV.image=[UIImage imageNamed:images[i]];
            [self.scrV addSubview:imagV];
            self.scrV.contentSize = CGSizeMake(CGRectGetMaxX(imagV.frame), 0);
        }
        [self.scrV setContentOffset:CGPointMake(0,0)];
    }
    else
    {
        for (int i=0; i<images.count +2; i++) {
            UIImageView *imageV =[[UIImageView alloc] initWithFrame:CGRectMake(i *(self.frame.size.width), 0, self.frame.size.width, self.frame.size.height+15)];
            NSString *path = nil;
            if (i==0) {
                path =images.lastObject;
            }
            else if (i==images.count+1)
            {
                path =images.firstObject;
            }
            else
            {
                path =images[i-1];
            }
            imageV.image = [UIImage imageNamed:path];
            [self.scrV addSubview:imageV];
            self.scrV.contentSize = CGSizeMake(CGRectGetMaxX(imageV.frame), 0);
        }
        [self.scrV setContentOffset:CGPointMake(self.frame.size.width, 0)];
    }
    [self bringSubviewToFront:self.pageControol];
    self.pageControol.numberOfPages =images.count;
    self.pageControol.currentPage =0;
    
    if (self.isAutoRolling) {
        [self.timer setFireDate:[NSDate dateWithTimeIntervalSinceNow:self.rollingInterval]];
    }
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self setPagesWithScrollview:scrollView];
}

-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    [self setPagesWithScrollview:scrollView];
}

-(void)setPagesWithScrollview:(UIScrollView *)scrollV
{
    NSInteger page = scrollV.contentOffset.x/ self.frame.size.width;
    if (self.isCircle == YES) {
        if (page==0) {
            [scrollV setContentOffset:CGPointMake(self.frame.size.width*(self.images.count), 0) animated:NO];
            self.pageControol.currentPage=self.images.count-1;
        }
        else if (page==self.images.count+1)
        {
            [scrollV setContentOffset:CGPointMake(self.frame.size.width, 0) animated:NO];
            self.pageControol.currentPage =0;
        }
        else
        {
            self.pageControol.currentPage = page -1;
        }
    }
    else
    {
        self.pageControol.currentPage =page;
    }
}

-(void)timerAction
{
    [self.scrV setContentOffset:CGPointMake(self.scrV.contentOffset.x+self.frame.size.width, 0) animated:YES];
}

#pragma mark   --------懒加载－－－－－－－－－－－

-(NSTimer *)timer
{
    if (!_timer) {
        _timer=[NSTimer scheduledTimerWithTimeInterval:self.rollingInterval target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    }
    return _timer;
}

- (UIPageControl *)pageControol
{
    if (!_pageControol) {
        _pageControol=[[UIPageControl alloc] init];
        [self addSubview:_pageControol];
    }
    return _pageControol;
}


- (UIScrollView *)scrV
{
    if (!_scrV) {
        _scrV =[[UIScrollView alloc] init];
        _scrV.delegate=self;
        _scrV.backgroundColor =[UIColor yellowColor];
        [self addSubview:_scrV];
    }
    
    return _scrV;
}


@end
