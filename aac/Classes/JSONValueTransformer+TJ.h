//
//  JSONValueTransformer+TJ.h
//  aac
//

#import <JSONModel/JSONModel.h>

@interface JSONValueTransformer (TJ)

- (nullable NSDate *)NSDateFromNSString:(nullable NSString *)string;
- (nullable NSString *)JSONOBjectFromNSDate:(nullable NSDate *)date;

@end
