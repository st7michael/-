//
//  themeManager.h
//  桥帮主的微博
//
//  Created by Yiqiao on 15/8/21.
//  Copyright (c) 2015年 Yiqiao. All rights reserved.
//

#import "Utils.h"

@implementation Utils

+ (NSDate *)dateFromString:(NSString *)dateString withFormatterStr:(NSString *)formatterStr{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:formatterStr];
    
    
    NSDate *date = [formatter dateFromString:dateString];
    return date;
    
}


+ (NSString *)stringFromDate:(NSDate *)date withFormmaterStr:(NSString *)formatterStr{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:formatterStr];
    NSString *dateString = [formatter stringFromDate:date];
    return  dateString;

    
}

+ (NSString *)weiboDateString:(NSString *)string{
    
     NSString *formatterStr = @"E MMM dd HH:mm:ss Z yyyy";
    NSDate *date = [Utils dateFromString:string withFormatterStr:formatterStr];
    
    NSString *dateString = [Utils stringFromDate:date withFormmaterStr:@"MM-dd HH:mm"];
    return dateString;
    
    
    
}


@end
