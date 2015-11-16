//
//  NSString+AUUCategory.h
//  AUUKits
//
//  Created by 胡金友 on 11/16/15.
//  Copyright © 2015 Joyous Hu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    AUUStringGeneralElementWithCapitalEnglishCharacter      = 1 << 0,   // 大写字母
    AUUStringGeneralElementWithLowerCaseEnglishCharacter    = 1 << 1,   // 小写字母
    AUUStringGeneralElementWithNumber                       = 1 << 2,   // 数字
    AUUStringGeneralElementWithSpecialCharacter             = 1 << 3,   // 其他特殊字符
} AUUStringGeneralElement;

typedef NS_ENUM(NSUInteger, AUUStringTransform) {
    AUUStringTransformStripCombiningMarks,
    AUUStringTransformToLatin,
    AUUStringTransformFullwidthHalfwidth,
    AUUStringTransformLatinKatakana,
    AUUStringTransformLatinHiragana,
    AUUStringTransformHiraganaKatakana,
    AUUStringTransformMandarinLatin,        /* 将中文字符串转换成带声调的汉语拼音 */
    AUUStringTransformLatinHangul,
    AUUStringTransformLatinArabic,
    AUUStringTransformLatinHebrew,
    AUUStringTransformLatinThai,
    AUUStringTransformLatinCyrillic,
    AUUStringTransformLatinGreek,
    AUUStringTransformToXMLHex,
    AUUStringTransformToUnicodeName,
    AUUStringTransformStripDiacritics       /* 将中文字符串转换成不带声调的汉语拼音 */
};

@interface NSString (AUUCategory)

/**
 *  @author JyHu, 15-11-16 11:11:10
 *
 *  @brief  根据字体计算文字的所占的size
 *
 *  @param size 外围最大的控制Size
 *  @param font 字体
 *
 *  @return CGSize
 */
- (CGSize)sizeWithContainSize:(CGSize)size
                         font:(UIFont *)font;

/**
 *  @author JyHu, 15-05-19 14:05:08
 *
 *  @brief  根据字体富文本属性计算文字所占的size
 *
 *  @param size       外围最大的控制size
 *  @param attributes 字体的富文本属性
 *
 *  @return CGSize
 */
- (CGSize)sizeWithContain:(CGSize)size
               attributes:(NSDictionary *)attributes;

/**
 *  @author JyHu, 15-08-03 10:08:01
 *
 *  计算字符串所占的空间
 *
 *  @param size       外围最大的控制size
 *  @param attributes 字体的富文本属性
 *  @param options    字体的计算模式
 *
 *  @return CGSize
 *
 *  @since  v 1.0
 */
- (CGSize)sizeWithContain:(CGSize)size
               attributes:(NSDictionary *)attributes
                  options:(NSStringDrawingOptions)options;

/**
 *  @author JyHu, 15-05-19 14:05:16
 *
 *  @brief  给字符串扩充下标的方法
 *
 *  @param paramIndex 下标
 *
 *  @return NSString ， 一个字符
 */
- (id)objectAtIndexedSubscript:(NSUInteger)paramIndex;

/**
 *  @author JyHu, 15-05-19 15:05:48
 *
 *  @brief  将字符串翻转
 *
 *  @return 翻转后的结果
 */
- (NSString *)reverseString;

/**
 *  @author JyHu, 15-05-19 15:05:49
 *
 *  @brief  将字符串直接转换成URL
 *
 *  @return NSURL
 */
- (NSURL *)toURL;

/**
 *  @author JyHu, 15-05-19 15:05:38
 *
 *  @brief  将年月日格式的字符串转换成时间
 *
 *  @return NSDate
 */
- (NSDate *)yyyyMMddStringToDate;

/**
 *  @author JyHu, 15-05-19 15:05:57
 *
 *  @brief  将时分秒格式的字符串转换成时间
 *
 *  @return NSDate
 */
- (NSDate *)HHmmssStringToDate;

/**
 *  @author JyHu, 15-05-19 15:05:13
 *
 *  @brief  将年月日时分秒格式的字符串转换成时间
 *
 *  @return NSDate
 */
- (NSDate *)yyyyMMddHHmmssStringToDate;


/**
 *  @author JyHu, 15-05-19 23:05:51
 *
 *  随机生成字符串
 *
 *  @param length   指定长度
 *  @param elements 包含的字符类型
 *
 *  @return 随机的字符串
 */
+ (NSString *)generalWithLength:(NSInteger)length
              characterElements:(AUUStringGeneralElement)elements;

