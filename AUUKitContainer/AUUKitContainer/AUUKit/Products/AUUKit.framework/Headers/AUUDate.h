//
//  AUUDate.h
//  AUUKit
//
//  Created by 胡金友 on 15/5/19.
//  Copyright (c) 2015年 胡金友. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AUULunarDate;

extern NSTimeInterval const AUUHourSeconds;     /* 一小时的秒数 */
extern NSTimeInterval const AUUDaysSeconds;     /* 一天的秒数 */
extern NSTimeInterval const AUUWeeksSeconds;    /* 一周的秒数 */

@interface NSDate(AUUDate)

/**
 *  @author JyHu, 15-05-19 21:05:36
 *
 *  获取日期的年份
 */
@property (assign, nonatomic, readonly) NSInteger year;

/**
 *  @author JyHu, 15-05-19 21:05:51
 *
 *  获取日期的月份
 */
@property (assign, nonatomic, readonly) NSInteger month;

/**
 *  @author JyHu, 15-05-19 21:05:57
 *
 *  获取日期的日
 */
@property (assign, nonatomic, readonly) NSInteger day;

/**
 *  @author JyHu, 15-05-19 21:05:05
 *
 *  获取日期的小时
 */
@property (assign, nonatomic, readonly) NSInteger hour;

/**
 *  @author JyHu, 15-05-19 21:05:16
 *
 *  获取日期的分钟
 */
@property (assign, nonatomic, readonly) NSInteger minute;

/**
 *  @author JyHu, 15-05-19 21:05:26
 *
 *  获取日期的秒钟
 */
@property (assign, nonatomic, readonly) NSInteger second;

/**
 *  @author JyHu, 15-05-19 21:05:33
 *
 *  获取周几
 */
@property (assign, nonatomic, readonly) NSInteger weekDay;

/**
 *  @author JyHu, 15-05-19 21:05:47
 *
 *  获取当前日期在本月是第几周
 */
@property (assign, nonatomic, readonly) NSInteger weekOfMonth;

/**
 *  @author JyHu, 15-05-19 21:05:11
 *
 *  获取当前日期在本年是第几周
 */
@property (assign, nonatomic, readonly) NSInteger weekOfYear;

/**
 *  @author JyHu, 15-05-19 21:05:26
 *
 *  获取本月有多少天
 *
 *  @return 天数
 */
- (NSInteger)daysOfMonth;

/**
 *  @author JyHu, 15-05-19 21:05:38
 *
 *  获取本月第一天是周几
 *
 *  @return 周几
 */
- (NSInteger)firstWeekdayOfCurMonth;

/**
 *  @author JyHu, 15-05-19 21:05:52
 *
 *  将日期装换为字符串，默认的 yyyy-MM-dd 格式
 *
 *  @return 年月日字符串
 */
- (NSString *)yyyyMMddString;

/**
 *  @author JyHu, 15-05-19 21:05:19
 *
 *  将日期按格式转换成相应的字符串，如果输错则无返回值
 *
 *  @param format 格式化日期的格式
 *
 *  @return 年月日字符串
 */
- (NSString *)yyyyMMddStringWithFormat:(NSString *)format;

/**
 *  @author JyHu, 15-05-19 22:05:20
 *
 *  将日期按格式转换成相应的字符串，默认 HH:mm:ss 格式
 *
 *  @return 时分秒字符串
 */
- (NSString *)HHmmssString;

/**
 *  @author JyHu, 15-05-19 22:05:40
 *
 *  将日期按格式转换成相应的字符串，如果输错则无返回值
 *
 *  @param format 格式化日期的格式
 *
 *  @return 时分秒字符串
 */
- (NSString *)HHmmssStringWithFormat:(NSString *)format;

/**
 *  @author JyHu, 15-05-19 22:05:02
 *
 *  将日期按格式转换成相应的字符串，默认 yyyy-MM-dd HH:mm:ss
 *
 *  @return 年月日时分秒字符串
 */
- (NSString *)yyyyMMddHHmmssString;

