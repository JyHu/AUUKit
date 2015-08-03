//
//  AUUDate.m
//  AUUKit
//
//  Created by 胡金友 on 15/5/19.
//  Copyright (c) 2015年 胡金友. All rights reserved.
//

#import "AUUDate.h"
#import "AUUString.h"
#import "AUUMacro.h"

#define kAUULunarCalendarMinYear (1900)
#define kAUULunarCalendarMaxYear (2049)

NSUInteger lunarInfo[]={   /*阴历数据*/
    0x04bd8,0x04ae0,0x0a570,0x054d5,0x0d260,0x0d950,0x16554,0x056a0,0x09ad0,0x055d2,
    0x04ae0,0x0a5b6,0x0a4d0,0x0d250,0x1d255,0x0b540,0x0d6a0,0x0ada2,0x095b0,0x14977,
    0x04970,0x0a4b0,0x0b4b5,0x06a50,0x06d40,0x1ab54,0x02b60,0x09570,0x052f2,0x04970,
    0x06566,0x0d4a0,0x0ea50,0x06e95,0x05ad0,0x02b60,0x186e3,0x092e0,0x1c8d7,0x0c950,
    0x0d4a0,0x1d8a6,0x0b550,0x056a0,0x1a5b4,0x025d0,0x092d0,0x0d2b2,0x0a950,0x0b557,
    0x06ca0,0x0b550,0x15355,0x04da0,0x0a5d0,0x14573,0x052d0,0x0a9a8,0x0e950,0x06aa0,
    0x0aea6,0x0ab50,0x04b60,0x0aae4,0x0a570,0x05260,0x0f263,0x0d950,0x05b57,0x056a0,
    0x096d0,0x04dd5,0x04ad0,0x0a4d0,0x0d4d4,0x0d250,0x0d558,0x0b540,0x0b5a0,0x195a6,
    0x095b0,0x049b0,0x0a974,0x0a4b0,0x0b27a,0x06a50,0x06d40,0x0af46,0x0ab60,0x09570,
    0x04af5,0x04970,0x064b0,0x074a3,0x0ea50,0x06b58,0x055c0,0x0ab60,0x096d5,0x092e0,
    0x0c960,0x0d954,0x0d4a0,0x0da50,0x07552,0x056a0,0x0abb7,0x025d0,0x092d0,0x0cab5,
    0x0a950,0x0b4a0,0x0baa4,0x0ad50,0x055d9,0x04ba0,0x0a5b0,0x15176,0x052b0,0x0a930,
    0x07954,0x06aa0,0x0ad50,0x05b52,0x04b60,0x0a6e6,0x0a4e0,0x0d260,0x0ea65,0x0d530,
    0x05aa0,0x076a3,0x096d0,0x04bd7,0x04ad0,0x0a4d0,0x1d0b6,0x0d250,0x0d520,0x0dd45,
    0x0b5a0,0x056d0,0x055b2,0x049b0,0x0a577,0x0a4b0,0x0aa50,0x1b255,0x06d20,0x0ada0};

NSInteger solarMonth[2][13] =   {{0,31,28,31,30,31,30,31,31,30,31,30,31},
                                 {0,31,29,31,30,31,30,31,31,30,31,30,31}};

NSTimeInterval const AUUHourSeconds = 60 * 60;
NSTimeInterval const AUUDaysSeconds = 24 * AUUHourSeconds;
NSTimeInterval const AUUWeeksSeconds = AUUDaysSeconds * 7;

@implementation NSDate(AUUDate)

- (NSDateComponents *)dateComponents
{
    NSCalendar *calendar = [NSCalendar currentCalendar];

    NSInteger unitFlag;
    
    if (kVERSION_UP_TO_8)
    {
        unitFlag = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekday | NSCalendarUnitWeekdayOrdinal | NSCalendarUnitQuarter | NSCalendarUnitWeekOfMonth | NSCalendarUnitWeekOfYear;
    }
    else
    {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        unitFlag = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSWeekdayCalendarUnit | NSWeekdayOrdinalCalendarUnit | NSQuarterCalendarUnit | NSWeekOfMonthCalendarUnit | NSWeekOfYearCalendarUnit;
#pragma clang diagnostic pop
    }
    
    NSDateComponents *comp = [calendar components:unitFlag fromDate:self];

    return comp;
}

