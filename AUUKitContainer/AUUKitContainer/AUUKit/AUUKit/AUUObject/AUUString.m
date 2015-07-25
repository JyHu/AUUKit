//
//  AUUString.m
//  AUUKit
//
//  Created by 胡金友 on 15/5/25.
//  Copyright (c) 2015年 胡金友. All rights reserved.
//

#import "AUUString.h"
#import <objc/runtime.h>
#import <CommonCrypto/CommonDigest.h>
#import <sys/utsname.h>

NSString *const kAUUReverseStringKey = @"kAUUReverseStringKey";

@implementation NSString(AUUString)


- (CGSize)sizeWithBounding:(CGSize)size font:(UIFont *)font
{
    NSDictionary *dict = @{NSFontAttributeName : font};
    
    return [self sizeWithBounding:size attributes:dict];
}

- (CGSize)sizeWithBounding:(CGSize)size attributes:(NSDictionary *)attributes
{
    CGSize constriantSize;
    
    kAUUCallB7TAPI(
                   UIFont *font = [attributes objectForKey:NSFontAttributeName];
                   constriantSize = [self sizeWithFont:font constrainedToSize:size];
                   ,
                   constriantSize = [self boundingRectWithSize:size
                                                       options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                                    attributes:attributes
                                                       context:nil].size;
                   )
    return constriantSize;
}

- (id)objectAtIndexedSubscript:(NSUInteger)paramIndex
{
    if (paramIndex >= self.length)
    {
        return nil;
    }
    
    return [self substringWithRange:NSMakeRange(paramIndex, 1)];
}

- (NSString *)reverseString
{
    NSMutableString *handleResString = [NSMutableString new];
    
    for (NSInteger i = self.length - 1; i >= 0; i--)
    {
        [handleResString appendString:self[i]];
    }
    
    return handleResString;
    
}

- (id)objectForKeyedSubscript:(id<NSCopying>)paramKey
{
    NSObject<NSCopying> *keyAsObject = (NSObject<NSCopying> *)paramKey;
    
    if ([keyAsObject isKindOfClass:[NSString class]] || [keyAsObject isKindOfClass:[NSMutableString class]])
    {
        NSString *keyAsString = (NSString *)keyAsObject;
        
        if ([keyAsString isEqualToString:kAUUReverseStringKey])
        {
            return [self reverseString];
        }
    }
    return nil;
}

- (NSURL *)toURL
{
    return [NSURL URLWithString:self];
}

#pragma mark - about date

- (NSDate *)yyyyMMddStringToDate
{
    return [self dateWithFormatter:@"yyyy-MM-dd"];
}

- (NSDate *)HHmmssStringToDate
{
    return [self dateWithFormatter:@"HH:mm:ss"];
}

- (NSDate *)yyyyMMddHHmmssStringToDate
{
    return [self dateWithFormatter:@"yyyy-MM-dd HH:mm:ss"];
}

- (NSDate *)dateWithFormatter:(NSString *)format
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone systemTimeZone]];
    [dateFormatter setDateFormat:format];
    
    [dateFormatter weekdaySymbols];
    return [[dateFormatter dateFromString:self] dateByAddingTimeInterval:[[NSTimeZone systemTimeZone] secondsFromGMT]];
}

+ (NSString *)generalWithLength:(NSInteger)length characterElements:(AUUStringGeneralElement)elements
{
    if (length < 0)
    {
        return nil;
    }
    
    NSString *upCaseENChar = @"ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    NSString *loCaseENChar = @"abcdefghijklmnopqrstuvwxyz";
    NSString *numbers = @"0123456789";
    NSString *spCharacter = @"+=-_)(*&^%$#@!~\\|][{}'\";:?/ >.<,";
    
    NSMutableString *chString = [[NSMutableString alloc] initWithString:@""];
    
    if (elements & AUUStringGeneralElementWithEnglishCharacter)
    {
        [chString appendString:upCaseENChar];
        [chString appendString:loCaseENChar];
    }
    if (elements & AUUStringGeneralElementWithNumber)
    {
        [chString appendString:numbers];
    }
    if (elements & AUUStringGeneralElementWithSpecialCharacter)
    {
        [chString appendString:spCharacter];
    }
    
    if ([chString stringByReplacingOccurrencesOfString:@" " withString:@""].length == 0)
    {
        return nil;
    }
    
    NSMutableString *resultStr = [[NSMutableString alloc] initWithString:@""];
    
    for (NSInteger i; i<length; i++)
    {
        [resultStr appendString:chString[arc4random()%chString.length]];
    }
    
    if (resultStr.length == 0)
    {
        return nil;
    }
    
    return resultStr;
}

