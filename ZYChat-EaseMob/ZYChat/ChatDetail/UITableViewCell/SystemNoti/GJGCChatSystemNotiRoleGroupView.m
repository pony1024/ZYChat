//
//  GJGCChatSystemNotiRoleGroupView.m
//  ZYChat
//
//  Created by ZYVincent QQ:1003081775 on 14-11-3.
//  Copyright (c) 2014年 ZYProSoft. All rights reserved.
//

#import "GJGCChatSystemNotiRoleGroupView.h"

@interface GJGCChatSystemNotiRoleGroupView ()

@property (nonatomic,assign)CGFloat contentInnerMargin;

/**
 *  等级
 */
@property (nonatomic,strong)GJGCLevelView *levelView;


/**
 *  成员数量
 */
@property (nonatomic,strong)GJCFCoreTextContentView *memberNumberLabel;

@end

@implementation GJGCChatSystemNotiRoleGroupView

- (instancetype)init
{
    if (self = [super init]) {
        
        [self initSubViews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self initSubViews];
    }
    return self;
}

#pragma mark - 内部接口

- (void)initSubViews
{
    
    //level
    self.levelView = [[GJGCLevelView alloc]initWithFrame:(CGRectMake(0, 0,40,30))];
    [self addSubview:self.levelView];
    
    //
    self.memberNumberLabel = [[GJCFCoreTextContentView alloc]init];
    self.memberNumberLabel.textColor = [GJGCCommonFontColorStyle baseAndTitleAssociateTextColor];
    self.memberNumberLabel.font = [GJGCCommonFontColorStyle listTitleAndDetailTextFont];
    self.memberNumberLabel.gjcf_top = 0;
    self.memberNumberLabel.gjcf_left = self.levelView.gjcf_right + 8;
    self.memberNumberLabel.gjcf_width = 80;
    self.memberNumberLabel.contentBaseWidth = 80;
    self.memberNumberLabel.contentBaseHeight = 10;
    self.memberNumberLabel.gjcf_height = 10;
    self.memberNumberLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:self.memberNumberLabel];
    
}

#pragma mark - 对外接口

- (void)setLevel:(NSAttributedString *)level
{
    if ([self.levelView.level isEqualToAttributedString:level]) {
        return;
    }
    
    self.levelView.level = level;
    self.levelView.gjcf_centerY = self.gjcf_height/2;
}

- (void)setMemberCount:(NSAttributedString *)memberCount
{
    if ([self.memberNumberLabel.contentAttributedString isEqualToAttributedString:memberCount]) {
        return;
    }
    
    self.memberNumberLabel.gjcf_size = [GJCFCoreTextContentView contentSuggestSizeWithAttributedString:memberCount forBaseContentSize:self.memberNumberLabel.contentBaseSize];
    self.memberNumberLabel.contentAttributedString = memberCount;
    
    self.gjcf_height = self.memberNumberLabel.gjcf_height;
    self.gjcf_width = self.levelView.gjcf_width + 8 + self.memberNumberLabel.gjcf_width;
    self.levelView.gjcf_centerY = self.gjcf_height/2;
    self.memberNumberLabel.gjcf_left = self.levelView.gjcf_right + 8.f;
}

@end