- (NSRange)dateRangeBetweenMonthAndDay
{
    NSString *gregorian;
    
    if (kVERSION_UP_TO_8)
    {
        gregorian = NSCalendarIdentifierGregorian;
    }
    else
    {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        gregorian = NSGregorianCalendar;
#pragma clang diagnostic pop
    }
    
    NSCalendar *currentCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:gregorian];
    [currentCalendar setFirstWeekday:1];
    [currentCalendar setMinimumDaysInFirstWeek:7];
    
    NSRange dateRange = [currentCalendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:self];
    
    return dateRange;
}

- (NSInteger)year
{
    return [[self dateComponents] year];
}

- (NSInteger)month
{
    return [[self dateComponents] month];
}

- (NSInteger)day
{
    return [[self dateComponents] day];
}

- (NSInteger)hour
{
    return [[self dateComponents] hour];
}

- (NSInteger)minute
{
    return [[self dateComponents] minute];
}

- (NSInteger)second
{
    return [[self dateComponents] second];
}

- (NSInteger)weekDay
{
    return [[self dateComponents] weekday];
}

- (NSInteger)weekOfMonth
{
    return [[self dateComponents] weekOfMonth];
}

- (NSInteger)weekOfYear
{
    return [[self dateComponents] weekOfYear];
}

- (NSInteger)daysOfMonth
{
    return [self dateRangeBetweenMonthAndDay].length;
}

- (NSInteger)firstWeekdayOfCurMonth
{
    return [self dateByAddingTimeInterval:(-1 * (self.day * AUUDaysSeconds - 1))].weekDay;
}

- (NSString *)yyyyMMddString
{
    return [self yyyyMMddStringWithFormat:@"yyyy-MM-dd"];
}

- (NSString *)yyyyMMddStringWithFormat:(NSString *)format
{
    if ([format containsString:@"yyyy"] && [format containsString:@"MM"] && [format containsString:@"dd"])
    {
        NSString *fRes;
        
        fRes = [format stringByReplacingOccurrencesOfString:@"yyyy"
                                                 withString:[NSString stringWithFormat:@"%@", @(self.year)]];
        
        fRes = [format stringByReplacingOccurrencesOfString:@"MM"
                                                 withString:[NSString stringWithFormat:@"%@", @(self.month)]];
        
        fRes = [format stringByReplacingOccurrencesOfString:@"dd"
                                                 withString:[NSString stringWithFormat:@"%@", @(self.day)]];
        
        return fRes;
    }
    
    NSLog(@"请按格式化要求输入控制字符串");
    
    return nil;
}

- (NSString *)HHmmssString
{
    return [self HHmmssStringWithFormat:@"HH:mm:ss"];
}

- (NSString *)HHmmssStringWithFormat:(NSString *)format
{
    if ([format containsString:@"HH"] && [format containsString:@"mm"] && [format containsString:@"ss"])
    {
        NSString *fRes;
        
        fRes = [format stringByReplacingOccurrencesOfString:@"HH"
                                                 withString:[NSString stringWithFormat:@"%@", @(self.hour)]];
        
        fRes = [format stringByReplacingOccurrencesOfString:@"mm"
                                                 withString:[NSString stringWithFormat:@"%@", @(self.hour)]];
        
        fRes = [format stringByReplacingOccurrencesOfString:@"ss"
                                                 withString:[NSString stringWithFormat:@"%@", @(self.hour)]];
        
        return fRes;
    }
    
    NSLog(@"请按格式化要求输入控制字符串");
    
    return nil;
}

- (NSString *)yyyyMMddHHmmssString
{
    return [self yyyyMMddHHmmssStringWithFormat:@"yyyy-MM-dd HH:mm:ss"];
}

