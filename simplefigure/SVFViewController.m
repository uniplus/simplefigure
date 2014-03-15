//
//  ADTViewController.m
//  simplefigure
//
//  Created by 秋山 高弘 on 2014/03/15.
//  Copyright (c) 2014年 Silver Frontier. All rights reserved.
//

#import "SVFViewController.h"

#import "SVFGenerateImageUtil.h"

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
/*
 247 148 30
 255 232 0
 0 177 106
 20 162 212
 0 82 156
 175 94 156
 */
    CGRect rectSquare      = CGRectMake(0, 0, 16, 16);
    CGRect rectCircle      = CGRectMake(0, 0, 22, 22);
    CGRect rectArrow       = CGRectMake(0, 0, 14, 16);
    CGRect rectUPDOWNArrow = CGRectMake(0, 0, 16, 14);
    CGRect rectArrowHead   = CGRectMake(0, 0, 10, 16);
    NSArray* colors =
    @[
      [UIColor colorWithRed:247.0f/255.0f   green:148.0f/255.0f   blue:30.0f/255.0f     alpha:1.0f],
      [UIColor colorWithRed:255.0f/255.0f   green:232.0f/255.0f   blue:0                alpha:1.0f],
      [UIColor colorWithRed:0               green:177.0f/255.0f   blue:106.0f/255.0f    alpha:1.0f],
      [UIColor colorWithRed:20.0f/255.0f    green:162.0f/255.0f   blue:212.0f/255.0f    alpha:1.0f],
      [UIColor colorWithRed:0               green:82.0f/255.0f    blue:156.0f/255.0f    alpha:1.0f],
      [UIColor colorWithRed:175.0f/255.0f   green:94.0f/255.0f    blue:156.0f/255.0f    alpha:1.0f],
      [UIColor colorWithRed:0.0f            green:0.0f            blue:0.0f             alpha:1.0f],
      [UIColor colorWithRed:1               green:1               blue:1                alpha:1.0f],
    ];
    float cornerRadius  = 2.0f;
    CGFloat lineWidth   = 2.0f;

    NSMutableArray* imagesArray = [NSMutableArray arrayWithCapacity:6];
    for (int i=0; i < [colors count] ; i++) {
        NSArray* images =
        @[
          [SVFGenerateImageUtil imageWithColor:[colors objectAtIndex:i]         rect:rectSquare],
          [SVFGenerateImageUtil imageWithColor:[colors objectAtIndex:i]         rect:rectSquare cornerRadius:cornerRadius],
          [SVFGenerateImageUtil imageForUPArrow:[colors objectAtIndex:i]        rect:rectUPDOWNArrow],
          [SVFGenerateImageUtil imageForDOWNArrow:[colors objectAtIndex:i]      rect:rectUPDOWNArrow],
          [SVFGenerateImageUtil imageForRightArrow:[colors objectAtIndex:i]     rect:rectArrow],
          [SVFGenerateImageUtil imageForLeftArrow:[colors objectAtIndex:i]      rect:rectArrow],
          [SVFGenerateImageUtil imageForRightArrowHead:[colors objectAtIndex:i] rect:rectArrowHead lineWidth:lineWidth],
          [SVFGenerateImageUtil imageForLeftArrowHead:[colors objectAtIndex:i]  rect:rectArrowHead lineWidth:lineWidth],
          [SVFGenerateImageUtil imageForCircle:[colors objectAtIndex:i]         rect:rectCircle],
          ];
        [imagesArray addObject:images];
    }
    float offsetX=0,offsetY=44;
    int counter =0;
    for (NSArray* images in imagesArray) {
        UIView* imageBaseView = [[UIView alloc] initWithFrame:CGRectMake(0, offsetY, self.view.bounds.size.width, 44)];
        for (UIImage* image in images) {
            UIImageView* imagesView = [[UIImageView alloc] initWithImage:image];
            imagesView.contentMode  = UIViewContentModeCenter;
            imagesView.frame        = CGRectMake(offsetX, 0, self.view.bounds.size.width / 9, 44);
            [imageBaseView addSubview:imagesView];
            offsetX += self.view.bounds.size.width / 9;
        }
        [self.view addSubview:imageBaseView];
        offsetX =  0;
        offsetY += 44;
        counter++;
        if (counter>=[colors count]) {
            imageBaseView.backgroundColor = [UIColor blackColor];
        }
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
