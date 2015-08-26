//
//  moreTableViewCell.m
//  桥帮主的微博
//
//  Created by Yiqiao on 15/8/21.
//  Copyright (c) 2015年 Yiqiao. All rights reserved.
//

#import "moreTableViewCell.h"
#import "UIViewExt.h"
@implementation moreTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self _createSubview];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(didChange) name:themeDidChangeNotification object:nil];
        
    }
    return self;
}

- (void)didChange{
    self.backgroundColor = [[themeManager shareInstance]getThemeColor:@"More_Item_color"];
}

- (void)_createSubview{
    _themeImageView = [[themeImageView alloc] initWithFrame:CGRectMake(7, 7, 30, 30)];
    
    _themeTextLabel = [[themeLabel alloc] initWithFrame:CGRectMake(_themeImageView.right+5, 11, 200, 20)];
    
    _themeDetailLabel = [[themeLabel alloc] initWithFrame:CGRectMake(self.right-95, 11, 95, 20)];
    
    _themeTextLabel.font = [UIFont boldSystemFontOfSize:16];
    _themeTextLabel.backgroundColor = [UIColor clearColor];
    _themeTextLabel.themeLabelColor = @"More_Item_Text_color";
    
    _themeDetailLabel.font = [UIFont boldSystemFontOfSize:15];
    _themeDetailLabel.backgroundColor = [UIColor clearColor];
    _themeDetailLabel.themeLabelColor = @"More_Item_Text_color";
    _themeDetailLabel.textAlignment = NSTextAlignmentRight;
    
    [self.contentView addSubview:_themeImageView];
    [self.contentView addSubview:_themeTextLabel];
    [self.contentView addSubview:_themeDetailLabel];
    
}

- (void)themeChangeAction{
    self.backgroundColor = [[themeManager shareInstance]getThemeColor:@"More_Item_color"];
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
