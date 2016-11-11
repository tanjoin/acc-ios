//
//  TJCampaign.m
//  aac
//

#import "TJCampaign.h"

@implementation TJCampaign

#pragma mark - JSON Model

+ (Class)classForCollectionProperty:(NSString *)propertyName
{
  if ([propertyName isEqualToString:@"urls"] || [propertyName isEqualToString:@"on"]) {
    return [NSString class];
  }
  return [super classForCollectionProperty:propertyName];
}

@end
