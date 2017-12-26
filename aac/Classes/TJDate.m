//
//  TJDate.m
//  aac
//

#import "TJDate.h"

@implementation TJDate

- (NSString *)toString {
    return [NSString stringWithFormat:@"%@ - %@", self.startString, self.endString];
}

- (NSString *)startString {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateStyle = NSDateFormatterMediumStyle;
    dateFormatter.timeStyle = NSDateFormatterNoStyle;
    NSString *dateString = [dateFormatter stringFromDate:_start];
    if ([dateString length] == 0) {
        return @"";
    }
    return dateString;
}

- (NSString *)endString {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateStyle = NSDateFormatterMediumStyle;
    dateFormatter.timeStyle = NSDateFormatterNoStyle;
    NSString *dateString = [dateFormatter stringFromDate:_end];
    if ([dateString length] == 0) {
        return @"";
    }
    return dateString;
}

@end
