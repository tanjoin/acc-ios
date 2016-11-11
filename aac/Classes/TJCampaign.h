//
//  TJCampaign.h
//  aac
//

#import "TJJsonModel.h"
#import "TJDate.h"
#import "TJOn.h"

@interface TJCampaign : TJJsonModel

@property (copy, nonatomic, nullable) NSString *identifier;

@property (copy, nonatomic, nullable) NSString *title;

@property (copy, nonatomic, nullable) NSString *descriptionText;

@property (copy, nonatomic, nullable) NSArray<NSString *> *urls;

@property (copy, nonatomic, nullable) NSString *serviceTitle;

@property (copy, nonatomic, nullable) NSString *img;

@property (copy, nonatomic, nullable) TJDate *date;

@property (copy, nonatomic, nullable) NSArray<NSString *> *on;

@end
