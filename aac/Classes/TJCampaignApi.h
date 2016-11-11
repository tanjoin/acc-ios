//
//  TJCampaignApi.h
//  aac
//

#import <Foundation/Foundation.h>

@interface TJCampaignApi : NSObject

- (void)indexWithCompletion:(void (^)(NSData *data, NSURLResponse *response, NSError *error))completion;

@end
