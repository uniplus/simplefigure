//
//  ADTViewController.m
//  simplefigure
//
//  Created by 秋山 高弘 on 2014/03/15.
//  Copyright (c) 2014年 Silver Frontier. All rights reserved.
//

#import "SVFViewController.h"

#import "GenerateImageUtil.h"

@interface SVFViewController ()

@end

@implementation SVFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self createImageView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)createImageView
{
    CGRect rect         = CGRectMake(0, 0, 16, 16);
    UIColor* color      = [UIColor blueColor];
    float cornerRadius  = 2.0f;
    CGFloat lineWidth   = 2.0f;

   NSArray* images =
    @[
      [GenerateImageUtil imageWithColor:color rect:rect],
      [GenerateImageUtil imageWithColor:color rect:rect cornerRadius:cornerRadius],
      [GenerateImageUtil imageForUPArrow:color rect:rect],
      [GenerateImageUtil imageForDOWNArrow:color rect:rect],
      [GenerateImageUtil imageForRightArrow:color rect:rect],
      [GenerateImageUtil imageForLeftArrow:color rect:rect],
      [GenerateImageUtil imageForRightArrowHead:color rect:rect lineWidth:lineWidth],
      [GenerateImageUtil imageForLeftArrowHead:color rect:rect lineWidth:lineWidth],
      [GenerateImageUtil imageForCircle:color rect:rect],
       ];
    float offsetX=0,offsetY=0;
    for (UIImage* image in images) {
        UIImageView* imagesView = [[UIImageView alloc] initWithImage:image];
        imagesView.contentMode  = UIViewContentModeCenter;
        imagesView.frame        = CGRectMake(offsetX, offsetY, self.view.bounds.size.width, 44);
        [self.view addSubview:imagesView];
        offsetY += 44;
    }
}
/*
+(UIImage*)imageWithColor:(UIColor*)color rect:(CGRect)rect;
+(UIImage*)imageWithColor:(UIColor *)color rect:(CGRect)rect cornerRadius:(float)cornerRadius;
+(UIImage*)imageForUPArrow:(UIColor*)color rect:(CGRect)rect;
+(UIImage*)imageForDOWNArrow:(UIColor*)color rect:(CGRect)rect;
+(UIImage*)imageForRightArrow:(UIColor*)color rect:(CGRect)rect;
+(UIImage*)imageForLeftArrow:(UIColor*)color rect:(CGRect)rect;
+(UIImage*)imageForRightArrowHead:(UIColor*)color rect:(CGRect)rect lineWidth:(CGFloat)lineWidth;
+(UIImage*)imageForLeftArrowHead:(UIColor*)color rect:(CGRect)rect lineWidth:(CGFloat)lineWidth;
+(UIImage*)imageForCircle:(UIColor*)color rect:(CGRect)rect;
 */
@end
