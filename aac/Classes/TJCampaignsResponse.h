//
//  TJCampaigns.h
//  aac
//

#import "TJJsonModel.h"
#import "TJCampaign.h"

@interface TJCampaignsResponse : TJJsonModel

@property (copy, nonatomic, nullable) NSArray<TJCampaign *> *campaigns;

@end
