//
//  PinYinSort.m
//  BlinCityApp
//
//  Created by YANGRui on 13-7-11.
//  Copyright (c) 2013年 YANGRui. All rights reserved.
//

#import "PinYinSort.h"

@implementation PinYinSort


- (NSArray *)sortWithPinyin:(NSArray *)array
{
//   // NSMutableArray *stringsToSort=[NSArray arrayWithObjects:
//                                   @"电脑",
//                                   @"显示器",
//                                   @"你好",
//                                   @"推特",
//                                   @"乔布斯",
//                                   @"再见",
//                                   @"暑假作业",
//                                   @"键盘",
//                                   @"鼠标",
//                                   @"谷歌",
//                                   @"苹果",
//                                   nil];
//    
//    //Step1输出
//    NSLog(@"尚未排序的NSString数组:");
//    for(int i=0;i<[stringsToSort count];i++){
//        NSLog(@"%@",[stringsToSort objectAtIndex:i]);
//    }
    
    
    
    //Step2:获取字符串中文字的拼音首字母并与字符串共同存放
    NSMutableArray *chineseStringsArray = [NSMutableArray array];
    for(int i=0;i<[array count];i++)
    {
        ChineseString *chineseString = [[ChineseString alloc] init];
        
        chineseString.string = [array objectAtIndex:i];
        
        if(chineseString.string == nil)
        {
            chineseString.string = @"";
        }
        
        if(![chineseString.string isEqualToString:@""])
        {
            NSString *pinYinResult=[NSString string];
            for(int j = 0;j < chineseString.string.length;j++)
            {
                NSString *singlePinyinLetter = [[NSString stringWithFormat:@"%c",pinyinFirstLetter([chineseString.string characterAtIndex:j])]uppercaseString];
                
                pinYinResult = [pinYinResult stringByAppendingString:singlePinyinLetter];
            }
            chineseString.pinYin = pinYinResult;
        }
        else
        {
            chineseString.pinYin= @"";
        }
        [chineseStringsArray addObject:chineseString];
    }
    
    //Step2输出
    /*
    NSLog(@"\n\n\n转换为拼音首字母后的NSString数组");
    for(int i=0;i<[chineseStringsArray count];i++){
        ChineseString *chineseString=[chineseStringsArray objectAtIndex:i];
        NSLog(@"原String:%@----拼音首字母String:%@",chineseString.string,chineseString.pinYin);
    }
    */
    
    
    //Step3:按照拼音首字母对这些Strings进行排序
    NSArray *sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"pinYin" ascending:YES]];
    [chineseStringsArray sortUsingDescriptors:sortDescriptors];
    
    //Step3输出
   /* NSLog(@"\n\n\n按照拼音首字母后的NSString数组");
    for(int i=0;i<[chineseStringsArray count];i++){
        ChineseString *chineseString=[chineseStringsArray objectAtIndex:i];
        NSLog(@"原String:%@----拼音首字母String:%@",chineseString.string,chineseString.pinYin);
    }
    */
    // Step4:如果有需要，再把排序好的内容从ChineseString类中提取出来
    NSMutableArray *result=[NSMutableArray array];
    for(int i=0;i<[chineseStringsArray count];i++)
    {
        [result addObject:((ChineseString*)[chineseStringsArray objectAtIndex:i]).string];
    }
    
    //Step4输出
   /* NSLog(@"\n\n\n最终结果:");
    for(int i=0;i<[result count];i++){
        NSLog(@"%@",[result objectAtIndex:i]);
    }
    */
    return result;
}

@end
