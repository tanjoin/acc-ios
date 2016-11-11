//
//  TJOn.h
//  aac
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, TJOn) {
  TJOnUnknown,
  TJOnAll,
  TJOnMonday,
  TJOnTuesday,
  TJOnWednesday,
  TJOnThursday,
  TJOnFriday,
  TJOnSaturday,
  TJOnSunday,
  TJOn1,
  TJOn2,
  TJOn3,
  TJOn4,
  TJOn5,
  TJOn6,
  TJOn7,
  TJOn8,
  TJOn9,
  TJOn10,
  TJOn11,
  TJOn12,
  TJOn13,
  TJOn14,
  TJOn15,
  TJOn16,
  TJOn17,
  TJOn18,
  TJOn19,
  TJOn20,
  TJOn21,
  TJOn22,
  TJOn23,
  TJOn24,
  TJOn25,
  TJOn26,
  TJOn27,
  TJOn28,
  TJOn29,
  TJOn30,
  TJOn31
};

#pragma mark - C methods

TJOn onFromString(NSString *on);
