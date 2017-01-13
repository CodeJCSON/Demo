//
//  ViewController.m
//  Demo
//
//  Created by 志恒李-ly on 16/9/2.
//  Copyright © 2016年 志恒李. All rights reserved.
//

#import "ViewController.h"
#import "LYScrollView.h"
#import "UIImageEffects.h"

@interface ViewController ()<LYScrollViewDelegate>

@property (nonatomic, strong) LYScrollView * scrollView;
@property (nonatomic, strong) NSMutableArray * itmeArray;
@property (nonatomic, strong) UIImageView * imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.imageView];
    self.imageView.backgroundColor = [UIColor whiteColor];
    
    self.itmeArray = [NSMutableArray array];
    for (NSInteger i = 0; i < 5; i++) {
        
        [self.itmeArray addObject:[UIImage imageNamed:[NSString stringWithFormat:@"%ld.jpg",(long)i]]];
    }
    
    self.imageView.image = [self blurViewByLightEffectWithImage:self.itmeArray[0]];
    
    self.scrollView = [[LYScrollView alloc] initWithFrame:self.view.frame];
    self.scrollView.delegate = self;
    self.scrollView.isOpenDelete = YES;
    self.scrollView.itmeArray = self.itmeArray;
    [self.view addSubview:self.scrollView];
}


-(void)scrolIndex:(NSInteger)index
{
    if (self.itmeArray.count > index) {
        self.imageView.image = [self blurViewByLightEffectWithImage:self.itmeArray[index]];
    }
}

- (UIImage *)blurViewByLightEffectWithImage:(UIImage *)screenImage
{
    UIImage * blurImage = [UIImageEffects imageByApplyingLightEffectToImage:screenImage];
    return blurImage;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
