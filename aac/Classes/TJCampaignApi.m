//
//  TJCampaignApi.m
//  aac
//

#import "TJCampaignApi.h"

@implementation TJCampaignApi

- (void)indexWithCompletion:(void (^)(NSData *data, NSURLResponse *response, NSError *error))completion
{
  NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
  [request setHTTPMethod:@"GET"];
  [request setURL:[NSURL URLWithString:@"https://tanjo.in/acc/campaign.json"]];
  
  NSURLSessionDataTask *task = [[NSURLSession sharedSession]
                                dataTaskWithRequest:request
                                completionHandler:completion];
  [task resume];
}

@end