- (NSString *)yyyyMMddHHmmssStringWithFormat:(NSString *)format
{
    if ([format containsString:@"yyyy"] && [format containsString:@"MM"] &&
        [format containsString:@"dd"] && [format containsString:@"HH"] &&
        [format containsString:@"mm"] && [format containsString:@"ss"])
    {
        NSString *fRes;
        
        fRes = [format stringByReplacingOccurrencesOfString:@"yyyy"
                                                 withString:[NSString stringWithFormat:@"%@", @(self.year)]];
        
        fRes = [format stringByReplacingOccurrencesOfString:@"MM"
                                                 withString:[NSString stringWithFormat:@"%@", @(self.month)]];
        
        fRes = [format stringByReplacingOccurrencesOfString:@"dd"
                                                 withString:[NSString stringWithFormat:@"%@", @(self.day)]];
        
        fRes = [format stringByReplacingOccurrencesOfString:@"HH"
                                                 withString:[NSString stringWithFormat:@"%@", @(self.hour)]];
        
        fRes = [format stringByReplacingOccurrencesOfString:@"mm"
                                                 withString:[NSString stringWithFormat:@"%@", @(self.hour)]];
        
        fRes = [format stringByReplacingOccurrencesOfString:@"ss"
                                                 withString:[NSString stringWithFormat:@"%@", @(self.hour)]];
        
        return fRes;
    }
    
    NSLog(@"请按格式化要求输入控制字符串");
    
    return nil;
}

- (NSInteger)daysFromDate:(NSDate *)fDate
{
    NSTimeInterval seconds = [[self dayBegining] timeIntervalSinceDate:[fDate dayBegining]];
    
    return (NSInteger)(seconds / AUUDaysSeconds);
}

- (NSInteger)daysFrom19000130
{
    return [self daysFromDate:[@"1900-01-30" yyyyMMddStringToDate]];
}

- (NSDate *)dayBegining
{
    return [self dateByAddingTimeInterval:(-1 * (self.hour * 60 * 60 + self.minute * 60 + self.second))];
}

- (NSDate *)dayEnding
{
    return [[self dayBegining] dateByAddingTimeInterval:AUUDaysSeconds];
}

- (AUULunarDate *)toLunarChineseYearDate
{
    AUULunarDate *lunarDate = [[AUULunarDate alloc] init];
    
    BOOL hadCountLeapMonth = NO;
    
    lunarDate.year = 1900;
    lunarDate.month = 1;
    lunarDate.day = 30;
    
    NSInteger solarDaysFrom19000130 = [self daysFromDate:[@"19000130" yyyyMMddStringToDate]];
    
    /**
     *  @author JyHu, 15-05-20 11:05:59
     *
     *  @brief  按年份收敛
     */
    while (solarDaysFrom19000130 > 13 * 30)
    {
        solarDaysFrom19000130 -= [NSDate getLunarChineseYearDays:lunarDate.year];
        lunarDate.year ++;
    }
    
    /**
     *  @author JyHu, 15-05-20 11:05:13
     *
     *  @brief  按月份收敛
     */
    while (solarDaysFrom19000130 > 30)
    {
        solarDaysFrom19000130 -= [NSDate getLunarChineseYearMonthDaysWithYear:lunarDate.year month:lunarDate.month];
        
        if (!hadCountLeapMonth && [NSDate getLunarChineseYearLeapMonth:lunarDate.year] == lunarDate.month)
        {
            hadCountLeapMonth = YES;
            
            continue;
        }
        
        lunarDate.month ++;
        
        if (lunarDate.month > 12)
        {
            lunarDate.month = 1;
            lunarDate.year ++;
        }
    }
    
    NSInteger lunarMonthDays = [NSDate getLunarChineseYearMonthDaysWithYear:lunarDate.year month:lunarDate.month];
    
    /**
     *  @author JyHu, 15-05-20 11:05:38
     *
     *  @brief  按天收敛
     */
    while (solarDaysFrom19000130 > lunarMonthDays)
    {
        solarDaysFrom19000130 -= lunarMonthDays;
        
        lunarDate.month ++;
        
        if (lunarDate.month > 12)
        {
            lunarDate.month = 1;
            lunarDate.year ++;
        }
    }
    
    /**
     *  @author JyHu, 15-05-20 11:05:52
     *
     *  @brief  残余天数的归属
     */
    lunarDate.day = solarDaysFrom19000130;
    
    if (lunarDate.month > 12)
    {
        lunarDate.month = 1;
        lunarDate.year ++;
    }
    
    lunarDate.solarDate = self;
    
    return lunarDate;
}

