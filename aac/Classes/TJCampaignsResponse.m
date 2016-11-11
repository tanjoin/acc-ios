//
//  TJCampaigns.m
//  aac
//

#import "TJCampaignsResponse.h"

@implementation TJCampaignsResponse

#pragma mark - JSON Model

+ (Class)classForCollectionProperty:(NSString *)propertyName
{
  if ([propertyName isEqualToString:@"campaigns"]) {
    return [TJCampaign class];
  }
  return [super classForCollectionProperty:propertyName];
}

@end