/**
 *  @author JyHu, 15-05-19 22:05:14
 *
 *  将日期按格式转换成相应的字符串，如果输错则无返回值
 *
 *  @param format 格式化日期的格式
 *
 *  @return 年月日时分秒字符串
 */
- (NSString *)yyyyMMddHHmmssStringWithFormat:(NSString *)format;

/**
 *  @author JyHu, 15-05-20 16:05:24
 *
 *  @brief  计算两个日期间的天数
 *
 *  @param fDate 开始的日期
 *
 *  @return 天数
 */
- (NSInteger)daysFromDate:(NSDate *)fDate;

/**
 *  @author JyHu, 15-05-20 16:05:40
 *
 *  @brief  农历开始计算的日期天数
 *
 *  @return 天数
 */
- (NSInteger)daysFrom19000130;

/**
 *  @author JyHu, 15-05-20 16:05:58
 *
 *  @brief  一天的开始
 *
 *  @return NSDate
 */
- (NSDate *)dayBegining;

/**
 *  @author JyHu, 15-05-20 16:05:13
 *
 *  @brief  一天的结束
 *
 *  @return NSDate
 */
- (NSDate *)dayEnding;

/**
 *  @author JyHu, 15-05-20 16:05:25
 *
 *  @brief  将阴历转换成阳历
 *
 *  @return AUULunarDate
 */
- (AUULunarDate *)toLunarChineseYearDate;

/**
 *  @author JyHu, 15-05-22 18:05:30
 *
 *  @brief  时间戳转换成时间
 *
 *  @param timestamp 时间戳
 *
 *  @return NSDate
 */
+ (NSDate *)dateWithTimestamp:(NSUInteger)timestamp;

/**
 *  @author JyHu, 15-05-23 16:05:58
 *
 *  比较是否是同一天，忽略时间
 *
 *  @param date 日期
 *
 *  @return BOOL
 */
- (BOOL)isEqualToDateIgnoringTime:(NSDate *)date;

/**
 *  @author JyHu, 15-05-23 16:05:29
 *
 *  判断当前日期是否是昨天
 *
 *  @return BOOL
 */
- (BOOL)isYesterday;

/**
 *  @author JyHu, 15-05-23 16:05:52
 *
 *  判断当前日期是否是今天
 *
 *  @return BOOL
 */
- (BOOL)isToday;

/**
 *  @author JyHu, 15-05-23 16:05:16
 *
 *  判断当前日期是否是明天
 *
 *  @return BOOL
 */
- (BOOL)isTomorrow;

/**
 *  @author JyHu, 15-05-23 16:05:31
 *
 *  判断两个日期是否是在同一周
 *
 *  @param date 要比较的日期
 *
 *  @return BOOL
 */
- (BOOL)isSameWeekWithDate:(NSDate *)date;

/**
 *  @author JyHu, 15-05-23 16:05:59
 *
 *  判断当前日期是否是在上一周
 *
 *  @return BOOL
 */
- (BOOL)isLastWeek;

/**
 *  @author JyHu, 15-05-23 16:05:19
 *
 *  判断当前日期是否是在本周
 *
 *  @return BOOL
 */
- (BOOL)isThisWeek;

/**
 *  @author JyHu, 15-05-23 16:05:37
 *
 *  判断当前日期是否是在下一周
 *
 *  @return BOOL
 */
- (BOOL)isNextWeek;

/**
 *  @author JyHu, 15-05-23 16:05:50
 *
 *  判断当前日期是否比要比较的日期要早
 *
 *  @param date 要比较的日期
 *
 *  @return BOOL
 */
- (BOOL)isEarlierThanDate:(NSDate *)date;

/**
 *  @author JyHu, 15-05-23 16:05:10
 *
 *  判断当前日期是否比要比较的日期要晚
 *
 *  @param date 要比较的日期
 *
 *  @return BOOL
 */
- (BOOL)isLaterThanDate:(NSDate *)date;

/**
 *  @author JyHu, 15-05-23 16:05:36
 *
 *  将当前日期增加几天
 *
 *  @param days 要增加的天数，可正、可负
 *
 *  @return 增加后的日期
 */