/**
 *  @author JyHu, 15-05-19 23:05:17
 *
 *  取一个区间中的任意长度的字符串
 *
 *  @param section  区间
 *          - 最短 section.location
 *          - 最长 section.location + section.length
 *  @param elements 包含的字符类型
 *
 *  @return 随机的字符串
 */
+ (NSString *)generalWithSection:(NSRange)section
               characterElements:(AUUStringGeneralElement)elements;

/**
 *  @author JyHu, 15-05-23 23:05:23
 *
 *  获取APP的版本号
 *
 *  @return APP版本号字符串
 */
+ (NSString *)getApplicationVersion;

/**
 *  @author JyHu, 15-05-23 23:05:07
 *
 *  获取APP的名字
 *
 *  @return APP的名字
 */
+ (NSString *)getApplicationName;

/**
 *  @author JyHu, 15-05-23 23:05:20
 *
 *  字符串转码
 *
 *  @param transformType 转码类型
 *
 *  @return 转码后的字符串
 */
- (NSString *)transformStringWithType:(AUUStringTransform)transformType;

/**
 *  @author JyHu, 15-08-03 10:08:56
 *
 *  取得当前字符串的首字母，适合中文字符串
 *
 *  @return 字母
 *
 *  @since  v 1.0
 */
- (NSString *)firstCharacter;

/**
 *  @author JyHu, 15-05-26 15:05:19
 *
 *  @brief  生成一个随机的128位的UUID字符串
 *
 *  @return UUIDString
 */
+ (NSString *)generateUniqueIdentifier;

@end




@interface NSString(AUUREString)

/**
 *  @author JyHu, 15-05-18 18:05:56
 *
 *  @brief  使用默认的正则属性匹配需要的所有结果
 *
 *  @param regular 正则表达式
 *
 *  @return AUUTextCheckingRanges 的数组
 */
- (NSArray *) RERangesMatchedWithPartten:(NSString *)regular;

/**
 *  @author JyHu, 15-05-18 18:05:16
 *
 *  @brief  使用自定义的正则属性匹配所需要的结果
 *
 *  @param regular  正则表达式
 *  @param rOptions 正则属性
 *  @param mOptions 匹配属性
 *
 *  @return AUUTextCheckingRanges 的数组
 */
- (NSArray *) RERangesMatchedWithPartten:(NSString *)regular
                                REOption:(NSRegularExpressionOptions)rOptions
                            matchOptions:(NSMatchingOptions)mOptions;

/**
 *  @author JyHu, 15-05-18 18:05:08
 *
 *  @brief  使用默认的正则属性匹配所需要的结果
 *
 *  @param regular 正则表达式
 *
 *  @return AUUTextCheckingResults 的数组
 */
- (NSArray *) REResultsMatchedWithPartten:(NSString *)regular;

/**
 *  @author JyHu, 15-05-18 18:05:01
 *
 *  @brief  使用自定义的这则属性匹配所需要的结果
 *
 *  @param regular  正则表达式
 *  @param rOptions 正则属性
 *  @param mOptions 匹配属性
 *
 *  @return AUUTextCheckingResults 的数组
 */
- (NSArray *) REResultsMatchedWithPartten:(NSString *)regular
                                 REOption:(NSRegularExpressionOptions)rOptions
                             matchOptions:(NSMatchingOptions)mOptions;

/**
 *  @author JyHu, 15-05-24 07:05:43
 *
 *  匹配的第一个结果
 *
 *  @param pattern 正则表达式
 *
 *  @return 匹配的结果
 */
- (NSString *)REResultFirstMatchWithPattern:(NSString *)pattern;

/**
 *  @author JyHu, 15-05-24 07:05:50
 *
 *  匹配的第一个结果
 *
 *  @param pattern  正则表达式
 *  @param rOptions 正则属性
 *  @param mOptions 匹配属性
 *
 *  @return 匹配的结果
 */
- (NSString *)REResultFirstMatchWithPattern:(NSString *)pattern
                                  REOptions:(NSRegularExpressionOptions)rOptions
                               matchOptions:(NSMatchingOptions)mOptions;


/**
 *  @author JyHu, 15-05-20 14:05:27
 *
 *  @brief  替换掉匹配的结果
 *
 *  @param regular        要匹配内容的正则
 *  @param replacedString 要替换成的字符串
 *
 *  @return 替换后的结果
 */
- (NSString *)REReplaceOccuredStringByPattern:(NSString *)regular
                                         with:(NSString *)replacedString;

/**
 *  @author JyHu, 15-05-20 15:05:58
 *
 *  @brief  替换匹配到的结果
 *
 *  @param regular        要匹配内容的正则
 *  @param replacedString 要替换成的字符串
 *  @param rOptions       正则属性
 *  @param mOptions       匹配属性
 *
 *  @return 替换的结果
 */