+ (NSDate *)dateWithTimestamp:(NSUInteger)timestamp
{
    return [NSDate dateWithTimeIntervalSince1970:timestamp];
}

- (BOOL)isEqualToDateIgnoringTime:(NSDate *)date
{
    return ((self.year == date.year) && (self.month == date.month) && (self.day == date.day));
}

- (BOOL)isYesterday
{
    return [self isEqualToDateIgnoringTime:[self dateByAddingDays:-1]];
}

- (BOOL)isToday
{
    return [self isEqualToDateIgnoringTime:[NSDate date]];
}

- (BOOL)isTomorrow
{
    return [self isEqualToDateIgnoringTime:[self dateByAddingDays:1]];
}

- (BOOL)isSameWeekWithDate:(NSDate *)date
{
    return ((self.year == date.year) && (self.weekOfYear == date.weekOfYear));
}

- (BOOL)isLastWeek
{
    return [self isSameWeekWithDate:[self dateByAddingDays:-7]];
}

- (BOOL)isThisWeek
{
    return [self isSameWeekWithDate:[NSDate date]];
}

- (BOOL)isNextWeek
{
    return [self isSameWeekWithDate:[self dateByAddingDays:7]];
}

- (BOOL)isEarlierThanDate:(NSDate *)date
{
    return [[self earlierDate:date] isEqualToDate:self];
}

- (BOOL)isLaterThanDate:(NSDate *)date
{
    return [[self laterDate:date] isEqualToDate:self];
}

- (NSDate *)dateByAddingDays:(NSUInteger)days
{
    return [self dateByAddingTimeInterval:AUUDaysSeconds * days];
}

- (NSDate *)dateByAddingHours:(NSUInteger)hours
{
    return [self dateByAddingTimeInterval:AUUHourSeconds * hours];
}

- (NSDate *)dateByAddingMinutes:(NSUInteger)minutes
{
    return [self dateByAddingTimeInterval:60 * minutes];
}

@end

@implementation NSDate(AUUCalendarDate)

+ (BOOL)checkYearLimit:(NSInteger)year
{
    if (year >= kAUULunarCalendarMinYear && year <= kAUULunarCalendarMaxYear)
    {
        return YES;
    }
    
    return NO;
}

+ (NSInteger)getLunarChineseYearLeapMonth:(NSInteger)year
{
    //  从1~12，注意，不是从0开始，0表示无闰月
    return lunarInfo[year - kAUULunarCalendarMinYear] & 0xF;
}

+ (NSInteger)getLunarChineseYearLeapMonthDays:(NSInteger)year
{
    if ([NSDate getLunarChineseYearLeapMonth:year] == 0)
    {
        return 0;
    }
    
    //  要先计算出是闰大月还是小月，取前四位，但是必须跟最后四位配合使用。
    //  为1为闰大月，为0为闰小月
    NSInteger type = lunarInfo[year - kAUULunarCalendarMinYear] & 0xF0000;
    
    return type ? 30 : 29;
}

+ (NSInteger)getLunarChineseYearMonthDaysWithYear:(NSInteger)year month:(NSInteger)month
{
    //  month从1开始
    //
    //  判断传进来的是不是0月，是为了避免出现误传参数，月份是从高位开始算
    //  15  14  13  12  ...     7   6   5   4       二进制位
    //   1   2   3   3          9  10  11  12       月份
    //  0x8000 = 1000 0000 0000 0000
    
    if (month <= 0 || month > 12)
    {
        return 0;
    }
    
    NSInteger days = (lunarInfo[year - kAUULunarCalendarMinYear] & (0x8000>>(month - 1)) ? 30 : 29);
    
    return days;
}