- (NSDate *)dateByAddingDays:(NSUInteger)days;

/**
 *  @author JyHu, 15-05-23 16:05:06
 *
 *  将当前日期增加几个小时
 *
 *  @param hours 要增加的小时数，可正、可负
 *
 *  @return 增加后的日期
 */
- (NSDate *)dateByAddingHours:(NSUInteger)hours;

/**
 *  @author JyHu, 15-05-23 16:05:50
 *
 *  将当前日期增加几分钟
 *
 *  @param minutes 要增加的分钟数，可正、可负
 *
 *  @return 增加后的日期
 */
- (NSDate *)dateByAddingMinutes:(NSUInteger)minutes;

@end

@interface NSDate(AUUCalendarDate)

/**
 *  @author JyHu, 15-05-20 10:05:53
 *
 *  @brief  检查要操作的年份是否在可操作的范围内
 *
 *  @param year 年份
 *
 *  @return BOOL
 */
+ (BOOL)checkYearLimit:(NSInteger)year;

/**
 *  @author JyHu, 15-05-20 10:05:44
 *
 *  @brief  获取农历年中闰月的月份
 *
 *  @param year 农历年
 *
 *  @return 闰月的月份，如果为0表示不闰月
 */
+ (NSInteger)getLunarChineseYearLeapMonth:(NSInteger)year;

/**
 *  @author JyHu, 15-05-20 10:05:36
 *
 *  @brief  获取农历年闰月月份的天数
 *
 *  @param year 年份
 *
 *  @return 天数
 */
+ (NSInteger)getLunarChineseYearLeapMonthDays:(NSInteger)year;

/**
 *  @author JyHu, 15-05-20 10:05:21
 *
 *  @brief  获取农历年某一月的天数
 *
 *  @param year  年份
 *  @param month 月份
 *
 *  @return 天数
 */
+ (NSInteger)getLunarChineseYearMonthDaysWithYear:(NSInteger)year month:(NSInteger)month;

/**
 *  @author JyHu, 15-05-20 10:05:08
 *
 *  @brief  获取农历年总共的天数
 *
 *  @param year 年份
 *
 *  @return 天数
 */
+ (NSInteger)getLunarChineseYearDays:(NSInteger)year;

/**
 *  @author JyHu, 15-05-20 10:05:18
 *
 *  @brief  阴历的某年年份是否是闰年
 *
 *  @param year 年份
 *
 *  @return BOOL
 */
+ (BOOL)isSolarChineseYearIsLeapYear:(NSInteger)year;

@end

@interface AUULunarDate : NSObject

/**
 *  @author JyHu, 15-05-20 16:05:51
 *
 *  @brief  农历的年份
 */
@property (assign, nonatomic) NSInteger year;

/**
 *  @author JyHu, 15-05-20 16:05:57
 *
 *  @brief  农历的月份
 */
@property (assign, nonatomic) NSInteger month;

/**
 *  @author JyHu, 15-05-20 16:05:04
 *
 *  @brief  农历的日子
 */
@property (assign, nonatomic) NSInteger day;

/**
 *  @author JyHu, 15-05-20 16:05:12
 *
 *  @brief  阴历的时间
 */
@property (copy, nonatomic) NSDate *solarDate;

/**
 *  @author JyHu, 15-05-20 16:05:18
 *
 *  @brief  待返回值的计算下一个农历天
 *
 *  @return 农历天
 */
- (AUULunarDate *)nextDay;

/**
 *  @author JyHu, 15-05-20 16:05:37
 *
 *  @brief  计算下一个农历天
 */
- (void)nextDayS;

/**
 *  @author JyHu, 15-05-20 16:05:46
 *
 *  @brief  带返回值的计算上一个农历天
 *
 *  @return 农历天
 */
- (AUULunarDate *)lastDay;

/**
 *  @author JyHu, 15-05-20 16:05:58
 *
 *  @brief  计算上一个农历天
 */
- (void)lastDayS;

/**
 *  @author JyHu, 15-05-20 16:05:09
 *
 *  @brief  log描述
 */
- (void)description;

@end
