//
//  TJDate.h
//  aac
//

#import "TJJsonModel.h"

@interface TJDate : TJJsonModel

@property (strong, nonatomic, nullable) NSDate *start;

@property (strong, nonatomic, nullable) NSDate *end;

@property (readonly, nonatomic, nonnull) NSString *startString;

@property (readonly, nonatomic, nonnull) NSString *endString;

@property (readonly, nonatomic, nonnull) NSString *toString;

@end