- (NSString *)REReplaceOccuredStringByPattern:(NSString *)regular
                                         with:(NSString *)replacedString
                                    reOptions:(NSRegularExpressionOptions)rOptions
                                 matchOptions:(NSMatchingOptions)mOptions;



/**
 *  @author JyHu, 15-05-18 18:05:33
 *
 *  @brief  根据传递过来的range数组截取所有的结果
 *
 *  @param ranges AUUTextCheckingRange -> NSValue
 *
 *  @return NSValue的数组
 */
- (NSArray *) REResultsWithRanges:(NSArray *)ranges;

/**
 *  @author JyHu, 15-05-19 11:05:35
 *
 *  @brief  检测是否是正规的URL
 *
 *  @return BOOL
 */
- (BOOL) isLegalURL;

/**
 *  @author JyHu, 15-05-19 11:05:50
 *
 *  @brief  检查是否是正规的 E-mail 地址
 *
 *  @return BOOL
 */
- (BOOL) isLegalEMail;

/**
 *  @author JyHu, 15-05-19 11:05:09
 *
 *  @brief  检查是否是正规的手机号
 *
 *  @return BOOL
 */
- (BOOL) isLegalChinaCellPhoneNumber;

/**
 *  @author JyHu, 15-05-19 11:05:22
 *
 *  @brief  检查是否是正规的 Obj
 *
 *  @param pattern 检查的正则表达式
 *
 *  @return BOOL
 */
- (BOOL) isLegalObjWithPattern:(NSString *)pattern;

/**
 *  @author JyHu, 15-05-19 17:05:57
 *
 *  @brief  去掉特殊字符，只留下文字或字母
 *
 *  @return NSString
 */
- (NSString *)replaceSpecialCharacters;

/**
 *  @author JyHu, 15-05-19 17:05:02
 *
 *  @brief  取出字符串中的所有数字
 *
 *  @return NSNumber Array
 */
- (NSArray *)pickOutNumbers;

/**
 *  @author JyHu, 15-05-19 17:05:19
 *
 *  @brief  取出字符串中所有的中文字符
 *
 *  @return 中文字符数组
 */
- (NSArray *)pickOutChinese;

/**
 *  @author JyHu, 15-05-19 17:05:36
 *
 *  @brief  取出字符串中所有的英文单词
 *
 *  @return 英文单词数组
 */
- (NSArray *)pickOutEnglish;

/**
 *  @author JyHu, 15-05-19 17:05:23
 *
 *  @brief  这个方法是重写系统的，系统的只在iOS8的时候才出现
 *
 *  @brief  判断本字符串是否包含字符串aString
 *
 *  @param aString 判断包含的字符串
 *
 *  @return BOOL
 */
- (BOOL)containsString:(NSString *)aString;

/**
 *  @author JyHu, 15-05-23 23:05:18
 *
 *  用匹配的字符串分割字符串
 *
 *  @param pattern 用来匹配分割位置的正则
 *
 *  @return 分割后的字符串
 */
- (NSArray *)splitWithPattern:(NSString *)pattern;

@end


@interface AUUTextCheckingRange : NSObject

/**
 *  @author JyHu, 15-05-18 18:05:28
 *
 *  @brief  默认的0组匹配结果
 */
@property (assign, nonatomic, readonly) NSRange range;

/**
 *  @author JyHu, 15-05-18 18:05:50
 *
 *  @brief  所有匹配的总个数
 */
@property (assign, nonatomic, readonly) NSInteger numberOfRanges;

/**
 *  @author JyHu, 15-05-18 18:05:02
 *
 *  @brief  取出某一个位置的Range
 *
 *  @param index 位置
 *
 *  @return NSRange
 */
- (NSRange)rangeAtIndex:(NSInteger)index;

@end

@interface AUUTextCheckingResult : NSObject

/**
 *  @author JyHu, 15-05-18 18:05:59
 *
 *  @brief  默认的0组匹配结果
 */
@property (retain, nonatomic, readonly) NSString *result;

/**
 *  @author JyHu, 15-05-18 18:05:21
 *
 *  @brief  所有匹配到的总个数
 */
@property (assign, nonatomic, readonly) NSInteger numberOfResults;

/**
 *  @author JyHu, 15-05-18 18:05:31
 *
 *  @brief  取出某一个位置的匹配结果
 *
 *  @param index 位置
 *
 *  @return NSString
 */
- (NSString *)resultAtIndex:(NSInteger)index;

@end