+ (NSInteger)getLunarChineseYearDays:(NSInteger)year
{
    NSInteger sumDays = 0;
    
    for (NSInteger i = 1; i <= 12; i++)
    {
        sumDays += [NSDate getLunarChineseYearMonthDaysWithYear:year month:i];
    }
    
    // 结果必须加上闰月的天数
    return sumDays + [NSDate getLunarChineseYearLeapMonthDays:year];
}

+ (BOOL)isSolarChineseYearIsLeapYear:(NSInteger)year
{
    return ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) ? YES : NO;
}

@end


@implementation AUULunarDate

@synthesize year = _year;

@synthesize month = _month;

@synthesize day = _day;

@synthesize solarDate = _solarDate;

- (id)init
{
    self = [super init];
    
    self.year = [NSDate date].year;
    self.month = [NSDate date].month;
    self.day = [NSDate date].day;
    self.solarDate = [NSDate date];
    
    return self;
}

- (AUULunarDate *)nextDay
{
    NSInteger curLunarMonthDays = [NSDate getLunarChineseYearMonthDaysWithYear:self.year month:self.month];
    
    AUULunarDate *lunarDate = [self copy];
    
    //    lunarDate.year = self.year;
    //    lunarDate.month = self.month;
    //    lunarDate.day = self.day;
    //    lunarDate.solarDate = self.solarDate;
    
    lunarDate.solarDate = [lunarDate.solarDate dateByAddingTimeInterval:AUUDaysSeconds];
    
    lunarDate.day += 1;
    
    if (lunarDate.day <= curLunarMonthDays)
    {
        return lunarDate;
    }
    
    NSInteger curYearLeapMonth = [NSDate getLunarChineseYearLeapMonth:self.year];
    
    lunarDate.day = 1;
    
    if (lunarDate.month == curYearLeapMonth)
    {
        /**
         *  @author JyHu, 15-05-20 12:05:48
         *
         *  @brief  这里还需要重新计算，会使计算变慢
         */
        return [lunarDate.solarDate toLunarChineseYearDate];
    }
    
    lunarDate.month += 1;
    
    if (lunarDate.month > 12)
    {
        lunarDate.month = 1;
        
        lunarDate.year ++;
    }
    
    return lunarDate;
}

- (void)nextDayS
{
    AUULunarDate *d = [self nextDay];
    self.year = d.year;
    self.month = d.month;
    self.day = d.day;
    self.solarDate = [d.solarDate copy];
    
    d = nil;
}

- (AUULunarDate *)lastDay
{
    AUULunarDate *lunarDate = [self copy];
    
    lunarDate.solarDate = [lunarDate.solarDate dateByAddingTimeInterval:(-1 * AUUDaysSeconds)];
    
    lunarDate.day -= 1;
    
    if (lunarDate.day > 0)
    {
        return lunarDate;
    }
    
    NSInteger curYearLeapMonth = [NSDate getLunarChineseYearLeapMonth:self.year];
    
    if (lunarDate.month == curYearLeapMonth)
    {
        return [lunarDate.solarDate toLunarChineseYearDate];
    }
    
    lunarDate.month -= 1;
    
    if (lunarDate.month <= 0)
    {
        lunarDate.month = 12;
    }
    
    NSInteger curLunarMonthDays = [NSDate getLunarChineseYearMonthDaysWithYear:lunarDate.year month:lunarDate.month];
    
    lunarDate.day = curLunarMonthDays;
    
    return lunarDate;
}

- (void)lastDayS
{
    AUULunarDate *d = [self lastDay];
    
    self.year = d.year;
    self.month = d.month;
    self.day = d.day;
    self.solarDate = [d.solarDate copy];
    
    d = nil;
}

- (void)description
{
    NSLog(@"%@ - Lunar date : %@-%@-%@  , Solar date : %@",self, @(self.year), @(self.month), @(self.day), self.solarDate);
}

@end
