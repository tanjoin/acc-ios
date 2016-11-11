//
//  JSONValueTransformer+TJ.m
//  aac
//

#import "JSONValueTransformer+TJ.h"

@implementation JSONValueTransformer (TJ)

- (nullable NSDate *)NSDateFromNSString:(nullable NSString *)string
{
  NSArray *dateFormats = @[
                           @"yyyy/MM/dd HH:mm",
                           @"yyyy/MM/dd"
                           ];
  
  NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
  formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];

  
  NSDate *convertedDate = nil;
  for (NSString *dateFormat in dateFormats) {
    [formatter setDateFormat:dateFormat];
    NSDate *date = [formatter dateFromString:string];
    if (date) {
      convertedDate = date;
      break;
    }
  }
  return convertedDate;
}

- (nullable NSString *)JSONOBjectFromNSDate:(nullable NSDate *)date
{
  NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
  formatter.dateFormat = @"yyyy/MM/dd HH:mm";
  formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
  return [formatter stringFromDate:date];
}

@end
