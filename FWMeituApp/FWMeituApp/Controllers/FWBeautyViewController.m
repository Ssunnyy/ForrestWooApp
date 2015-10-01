//
//  FWBeautyViewController.m
//  FWMeituApp
//
//  Created by ForrestWoo on 15-9-19.
//  Copyright (c) 2015年 ForrestWoo co,.ltd. All rights reserved.
//

#define kWidth 50
#define kHeight 67
#define kPoint_Y 590

#import "UIImage+ImageScale.h"
#import "FWBeautyViewController.h"

@interface FWBeautyViewController ()

@end

@implementation FWBeautyViewController

- (id)initWithImage:(UIImage *)image
{
    if (self = [super init]) {
        self.image = image;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor  = [UIColor blackColor];
    
    self.title = @"美化图片";
    
    modeView = [FWButton buttonWithType:UIButtonTypeCustom];
    [modeView setTitle:@"智能优化" forState:UIControlStateNormal];
    [modeView setImage:[UIImage imageNamed:@"icon_function_autoBeauty_a@2x.png"] forState:UIControlStateNormal];
    [modeView setImage:[UIImage imageNamed:@"icon_function_autoBeauty_b@2x.png"] forState:UIControlStateHighlighted];
    [modeView setBackgroundColor:[UIColor clearColor]];
    [modeView.titleLabel setFont:[UIFont systemFontOfSize:10]];
    modeView.frame = CGRectMake(5, kPoint_Y, kWidth, kHeight);
    highlightedTextColor = [UIColor colorWithRed:19 / 255.0 green:105 / 255.0 blue:240 / 255.0 alpha:1.0];
    modeView.highlightedTextColor = highlightedTextColor;
    modeView.topPading = 3;
    [modeView addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];

    UIImageView *tagImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mc_line@2x.png"]];
    tagImage.frame = CGRectMake(60, 600, 1, 57);
    [self.view addSubview:modeView];
    [self.view addSubview:tagImage];
    [self initImageView];
    [self initScrolleView];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)initImageView
{
    self.imageView = [[UIImageView alloc] initWithImage:self.image];
    CGSize size = self.image.size;
    CGFloat imageWidth = size.width;
    CGFloat imageHeight = size.height;
    CGFloat xPoiont = 0;
    CGFloat yPoint = 64;
    if (imageWidth == 375) {
        yPoint = (520 - imageHeight) / 2.0 + 64;
    }
    if (imageHeight == 520) {
        xPoiont = (375 - imageWidth) / 2.0 ;
    }
    
    self.imageView.frame = CGRectMake(xPoiont, yPoint, 375, 520);
    [self.imageView sizeToFit];
    self.imageView.clipsToBounds = YES;
    
    [self.view addSubview:self.imageView];
}

- (void)initScrolleView
{
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(61, kPoint_Y, 375, 67)];
    self.scrollView.contentSize = CGSizeMake(580, 67);
    self.scrollView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.scrollView];
    
    NSArray *normalImageViewImageArr = [NSArray arrayWithObjects:
                                        @"icon_function_edit_a@2x.png", @"icon_function_color_a@2x.png", @"icon_function_stylize_a@2x.png",
                                        @"icon_function_border_a@2x.png", @"icon_function_mohuanbi_a@2x.png", @"icon_function_mosaic_a@2x.png",
                                        @"icon_function_text_a@2x.png", @"icon_function_bokeh_a@2x.png",
                                        nil];
    NSArray *hightlightedImageViewImageArr = [NSArray arrayWithObjects:
                                              @"icon_function_edit_b@2x.png", @"icon_function_color_b@2x.png", @"icon_function_stylize_b@2x.png",
                                              @"icon_function_border_b@2x.png", @"icon_function_mohuanbi_b@2x.png", @"icon_function_mosaic_b@2x.png",
                                              @"icon_function_text_b@2x.png", @"icon_function_bokeh_b@2x.png",
                                              nil];
    NSArray *textArr = [NSArray arrayWithObjects:@"编辑", @"增强", @"特效", @"边框", @"魔幻笔", @"马赛克", @"文字", @"背景虚化", nil];
    
    //ox 4 pad 15
    FWButton *btFunction = nil;
    int viewSpace = 15;
    int begainX = 4;
    for (int i = 0; i < 8; i++) {
        btFunction = [FWButton buttonWithType:UIButtonTypeCustom];
        
        [btFunction setTitle:[textArr objectAtIndex:i] forState:UIControlStateNormal];
        [btFunction setImage:[UIImage imageNamed:[normalImageViewImageArr objectAtIndex:i]] forState:UIControlStateNormal];
        [btFunction setImage:[UIImage imageNamed:[hightlightedImageViewImageArr objectAtIndex:i]] forState:UIControlStateHighlighted];
        [btFunction setBackgroundColor:[UIColor clearColor]];
        [btFunction.titleLabel setFont:[UIFont systemFontOfSize:10]];
        btFunction.frame = CGRectMake(begainX + (kWidth + viewSpace) * i, 0, kWidth, kHeight);
        highlightedTextColor = [UIColor colorWithRed:19 / 255.0 green:105 / 255.0 blue:240 / 255.0 alpha:1.0];
        btFunction.highlightedTextColor = highlightedTextColor;
        btFunction.topPading = 3;
        [btFunction addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.scrollView addSubview:btFunction];
    }
}

- (void)btnClicked:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    NSString *text = [btn titleLabel].text;
    UIImage *image = self.image;
    if (image.size.height > 460) {
        image = [UIImage imageCompressForWidth:self.image targetHeight:460];
    }

    if ([text isEqualToString:@"智能优化"]) {
        NSArray *normalImageArr = [NSArray arrayWithObjects:
                                            @"icon_autobeauty1_a@2x.png", @"icon_autobeauty2_a@2x.png", @"icon_autobeauty4_a@2x.png",
                                            @"icon_autobeauty5_a@2x.png", @"icon_autobeauty6_a@2x.png", @"icon_autobeauty7_a@2x.png",
                                            @"icon_autobeauty3_a@2x.png",
                                            nil];
        NSArray *hightlightedImageArr = [NSArray arrayWithObjects:
                                                  @"icon_autobeauty1_b@2x.png", @"icon_autobeauty2_b@2x.png", @"icon_autobeauty4_b@2x.png",
                                                  @"icon_autobeauty5_b@2x.png", @"icon_autobeauty6_b@2x.png", @"icon_autobeauty7_b@2x.png",
                                                  @"icon_autobeauty3_b@2x.png",
                                                  nil];
        NSArray *textArr = [NSArray arrayWithObjects:@"原图", @"自动", @"美食", @"静物", @"景笔", @"去雾", @"人物", nil];
        FWFunctionViewController *vc = [[FWFunctionViewController alloc] initWithImage:image normalImageArr:normalImageArr highlightedImageArr:hightlightedImageArr textArr:textArr type:text];
        [self presentViewController:vc animated:YES completion:^{
        }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
