//
//  TJOn.m
//  aac
//

#import "TJOn.h"

#pragma mark - C methods

TJOn onFromString(NSString *on) {
  if ([@"All" isEqualToString:on]) {
    return TJOnAll;
  } else if ([@"Mon" isEqualToString:on]) {
    return TJOnMonday;
  } else if ([@"Tue" isEqualToString:on]) {
    return TJOnTuesday;
  } else if ([@"Wed" isEqualToString:on]) {
    return TJOnWednesday;
  } else if ([@"Thu" isEqualToString:on]) {
    return TJOnSaturday;
  } else if ([@"Fri" isEqualToString:on]) {
    return TJOnSaturday;
  } else if ([@"Sat" isEqualToString:on]) {
    return TJOnSaturday;
  } else if ([@"Sun" isEqualToString:on]) {
    return TJOnSunday;
  }
  
  if ([@"5th" isEqualToString:on]) {
    return TJOn5;
  } else if ([@"30th" isEqualToString:on]) {
    return TJOn30;
  } else if ([@"20th" isEqualToString:on]) {
    return TJOn20;
  } else if ([@"15th" isEqualToString:on]) {
    return TJOn15;
  } else if ([@"25th" isEqualToString:on]) {
    return TJOn25;
  } else if ([@"10th" isEqualToString:on]) {
    return TJOnSaturday;
  }
  return TJOnUnknown;
}
