#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    if (monthNumber<1 || monthNumber>12) {
        return nil;
    }
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    return [[dateFormatter monthSymbols] objectAtIndex:(int) monthNumber-1];
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
    NSDate *tempDate = [dateFormatter dateFromString:date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [calendar components: NSCalendarUnitDay | NSCalendarUnitWeekday fromDate: tempDate];
    return [dateComponents day];
    //return 0;
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru"];
    [dateFormatter setLocale:locale];
    [dateFormatter setDateFormat:@"E"];
    return [dateFormatter stringFromDate:date];
    //return nil;
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    NSDate *currentDate = [NSDate date];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    calendar.firstWeekday = 2;
    NSDate *startWeek;
    NSDate *endWeek;
    NSTimeInterval interval;
    [calendar rangeOfUnit:NSCalendarUnitWeekOfYear startDate:&startWeek interval:&interval forDate:currentDate];
    endWeek = [startWeek dateByAddingTimeInterval:interval-1];
    if ([startWeek isEqual:[startWeek earlierDate:date]] && [date isEqual:[date earlierDate:endWeek]]) {
        return YES;
    } else return NO;
}

@end