+ (NSString *)generalWithSection:(NSRange)section characterElements:(AUUStringGeneralElement)elements
{
    NSInteger length = arc4random()%section.length + section.location;
    
    return [self generalWithLength:length characterElements:elements];
}

+ (NSString *)getApplicationVersion
{
    NSDictionary *info = [[NSBundle mainBundle] infoDictionary];
    NSString *version = [info objectForKey:@"CFBundleVersion"];
    return version;
}

+ (NSString *)getApplicationName
{
    NSDictionary *info = [[NSBundle mainBundle] infoDictionary];
    NSString *name = [info objectForKey:@"CFBundleDisplayName"];
    return name;
}

- (NSString *)transformStringWithType:(AUUStringTransform)transformType
{
    if ([self length])
    {
        NSMutableString *ms = [[NSMutableString alloc] initWithString:self];
        
        CFStringRef stringRef;
        
        switch (transformType)
        {
            case AUUStringTransformToLatin:
                stringRef = kCFStringTransformToLatin;
                break;
                
            case AUUStringTransformToXMLHex:
                stringRef = kCFStringTransformToXMLHex;
                break;
                
            case AUUStringTransformLatinThai:
                stringRef = kCFStringTransformLatinThai;
                break;
                
            case AUUStringTransformLatinGreek:
                stringRef = kCFStringTransformLatinGreek;
                break;
                
            case AUUStringTransformLatinArabic:
                stringRef = kCFStringTransformLatinArabic;
                break;
                
            case AUUStringTransformLatinHangul:
                stringRef = kCFStringTransformLatinHangul;
                break;
                
            case AUUStringTransformLatinHebrew:
                stringRef = kCFStringTransformLatinHebrew;
                break;
                
            case AUUStringTransformLatinCyrillic:
                stringRef = kCFStringTransformLatinCyrillic;
                break;
                
            case AUUStringTransformLatinHiragana:
                stringRef = kCFStringTransformLatinHiragana;
                break;
                
            case AUUStringTransformLatinKatakana:
                stringRef = kCFStringTransformLatinKatakana;
                break;
                
            case AUUStringTransformMandarinLatin:
                stringRef = kCFStringTransformMandarinLatin;
                break;
                
            case AUUStringTransformToUnicodeName:
                stringRef = kCFStringTransformToUnicodeName;
                break;
                
            case AUUStringTransformStripDiacritics:
                stringRef = kCFStringTransformStripDiacritics;
                break;
                
            case AUUStringTransformHiraganaKatakana:
                stringRef = kCFStringTransformHiraganaKatakana;
                break;
                
            case AUUStringTransformFullwidthHalfwidth:
                stringRef = kCFStringTransformFullwidthHalfwidth;
                break;
                
            case AUUStringTransformStripCombiningMarks:
                stringRef = kCFStringTransformStripCombiningMarks;
                break;
                
            default:
                break;
        }
        
        if (CFStringTransform((__bridge CFMutableStringRef)ms, 0, stringRef, NO))
        {
            return ms;
        }
        
        return nil;
    }
    
    return nil;
}

+ (NSString *)generateUniqueIdentifier
{
    CFUUIDRef uniqueIdentifier = CFUUIDCreate(NULL);
    CFStringRef uniqueIdentifierString = CFUUIDCreateString(NULL, uniqueIdentifier);
    CFRelease(uniqueIdentifier);
    return CFBridgingRelease(uniqueIdentifierString);
}

@end


static void * p_RangesFromRegularExpressionKey = (void *)@"p_RangesFromRegularExpressionKey";
static void * p_ResultsFromRegularExpressionKey = (void *)@"p_ResultsFromRegularExpressionKey";

@implementation NSString(AUUREString)

- (NSArray *)RERangesMatchedWithPartten:(NSString *)regular
{
    return [self RERangesMatchedWithPartten:regular REOption:NSRegularExpressionCaseInsensitive matchOptions:0];
}

