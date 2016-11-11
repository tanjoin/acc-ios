//
//  TJViewController.m
//  aac
//

#import "TJViewController.h"
#import "TJCampaignApi.h"
#import "TJCampaignsResponse.h"
#import "TJCampaign.h"
#import "TJTableViewCell.h"

@interface TJViewController ()

@property (copy, nonatomic, nullable) TJCampaignsResponse *campaignsResponse;

@end

@implementation TJViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([TJTableViewCell class]) bundle:nil]
       forCellReuseIdentifier:NSStringFromClass([TJTableViewCell class])];
  
  TJCampaignApi *campaignApi = [[TJCampaignApi alloc] init];
  [campaignApi indexWithCompletion:^(NSData *data, NSURLResponse *response, NSError *error) {
    if (error) {
      return;
    }
    _campaignsResponse = [[TJCampaignsResponse alloc] initWithData:data error:&error];
    [self.tableView reloadData];
  }];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  if (_campaignsResponse) {
    return _campaignsResponse.campaigns.count;
  }
  return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  TJTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([TJTableViewCell class])];
  if (_campaignsResponse) {
    TJCampaign *campaign = _campaignsResponse.campaigns[indexPath.row];
    if (campaign) {
      [cell setCampaign:campaign];
    }
  }
  return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  if (!_campaignsResponse) {
    return;
  }

  TJCampaign *campaign = _campaignsResponse.campaigns[indexPath.row];
  
  if (campaign.urls.count == 0) {
    return;
  }

  NSString *url = campaign.urls[0];
  
  // open with Chrome
  NSURL *inputURL = [NSURL URLWithString:url];
  NSString *scheme = inputURL.scheme;
  NSString *chromeScheme = nil;
  if ([scheme isEqualToString:@"http"]) {
    chromeScheme = @"googlechrome";
  } else if ([scheme isEqualToString:@"https"]) {
    chromeScheme = @"googlechromes";
  }
  
  if (chromeScheme) {
    NSString *absoluteString = [inputURL absoluteString];
    NSRange rangeForScheme = [absoluteString rangeOfString:@":"];
    NSString *urlNoScheme =
    [absoluteString substringFromIndex:rangeForScheme.location];
    NSString *chromeURLString =
    [chromeScheme stringByAppendingString:urlNoScheme];
    NSURL *chromeURL = [NSURL URLWithString:chromeURLString];
    
    // Open the URL with Chrome.
    [[UIApplication sharedApplication] openURL:chromeURL options:@{} completionHandler:^(BOOL success) {
      if (!success) {
        [[UIApplication sharedApplication] openURL:inputURL options:@{} completionHandler:nil];
      }
    }];
  }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  TJTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([TJTableViewCell class])];
  
  TJCampaign *campaign = _campaignsResponse.campaigns[indexPath.row];
  if (campaign) {
    [cell setCampaign:campaign];
  }
  
  [cell.contentView setNeedsLayout];
  [cell.contentView layoutIfNeeded];
  
  CGSize size = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
  
  return size.height;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  return 60.0;
}

@end