- (NSArray *)RERangesMatchedWithPartten:(NSString *)regular REOption:(NSRegularExpressionOptions)rOptions matchOptions:(NSMatchingOptions)mOptions
{
    NSError *rError;
    
    NSRegularExpression *reg = [[NSRegularExpression alloc] initWithPattern:regular options:rOptions error:&rError];
    
    if (rError)
    {
        return nil;
    }
    
    NSMutableArray *rangeResultsArr = [[NSMutableArray alloc] init];
    
    NSArray *matches = [reg matchesInString:self options:mOptions range:NSMakeRange(0, self.length)];
    
    for (NSTextCheckingResult *match in matches)
    {
        NSMutableArray *rs = [NSMutableArray new];
        
        for (NSInteger i = 0; i < match.numberOfRanges ; i ++)
        {
            NSRange range  = [match rangeAtIndex:i];
            
            [rs addObject:[NSValue valueWithRange:range]];
        }
        
        AUUTextCheckingRange *tcr = [[AUUTextCheckingRange alloc] init];
        
        objc_setAssociatedObject(tcr, p_RangesFromRegularExpressionKey, rs, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        [rangeResultsArr addObject:tcr];
    }
    
    return [rangeResultsArr copy];
}

- (NSArray *)REResultsMatchedWithPartten:(NSString *)regular
{
    return [self REResultsMatchedWithPartten:regular REOption:NSRegularExpressionCaseInsensitive matchOptions:0];
}

- (NSArray *)REResultsMatchedWithPartten:(NSString *)regular REOption:(NSRegularExpressionOptions)rOptions matchOptions:(NSMatchingOptions)mOptions
{
    NSArray *ranges = [self RERangesMatchedWithPartten:regular REOption:rOptions matchOptions:mOptions];
    
    return [self REResultsWithRanges:ranges];
}

- (NSArray *)REResultsWithRanges:(NSArray *)ranges
{
    if (ranges == nil)
    {
        return nil;
    }
    
    NSMutableArray *resArr = [NSMutableArray new];
    
    for (AUUTextCheckingRange *r in ranges)
    {
        NSMutableArray *rs = [NSMutableArray new];
        
        for (NSInteger i = 0; i<r.numberOfRanges; i++)
        {
            NSString *res = [self substringWithRange:[r rangeAtIndex:i]];
            
            [rs addObject:res];
        }
        
        AUUTextCheckingResult *tcr = [[AUUTextCheckingResult alloc] init];
        
        objc_setAssociatedObject(tcr, p_ResultsFromRegularExpressionKey, rs, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        [resArr addObject:tcr];
    }
    
    return [resArr copy];
}

- (NSString *)REResultFirstMatchWithPattern:(NSString *)pattern
{
    return [self REResultFirstMatchWithPattern:pattern REOptions:NSRegularExpressionCaseInsensitive matchOptions:0];
}

- (NSString *)REResultFirstMatchWithPattern:(NSString *)pattern REOptions:(NSRegularExpressionOptions)rOptions matchOptions:(NSMatchingOptions)mOptions
{
    NSArray *results = [self REResultsMatchedWithPartten:pattern REOption:rOptions matchOptions:mOptions];
    
    if (!results || results.count == 0)
    {
        return  nil;
    }
    AUUTextCheckingResult *checkingResult = [results firstObject];
    
    return checkingResult.result;
}

- (BOOL) isLegalObjWithPattern:(NSString *)pattern
{
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    return [pred evaluateWithObject:self];
}

- (BOOL) isLegalURL
{
    return [self isLegalObjWithPattern:@"(https://|http://)?([\\w-]+\\.)+[\\w-]+(/[\\w- ./?%&=]*)?"];
}

- (BOOL) isLegalEMail
{
    return [self isLegalObjWithPattern:@"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"];
}

- (BOOL) isLegalChinaCellPhoneNumber
{
    return [self isLegalObjWithPattern:@"^1[3|5|7|8]\\d{9}$"];
}

- (NSString *)replaceSpecialCharacters
{
    NSArray *results = [self REResultsMatchedWithPartten:@"[\\u4e00-\\u9fa5a-zA-Z0-9]+"];
    
    if (results)
    {
        NSMutableString *resultsString = [[NSMutableString alloc] init];
        
        for (AUUTextCheckingResult *res in results)
        {
            [resultsString appendString:res.result];
        }
        
        return resultsString;
    }
    return nil;
}

- (NSArray *)pickOutNumbers
{
    NSArray *results = [self REResultsMatchedWithPartten:@"\\d+\\.?\\d+"];
    
    if (results)
    {
        NSMutableArray *arr = [NSMutableArray new];
        
        for (AUUTextCheckingResult *res in results)
        {
            NSString *fMatch = res.result;
            
            if ([fMatch containsString:@"."])
            {
                [arr addObject:[NSNumber numberWithFloat:[fMatch floatValue]]];
            }
            else
            {
                [arr addObject:[NSNumber numberWithInteger:[fMatch integerValue]]];
            }
        }
        
        return arr;
    }
    
    return nil;
}

- (NSArray *)pickOutChinese
{
    return [self pickOutObjectsWithPattern:@"[\\u4e00-\\u9fa5]+"];
}

- (NSArray *)pickOutEnglish
{
    return [self pickOutObjectsWithPattern:@"[a-zA-Z]+"];
}

- (NSArray *)pickOutObjectsWithPattern:(NSString *)pattern
{
    NSArray *results = [self REResultsMatchedWithPartten:pattern];
    
    if (results)
    {
        NSMutableArray *arr = [[NSMutableArray alloc] init];
        
        for (AUUTextCheckingResult *res in results)
        {
            [arr addObject:res.result];
        }
        
        return [arr copy];
    }
    
    return nil;
}

- (BOOL)containsString:(NSString *)aString
{
    NSRange range = [self rangeOfString:aString];
    
    if (range.location != NSNotFound)
    {
        return YES;
    }
    
    return NO;
}

- (NSString *)REReplaceOccuredStringByPattern:(NSString *)regular with:(NSString *)replacedString
{
    return [self REReplaceOccuredStringByPattern:regular with:replacedString reOptions:NSRegularExpressionCaseInsensitive matchOptions:0];
}

- (NSString *)REReplaceOccuredStringByPattern:(NSString *)regular with:(NSString *)replacedString reOptions:(NSRegularExpressionOptions)rOptions matchOptions:(NSMatchingOptions)mOptions
{
    NSRegularExpression *regularExpression = [NSRegularExpression regularExpressionWithPattern:regular options:rOptions error:nil];
    
    return [[regularExpression stringByReplacingMatchesInString:self options:mOptions range:NSMakeRange(0, self.length) withTemplate:replacedString] copy];
}

- (NSArray *)splitWithPattern:(NSString *)pattern
{
    NSMutableArray *splitArr = [NSMutableArray new];
    
    NSArray *matches = [self RERangesMatchedWithPartten:pattern];
    
    for (NSInteger i = 0; i < matches.count; i++)
    {
        NSString *splitString;
        
        AUUTextCheckingRange *curCheckingRange = [matches objectAtIndex:i];
        
        NSRange curRange = curCheckingRange.range;
        
        if (i == 0)
        {
            splitString = [self substringWithRange:NSMakeRange(0, curRange.location)];
        }
        else
        {
            AUUTextCheckingRange *lastCheckingRange = [matches objectAtIndex:(i - 1)];
            
            NSRange lastRange = lastCheckingRange.range;
            
            NSInteger curLocation = lastRange.location + lastRange.length;
            
            splitString = [self substringWithRange:NSMakeRange(curLocation, curRange.location - curLocation)];
        }
        
        if (splitString && splitString.length > 0)
        {
            [splitArr addObject:splitString];
        }
        
        if (i == matches.count - 1)
        {
            NSRange curRange = curCheckingRange.range;
            
            NSInteger curLocation = curRange.location + curRange.length;
            
            splitString = [self substringWithRange:NSMakeRange(curLocation, self.length - curLocation)];
            
            if (splitString && splitString.length > 0)
            {
                [splitArr addObject:splitString];
            }
        }
        
        
    }
    
    return [splitArr copy];
}

@end

@implementation AUUTextCheckingRange

- (NSArray *)ranges
{
    id r = objc_getAssociatedObject(self, p_RangesFromRegularExpressionKey);
    
    if (r && ([r isKindOfClass:[NSArray class]] || [r isKindOfClass:[NSMutableArray class]]))
    {
        NSArray *rangesArr = (NSArray *)r;
        
        return [rangesArr copy];
    }
    
    return nil;
}

- (NSInteger)numberOfRanges
{
    NSArray *rangesArr = [self ranges];
    
    return rangesArr ? rangesArr.count : NSNotFound;
}

- (NSRange)range
{
    if (self.numberOfRanges == 0)
    {
        return NSMakeRange(NSNotFound, 0);
    }
    
    return [self rangeAtIndex:0];
}

- (NSRange)rangeAtIndex:(NSInteger)index
{
    NSArray *rangesArr = [self ranges];
    
    if (rangesArr && index < rangesArr.count)
    {
        return [[rangesArr objectAtIndex:index] rangeValue];
    }
    
    return NSMakeRange(NSNotFound, 0);
}

@end

@implementation AUUTextCheckingResult

- (NSArray *)results
{
    id r = objc_getAssociatedObject(self, p_ResultsFromRegularExpressionKey);
    
    if (r && ([r isKindOfClass:[NSArray class]] || [r isKindOfClass:[NSMutableArray class]]))
    {
        NSArray *resultsArr = (NSArray *)r;
        
        return [resultsArr copy];
    }
    
    return nil;
}

- (NSInteger)numberOfResults
{
    NSArray *resultsArr = [self results];
    
    return resultsArr ? resultsArr.count : NSNotFound;
}

- (NSString *)result
{
    if (self.numberOfResults == 0)
    {
        return nil;
    }
    
    return [self resultAtIndex:0];
}

- (NSString *)resultAtIndex:(NSInteger)index
{
    NSArray *resultsArr = [self results];
    
    if (resultsArr && index < resultsArr.count)
    {
        return [resultsArr objectAtIndex:index];
    }
    
    return nil;
}

@end